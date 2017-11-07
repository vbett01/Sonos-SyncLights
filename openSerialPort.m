function obj = openSerialPort(comPort)
% function obj = openSerialPort(comPort)
% opens serial port and returns object
% calling example
% obj = openSerialPort('COM3');

obj = serial(comPort);
set(obj,'DataBits',8);
set(obj,'Parity','none');
fopen(obj);

return