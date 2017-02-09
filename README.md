# appninja

vagrant up

cd NinjagenLog

docker build -t log_generator .

docker run -it --add-host elastic:<YOUR_IP_ADDRESS> --name ninja_log_gen log_generator
