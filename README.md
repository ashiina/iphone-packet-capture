# iphone-packet-capture
A small iPhone packet capture tool

## Supported OS
 * Mac OSX 10.11~

## Usage
 1. Set your UDID
   * `sh iphone_capture.sh udid <your_udid>`
   * To retrieve your UDID, connect your iPhone via USB, then open iTunes, and view your device. UDID should be shownt 
 2. Start capturing 
   * `sh iphone_capture.sh start`
 3. Finish capturing
   * `sh iphone_capture.sh stop`
 4. The captured file will be saved in `yyyymmdd_hhmmss.dump`. You can open this file via Wireshark to view details. 

Enjoy packet capturing!

## Caution
Reserve-engineering certain commercial softwares may be breaking the providers' Terms of Services. Use this at your own risk. 

## License  
This library is released under the MIT license.


