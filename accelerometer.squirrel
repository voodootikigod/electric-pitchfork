// Accelerometer Class
//
// Requires: io-expander.squirrel
//
// Usage: 
// local accelerometer = Accelerometer(I2C_89, 0x1c);
// accelerometer.getX();
// accelerometer.getY();
// accelerometer.getZ();
//

class Accelerometer extends IoExpander // clearly, this is not really an IOExpander, we're just nicking it's read() function
{
    constructor(port, address)
    {
        base.constructor(port, address);
        
        write(0x20, 0x41); // Bring device out of power-down, X axis enabled
        write(0x22, 0x1b); // Both interrupt lines are active
        write(0x30, 0x02); // Wake-up config when x axis exceeds threshold
        write(0x32, 0x01); // Wake-up threshold
        write(0x33, 0x32); // Signal for ages on triggering
        write(0x14, 0xff);
        write(0x15, 0xff);
        write(0x16, 0xff);
        write(0x17, 0xff); // Edge-sensitivity: all
        setDir(3, 0);
        setPullUp(3, true);
    }
 
    function getZ() {
        return read(0x2d);
    }
    function getY() {
        return read(0x2b);
    }
    function getX() {
        return read(0x29);
    }
}