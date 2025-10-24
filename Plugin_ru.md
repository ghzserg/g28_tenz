# Плагины в zMod

Любой пользователь может создать и подключить свой плагин к **zmod**.

Плагины включенные в поставку zMod:
- [g28_tenz](https://github.com/ghzserg/g28_tenz) - Парковка оси Z по тензодатчикам
- [bambufy](https://github.com/function3d/bambufy) - Совместим с Bambu Studio, улучшает управление башней подачи, обеспечивает точную оценку времени и расхода материала, снижает отходы, поддерживает Mainsail, быструю смену цвета и расширенные функции печати.
- [nopoop](https://github.com/ghzserg/nopoop) - Максимальное уменьшение количества отходов от ninjamida

---

## Управление плагином

**Включить плагин:**
```gcode
ENABLE_PLUGIN name=g28_tenz
```
— скачает плагин и перезапустит Klipper при успехе.

**Выключить плагин:**
```gcode
DISABLE_PLUGIN name=g28_tenz
```

---

## Создание собственного плагина

Пример плагина: https://github.com/ghzserg/g28_tenz
(Во всех примерах ниже используется имя `g28_tenz` — замените его на имя вашего плагина.)

---

### Добавление плагина

В файле
```mod_data/user.moonraker.conf```
добавьте секцию:

```ini
[update_manager g28_tenz]
type: git_repo
channel: dev
path: /root/printer_data/config/mod_data/plugins/g28_tenz
origin: https://github.com/ghzserg/g28_tenz.git
is_system_service: False
primary_branch: main
```

- **Путь к плагину**: `/root/printer_data/config/mod_data/plugins/g28_tenz`
- **Источник**: `https://github.com/ghzserg/g28_tenz.git`

> Стабильные плагины могут быть включены в поставку zmod, но обновляются и управляются их авторами.

---

### Скрипт установки

После вызова `ENABLE_PLUGIN`, будет автоматически вызыван файл `install.sh`

После вызова `DISABLE_PLUGIN`, будет автоматически вызыван файл `uninstall.sh`

### Одноязычный плагин
Должен содержать файл:
```
g28_tenz.cfg
```
В нём — весь функционал.

### Многоязычный плагин
Файлы размещаются в подкаталогах по языкам:
```
en/g28_tenz.cfg
ru/g28_tenz.cfg
de/g28_tenz.cfg
...
```

Все строки вывода должны быть экранированы, например:
```gcode
RESPOND PREFIX="info" MSG="===Cutting the filament==="
```

---

#### Перевод

Переводы хранятся в каталоге `translate/` в файлах вида `de.csv`:

```csv
Cutting the filament;Filament schneiden
```

Формат:
```
Английская фраза;Перевод на нужный язык
```

Чтобы сгенерировать языковые файлы, выполните:
```bash
./Make.sh
```
Скрипт создаст нужные каталоги и `.cfg`-файлы.
