install_deps:
	# ocultar os comandos do arquivo
	set +x

	sudo apt update

	# instalar aplicativos
	sudo apt install -y --no-install-recommends --no-install-suggests\
		nwg-look wdisplays foot pcmanfm\
		pipewire alsa-utils pavucontrol bluetooth blueman wofi\
		bash-completion neovim kclock rhythmbox htop gdm3
	
	# instalar o sway
	sudo apt install -y --no-install-recommends --no-install-suggests\
		sway sway-backgrounds swaybg xwayland greetd wlgreet\
		swappy grim slurp mako-notifier

	# remover recursos não utilizados
	sudo apt autoremove -y

	# configurar o sway
	sudo mkdir -p /usr/share/wayland-sessions
	sudo cp -f sway/sway.desktop /usr/share/wayland-sessions
	sudo cp -f sway/sway-gdm /usr/local/bin

	# permissões de arquivo
	sudo chmod +x /usr/share/wayland-sessions/sway.desktop
	sudo chmod +x /usr/local/bin/sway-gdm

	# finalizar
	@echo "Instalação concluída com sucesso!"


sys_config:
	# ocultar os comandos do arquivo
	set +x

	# criar diretórios de configuração
	mkdir -p ~/.config/sway
	mkdir -p ~/.config/waybar
	mkdir -p ~/.config/wofi
	mkdir -p ~/.config/foot

	# criar diretórios de assets
	mkdir -p ~/.local/share/fonts
	mkdir -p ~/.local/share/applications
	mkdir -p ~/.local/wallpapers
	mkdir -p ~/.local/bin

	# copiar configurações
	cp -f sway/config.conf ~/.config/sway/config
	cp -f sway/waybar/config.conf ~/.config/waybar/config
	cp -f sway/wofi/config.conf ~/.config/wofi/config
	cp -f sway/foot.ini ~/.config/foot/foot.ini

	# copiar assets
	cp -f fonts/*.ttf ~/.local/share/fonts
	cp -f shortcuts/*.desktop ~/.local/share/applications
	cp -f wallpapers/* ~/.local/wallpapers

	@echo "Configuração finalizada com sucesso!"


test:
	@echo "configure debian minimal"