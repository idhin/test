x=1
sleep 5000s
while :
do

aws configure set region ca-central-1
./restart.sh

echo "selesai region ca-central-1"

aws configure set region eu-central-1
./restart.sh

echo "selesai region eu-central-1"

aws configure set region eu-west-1
./restart.sh

echo "selesai region eu-west-1"

aws configure set region eu-west-2
./restart.sh

echo "selesai region eu-west-2"

aws configure set region ap-south-1
./restart.sh
echo "selesai region ap-south-1"

aws configure set region eu-west-3
./restart.sh
echo "selesai region eu-west-3"

aws configure set region eu-north-1
./restart.sh
echo "selesai region eu-north-1"

aws configure set region sa-east-1
./restart.sh

echo "selesai region sa-east-1"


sleep 5000s

done
