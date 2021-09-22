name=nithin
timestamp=$(date '+%d%m%Y-%H%M%S')
s3_bucket=upgrad-nithin

sudo apt-get update

sudo apt-get install apache2

systemctl enable apache2.service

systemctl start apache2.service

sudo apt update
sudo apt install awscli


tar -zcvf $name-httpd-logs-$timestamp.tar.gz /var/log/apache2/*.log

echo “tar succesful”

mv *.gz  /tmp


aws s3 cp /tmp/$name-httpd-logs-$timestamp.tar.gz s3://$s3_bucket
echo “ copied to S3”
