// Hall Sensor Class for Hannah
//
// Requires: io-expander.squirrel
//
// Usage: 
// local output = OutputPort("Sensor", "number");
// sensor <- HallSensor(I2C_89, 0x3e, 2, hardware.pin1, output)
//


class HallSensor extends IoExpander
{
    // IO Pin assignment
    pin = null;
    irq = null;
 
    // Output port
    outPort = null;
 
    constructor(port, address, hallPin, irqPin, out)
    {
        base.constructor(port, address);
 
        // Save assignments
        pin = hallPin;
        irq = irqPin;
        outPort = out;
 
        // Set event handler for irq
        irqPin.configure(DIGITAL_IN, irqHandler.bindenv(this));
 
        // Configure pin as input, irq on both edges
        setDir(pin, 0);
        setIrqMask(pin, 0);
        setIrqEdges(pin, 1, 1);
    }
 
    function irqHandler()
    {
        if(irq.read() == 0)
        {
            // Negative going = interrupt from hall pin state change
 
            // Get the pin state
            local state = getPin(pin)?0:1;
 
            // Output to port and display on node
            outPort.set(state);
            server.show(state);
        }
 
        // Clear the interrupt
        clearIrq(pin);
    }
}