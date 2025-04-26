# FSM-based-Candy-Dispenser
FSM based FIFO similar to the vending machine design, but includes inserting coins of certain denominations.

## Working
The candy bars inside the vending machine cost 25 cents, and the machine accepts nickels (5c), dimes (10c) and quarters (25c). The input to the controls are a set of three signals that indicate the type of coin deposited, as well as a reset signal. The control generates an output signal that causes a candy to be dispensed whenever the amount of money received is 25c or more (change is returned). Once candy has been delivered, an external circuitry will generate a reset signal to put control back to the initial state.

## Results
![image](https://github.com/user-attachments/assets/f95dd1ed-3555-4506-9814-7672a0b8a4e5)

