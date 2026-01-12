# Utilizar o LXDE com o i3wm

- Instale o i3wm;
- Edite o arquivo **~/.config/lxsession/LXDE/desktop.conf**. Na [Session], altere **windows_manager/command:windows_manager/command=i3**;
- Em **~/.config/lxsession/LXDE/autostart**, remova **“@pcmanfm –desktop –profile LXDE”**, pois isso interfere com o i3;
