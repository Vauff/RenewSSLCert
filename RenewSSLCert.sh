echo Creating new certificate...
openssl genrsa 4096 > account.key
openssl genrsa 4096 > domain.key
openssl req -new -sha256 -key domain.key -subj "/CN=vauff.me" > domain.csr
python acme_tiny.py --account-key ./account.key --csr ./domain.csr --acme-dir /var/www/html/.well-known/acme-challenge/ > ./signed.crt
cat domain.key signed.crt lets-encrypt-x3-cross-signed.pem > certificate.pem
cp certificate.pem /home/Vauff/.znc/znc.pem
cp certificate.pem /home/Vauff/.config/quassel-irc.org/quasselCert.pem
cp domain.key /etc/httpd
cp signed.crt /etc/httpd
echo New ceritificate created successfully!
