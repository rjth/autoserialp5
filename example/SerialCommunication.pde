import processing.serial.*;

SerialConnection serialConnection;

void setup()
{
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