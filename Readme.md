# Installation

To use this mod with your Flashforge AD5X/AD5M/AD5M Pro:

1. Install zMod: https://github.com/ghzserg/zmod
2. In the file ```mod_data/user.moonraker.conf```, add the following section:
```ini
[update_manager g28_tenz]
type: git_repo
channel: dev
path: /root/printer_data/config/mod_data/plugins/g28_tenz
origin: https://github.com/ghzserg/g28_tenz.git
is_system_service: False
primary_branch: main
```
3. Run the command: ```ENABLE_PLUGIN name=g28_tenz```

# Warning

When homing using load cells:
- If the bed was at 220 degrees Z at the time of parking, there will be a blow
- The nozzle must be clean
- The bed must be empty
- Print recovery will not work, as the bed is not empty

Use this module at your own risk.
