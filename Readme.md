# Load cell parking
**Load cell parking** is a method to gently and precisely "park" the print head in a safe position **using sensors that measure force**.

Instead of simply stopping the head at a mechanical limit (as in standard homing), the printer **slowly lowers the nozzle until it lightly touches the bed**, detecting this contact by monitoring the change in force on the load cells. This allows you to:

- Precisely determine the true bed position,  
- Avoid Z-offset issues.

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
