# Plugins in Zmod

Any user can create their own plugin and integrate it into **zmod**.

Plugin example: https://github.com/ghzserg/g28_tenz
(Throughout the examples below, the plugin name `g28_tenz` is used — replace it with your own plugin name as needed.)

---

## Adding a Plugin

In the file
```mod_data/user.moonraker.conf```
add the following section:

```ini
[update_manager g28_tenz]
type: git_repo
channel: dev
path: /root/printer_data/config/mod_data/plugins/g28_tenz
origin: https://github.com/ghzserg/g28_tenz.git
is_system_service: False
primary_branch: main
```

- **Plugin path**: `/root/printer_data/config/mod_data/plugins/g28_tenz`
- **Source URL**: `https://github.com/ghzserg/g28_tenz.git`

> Stable plugins may be included in the zmod distribution, but they are updated and maintained by their respective authors.

---

## Plugin Management

**Enable plugin:**
```gcode
ENABLE_PLUGIN name=g28_tenz
```
— Downloads the plugin and restarts Klipper if successful.

**Disable plugin:**
```gcode
DISABLE_PLUGIN name=g28_tenz
```

---

## Plugin Structure

### Installation Script

After calling `ENABLE_PLUGIN`, the install.sh file will be automatically executed.

After calling `DISABLE_PLUGIN`, the uninstall.sh file will be automatically executed.

### Single-language plugin
Must contain a file:
```
g28_tenz.cfg
```
All functionality resides in this file.

### Multi-language plugin
Language-specific files are placed in subdirectories:
```
en/g28_tenz.cfg
ru/g28_tenz.cfg
de/g28_tenz.cfg
...
```

All output messages must be escaped, for example:
```gcode
RESPOND PREFIX="info" MSG="===Cutting the filament==="
```

---

#### Translations

Translations are stored in the `translate/` directory in files like `de.csv`:

```csv
Cutting the filament;Filament schneiden
```

Format:
```
English phrase;Translated phrase
```

To generate language files, run:
```bash
./Make.sh
```
This script will create the required directories and `.cfg` files.
