nobase_lib_LTLIBRARIES += opencryptoki/stdll/libpkcs11_tpm.la

noinst_HEADERS += 							\
	usr/lib/tpm_stdll/defs.h usr/lib/tpm_stdll/tpm_specific.h	\
	usr/lib/tpm_stdll/tok_struct.h

opencryptoki_stdll_libpkcs11_tpm_la_CFLAGS =				\
	-DLINUX -DNOCDMF -DNODSA -DNODH	-DMMAP				\
	-DTOK_NEW_DATA_STORE=0xffffffff					\
	-I${srcdir}/usr/lib/tpm_stdll -I${srcdir}/usr/lib/common	\
	-I${srcdir}/usr/include	-DSTDLL_NAME=\"tpmtok\"			\
	-I${top_builddir}/usr/lib/api -I${srcdir}/usr/lib/api

opencryptoki_stdll_libpkcs11_tpm_la_LDFLAGS =				\
	-shared -Wl,-z,defs,-Bsymbolic -lcrypto -ltspi -lpthread -lrt	\
	-Wl,--version-script=${srcdir}/opencryptoki_tok.map

opencryptoki_stdll_libpkcs11_tpm_la_SOURCES =				\
	usr/lib/common/asn1.c usr/lib/common/dig_mgr.c			\
	usr/lib/common/hwf_obj.c usr/lib/common/trace.c			\
	usr/lib/common/key.c usr/lib/common/mech_dh.c			\
	usr/lib/common/mech_rng.c usr/lib/common/new_host.c		\
	usr/lib/common/sign_mgr.c usr/lib/common/cert.c			\
	usr/lib/common/dp_obj.c	usr/lib/common/mech_aes.c		\
	usr/lib/common/mech_rsa.c usr/lib/common/mech_ec.c		\
	usr/lib/common/obj_mgr.c usr/lib/common/template.c		\
	usr/lib/common/p11util.c usr/lib/common/data_obj.c		\
	usr/lib/common/encr_mgr.c usr/lib/common/key_mgr.c		\
	usr/lib/common/mech_md2.c usr/lib/common/mech_sha.c		\
	usr/lib/common/object.c	usr/lib/common/decr_mgr.c		\
	usr/lib/common/globals.c usr/lib/common/sw_crypt.c		\
	usr/lib/common/loadsave.c usr/lib/common/utility.c		\
	usr/lib/common/mech_des.c usr/lib/common/mech_des3.c		\
	usr/lib/common/mech_md5.c usr/lib/common/mech_ssl3.c		\
	usr/lib/common/verify_mgr.c usr/lib/common/mech_list.c		\
	usr/lib/common/shared_memory.c usr/lib/common/profile_obj.c	\
	usr/lib/tpm_stdll/tpm_specific.c usr/lib/common/attributes.c	\
	usr/lib/tpm_stdll/tpm_openssl.c usr/lib/tpm_stdll/tpm_util.c	\
	usr/lib/common/dlist.c usr/lib/common/mech_openssl.c		\
	usr/lib/common/utility_common.c usr/lib/common/ec_supported.c	\
	usr/lib/api/policyhelper.c

if ENABLE_LOCKS
opencryptoki_stdll_libpkcs11_tpm_la_SOURCES +=				\
	usr/lib/common/lock_btree.c usr/lib/common/lock_sess_mgr.c
else
opencryptoki_stdll_libpkcs11_tpm_la_LDFLAGS += -litm
opencryptoki_stdll_libpkcs11_tpm_la_SOURCES +=				\
	usr/lib/common/btree.c						\
	usr/lib/common/sess_mgr.c
endif
