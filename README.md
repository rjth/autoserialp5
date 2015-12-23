# autoserialp5

Allows "plug and play" serial communication between Processing and Arduino or other serial devices. Works on Windows, Mac and Linux.
***

### Example

```
import processing.serial.*;

SerialConnection serialConnection;

void setup()
{
	//Choose the correct baud rate for your serial device, in this example we use 9600
	serialConnection = new SerialConnection(this, 9600);
}

void draw()
{
	serialConnection.startSerialCommincation();
	if(serialConnection.isReady)
	{
		//Do something
	}
}
```
	

### Usage

After running your Processing application, connect your serial device to one of the USB ports of your computer. Your device should be recognised and the communication should be established automatically. Before running your application make sure that the serial device is disconnected from your computer.

`startSerialCommunication()` should be always called inside the main loop.

Also make sure you have the Processing [Serial library](https://github.com/processing/processing/tree/master/java/libraries/serial) installed.
***

### Credits

Thanks to Starting Electronics for their [Find Arduino Port](https://startingelectronics.org/software/processing/find-arduino-port/) example.
***
