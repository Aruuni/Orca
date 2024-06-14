
port=44444
delay=20
trace=/home/sage/Orca/traces/wired48
log=/home/sage/Orca/rl-module/log/wired48.log
qsize=160
path=/home/sage/Orca/rl-module
period=20
scheme="cubic"
id=0
finish_time=30
max_it=0


./run_server.sh ${port} ${path} ${period} ${scheme} ${finish_time} &
./run_client.sh ${port} ${delay} ${trace} ${log}.1 ${qsize} 1 &


