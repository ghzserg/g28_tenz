# Load cell parking
**Load cell parking** is a method to gently and precisely "park" the print head in a safe position **using sensors that measure force**.

Instead of simply stopping the head at the stop (as in a normal parking situation), the printer **slowly raises the table until it lightly touches the nozzle**, recording this touch by changing the load on the load cells. This allows you to:

- Precisely determine the true bed position,  
- Avoid Z-offset issues.

Attention! It's recommended to set Z-Offset to 0.0. Then, adjust it.

# Installation

To use this mod with your Flashforge AD5X/AD5M/AD5M Pro:

1. Install zMod: https://github.com/ghzserg/zmod  
2. [Update zMod](https://github.com/ghzserg/zmod/wiki/Setup_en#updating-the-mod)
2. Run the command: ```ENABLE_PLUGIN name=g28_tenz```

# Removal

Run the command: ```DISABLE_PLUGIN name=g28_tenz```

# Warning

When homing using load cells:
- The nozzle must be clean  
- The bed must be empty  
- Print recovery will not work, as the bed is not empty  

Use this module at your own risk.
