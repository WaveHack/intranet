#!/usr/bin/env sh

openssl x509 \
  -x509toreq \
  -in ../certs/ca.crt \
  -signkey ../certs/ca.key \
  -out ../certs/ca.csr

openssl x509 \
  -req \
  -days 365 \
  -in ../certs/ca.csr \
  -signkey ../certs/ca.key \
  -out ../certs/ca.crt

rm ../certs/ca.csr

openssl x509 \
  -x509toreq \
  -in ../certs/home.arpa.crt \
  -signkey ../certs/home.arpa.key \
  -out ../certs/home.arpa.csr \
  -copy_extensions copyall

openssl x509 \
  -req \
  -days 365 \
  -in ../certs/home.arpa.csr \
  -CA ../certs/ca.crt \
  -CAkey ../certs/ca.key \
  -out ../certs/home.arpa.crt \
  -copy_extensions copyall

rm ../certs/home.arpa.csr
