# Установка

Чтобы использовать этот мод для вашего Flashforge AD5X/AD5M/AD5M Pro

1. Установите zMod: https://github.com/ghzserg/zmod
2. В файле ```mod_data/user.moonraker.conf``` добавьте секцию:
```ini
[update_manager g28_tenz]
type: git_repo
channel: dev
path: /root/printer_data/config/mod_data/plugins/g28_tenz
origin: https://github.com/ghzserg/g28_tenz.git
is_system_service: False
primary_branch: master
```
3. Выполните команду: ```ENABLE_PLUGIN name=g28_tenz```

# Внимание

При парковке по тензодатчикам:
- Сопло должно быть чистым
- Стол должен быть пустым
- Восстановление печати не бкдет работать, т.к. стол не пустой

Используйте этот модуль на ваш страх и риск
