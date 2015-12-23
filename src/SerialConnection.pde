class SerialConnection
{
	Serial serialPort;
	PApplet app;
	int baud;
	int numberOfPorts;
	boolean deviceDetected = false;
	boolean isReady = false;
	String[] portList;
	String detectedPort;
   	
	SerialConnection(PApplet _app, int _baud)
	{
		app = _app;
		baud = _baud;
		getSerialPorts();
	}

	void getSerialPorts()
	{
    	printArray(serialPort.list());
    	println("Connect device");
    	numberOfPorts = serialPort.list().length;
    	portList = new String[numberOfPorts];
    	for(int i = 0; i < numberOfPorts; i++)
    	{
    	    portList[i] = serialPort.list()[i];
    	}
	}

	void startSerialCommunication()
	{
	    if((serialPort.list().length > numberOfPorts) && !deviceDetected)
	    {
	        deviceDetected = true;
	        boolean str_match = false;
	        if(numberOfPorts == 0)
	        {
	            detectedPort = serialPort.list()[0];
	        }
	        else
	        {
	            for(int i = 0; i < serialPort.list().length; i++)
	            {
	                for(int j = 0; j < numberOfPorts; j++)
	                {
	                    if(serialPort.list()[i].equals(portList[j]))
	                    {
	                        break;
	                    }
	                    if(j == (numberOfPorts - 1))
	                    {
	                        str_match = true;
	                        detectedPort = serialPort.list()[i];
	                    }
	                }
	            }
	        }
	        println("Device detected");
	        establishCommunication();
	    }
	    terminateCommunication();
	}

	void establishCommunication()
	{
		delay(100);
    	serialPort = new Serial(app, detectedPort, baud);
    	isReady = true;
    	println("Serial communication established at: " + detectedPort);
	}

	void terminateCommunication()
	{
		if(keyPressed) if(key == 'œ')
		{
			try
			{
				serialPort.clear();
				serialPort.stop();
				println("Serial communication terminated");
				exit();
			}
			catch(Exception e)
			{
				exit();
			}
		}
	}
}