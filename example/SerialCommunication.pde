import processing.serial.*;

SerialConnection serialConnection;

void setup()
{
	serialConnection = new SerialConnection(this, 9600);
}

void draw()
{
	serialConnection.startSerialCommunication();

	if(serialConnection.isReady)
	{
		//Do something
	}
}