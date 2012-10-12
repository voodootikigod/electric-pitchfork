// RGB LED Class
//
// Requires: io-expander.squirrel
//
// Usage: 
// local led = RgbLed(I2C_89, 0x3E, 7, 5, 6);
// led.setLevels(255, 255, 255);
//

class RgbLed extends IoExpander
{
    // IO Pin assignments
    pinR = null;
    pinG = null;
    pinB = null;
 
    constructor(port, address, r, g, b)
    {
        base.constructor(port, address);
 
        // Save pin assignments
        pinR = r;
        pinG = g;
        pinB = b;
 
        // Disable pin input buffers
        writeBit(pinR>7?0x00:0x01, pinR>7?(pinR-7):pinR, 1);
        writeBit(pinG>7?0x00:0x01, pinG>7?(pinG-7):pinG, 1);
        writeBit(pinB>7?0x00:0x01, pinB>7?(pinB-7):pinB, 1);
 
        // Set pins as outputs
        writeBit(pinR>7?0x0E:0x0F, pinR>7?(pinR-7):pinR, 0);
        writeBit(pinG>7?0x0E:0x0F, pinG>7?(pinG-7):pinG, 0);
        writeBit(pinB>7?0x0E:0x0F, pinB>7?(pinB-7):pinB, 0);
 
        // Set pins open drain
        writeBit(pinR>7?0x0A:0x0B, pinR>7?(pinR-7):pinR, 1);
        writeBit(pinG>7?0x0A:0x0B, pinG>7?(pinG-7):pinG, 1);
        writeBit(pinB>7?0x0A:0x0B, pinB>7?(pinB-7):pinB, 1);
 
        // Enable LED drive
        writeBit(pinR>7?0x20:0x21, pinR>7?(pinR-7):pinR, 1);
        writeBit(pinG>7?0x20:0x21, pinG>7?(pinG-7):pinG, 1);
        writeBit(pinB>7?0x20:0x21, pinB>7?(pinB-7):pinB, 1);
 
        // Set to use internal 2MHz clock, linear fading
        write(0x1e, 0x50);
        write(0x1f, 0x10);
 
        // Initialise as inactive
        setLevels(0, 0, 0);
        setPin(pinR, 0);
        setPin(pinG, 0);
        setPin(pinB, 0);
    }
 
    // Set LED enabled state
    function setLed(r, g, b)
    {
        if(r != null) writeBit(pinR>7?0x20:0x21, pinR&7, r);
        if(g != null) writeBit(pinG>7?0x20:0x21, pinG&7, g);
        if(b != null) writeBit(pinB>7?0x20:0x21, pinB&7, b);
    }
 
    // Set red, green and blue intensity levels
    function setLevels(r, g, b)
    {
        if(r != null) write(pinR<4?0x2A+pinR*3:0x36+(pinR-4)*5, r);
        if(g != null) write(pinG<4?0x2A+pinG*3:0x36+(pinG-4)*5, g);
        if(b != null) write(pinB<4?0x2A+pinB*3:0x36+(pinB-4)*5, b);
    }
}