echo Creating new certificate...
openssl genrsa 4096 > account.key
openssl genrsa 4096 > domain.key
openssl req -new -sha256 -key domain.key -subj "/CN=vauff.me" > domain.csr
sudo python acme_tiny.py --account-key ./account.key --csr ./domain.csr --acme-dir /var/www/html/.well-known/acme-challenge/ > ./signed.crt
cat domain.key signed.crt lets-encrypt-x1-cross-signed.pem > certificate.pem
cp certificate.pem /home/Vauff/.znc/znc.pem
cp certificate.pem /home/Vauff/.config/quassel-irc.org/quasselCert.pem
rm account.key
rm domain.key
rm domain.csr
rm signed.crt
echo New ceritificate created successfully!
