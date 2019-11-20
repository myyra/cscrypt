#!/usr/bin/env bash

source scrypt.version

mkdir -p .scrypt
cd .scrypt

wget "https://www.tarsnap.com/scrypt/scrypt-${SCRYPT_VERSION}.tgz"
wget "https://www.tarsnap.com/scrypt/scrypt-sigs-${SCRYPT_VERSION}.asc"

gpg --decrypt scrypt-sigs-${SCRYPT_VERSION}.asc

sha256sum scrypt-${SCRYPT_VERSION}.tgz

tar -xf scrypt-${SCRYPT_VERSION}.tgz

rm scrypt-sigs-${SCRYPT_VERSION}.asc
rm scrypt-${SCRYPT_VERSION}.tgz

cd -

# Config is not needed since we're not using optimizations and causes compile issues
sed '/#include \"platform.h\"/d' .scrypt/scrypt-${SCRYPT_VERSION}/lib/crypto/crypto_scrypt.c > Sources/CScrypt/crypto_scrypt.c

cp .scrypt/scrypt-${SCRYPT_VERSION}/lib/crypto/crypto_scrypt_smix.c Sources/CScrypt
cp .scrypt/scrypt-${SCRYPT_VERSION}/libcperciva/alg/sha256.c Sources/CScrypt
cp .scrypt/scrypt-${SCRYPT_VERSION}/libcperciva/cpusupport/cpusupport_x86_sse2.c Sources/CScrypt
cp .scrypt/scrypt-${SCRYPT_VERSION}/libcperciva/util/insecure_memzero.c Sources/CScrypt
cp .scrypt/scrypt-${SCRYPT_VERSION}/libcperciva/util/warnp.c Sources/CScrypt

cp .scrypt/scrypt-${SCRYPT_VERSION}/lib/crypto/crypto_scrypt.h Sources/CScrypt/include
cp .scrypt/scrypt-${SCRYPT_VERSION}/lib/crypto/crypto_scrypt_smix.h Sources/CScrypt/include
cp .scrypt/scrypt-${SCRYPT_VERSION}/lib/crypto/crypto_scrypt_smix_sse2.h Sources/CScrypt/include
cp .scrypt/scrypt-${SCRYPT_VERSION}/libcperciva/alg/sha256.h Sources/CScrypt/include
cp .scrypt/scrypt-${SCRYPT_VERSION}/libcperciva/alg/sha256_shani.h Sources/CScrypt/include
cp .scrypt/scrypt-${SCRYPT_VERSION}/libcperciva/cpusupport/cpusupport.h Sources/CScrypt/include
cp .scrypt/scrypt-${SCRYPT_VERSION}/libcperciva/util/insecure_memzero.h Sources/CScrypt/include
cp .scrypt/scrypt-${SCRYPT_VERSION}/libcperciva/util/warnp.h Sources/CScrypt/include
cp .scrypt/scrypt-${SCRYPT_VERSION}/libcperciva/util/sysendian.h Sources/CScrypt/include
