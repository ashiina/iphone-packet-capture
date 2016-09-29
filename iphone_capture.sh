
# # iPhone packet capture tool.
# ## Supported OS
#  * Mac OSX 10.11~
# ## Usage
#  1. Set your UDID
#    * `sh iphone_capture.sh udid <your_udid>`
#    * To retrieve your UDID, connect your iPhone via USB, then open iTunes, and view your device. UDID should be shownt 
#  2. Start capturing 
#    * `sh iphone_capture.sh start`
#  3. Finish capturing
#    * `sh iphone_capture.sh stop`
#  4. The captured file will be saved in `yyyymmdd_hhmmss.dump`. You can open this file via Wireshark to view details. 
#
# Enjoy packet capturing!

my_udid=""
now_dt=`date +%Y%m%d_%H%M%S`

DUMP_FILE="${now_dt}.dump"
MY_UDID_FILE="./my.udid"
C_GREEN="\033[0;32m"
C_RED="\033[0;31m"
C_OFF="\033[m"

set_my_udid () {
  echo "$my_udid" > $MY_UDID_FILE
}

get_my_udid () {
  my_udid=`cat $MY_UDID_FILE`
}

start () {
  get_my_udid
  # set interface
  rvictl -s $my_udid
  # capture tcp from interface
  tcpdump -i rvi0 -w $DUMP_FILE
}

stop () {
  get_my_udid
  # close interface
  rvictl -x $my_udid
}

command="$1"
if [ $command = "udid" ]; then
  echo "Capture: $C_GREEN SET UDID: $C_OFF $2"
  my_udid="$2"
  set_my_udid
fi
if [ $command = "start" ]; then
  echo "Capture: $C_GREEN STARTING $C_OFF"
  start
fi
if [ $command = "stop" ]; then
  echo "Capture: $C_RED STOPPING $C_OFF"
  stop
fi



