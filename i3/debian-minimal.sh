.SILENT:

install: install_deps i3_config

install_deps:
	sudo apt update

	# instalar dependências
	sudo apt install -y\
		xorg lightdm suckless-tools pipewire wireplumber\
		lxappearance lxrandr lxtask lxterminal pcmanfm\
		network-manager network-manager-gnome\
		bluetooth libspa-0.2-bluetooth blueman alsa-utils\
		i3 i3blocks rofi picom feh bash-completion htop jq maim slop neovim

	# ativar o gerenciador de rede
	sudo systemctl enable NetworkManager
	sudo systemctl start NetworkManager

	# remover dependências quebradas
	sudo apt autoremove -y

	# finalizar
	echo "Instalação das dependências concluída com sucesso!"


i3_config:
	# diretórios de configuração
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/i3blocks
	mkdir -p ~/.config/rofi

	# assets
	mkdir -p ~/.local/bin
	mkdir -p ~/.local/share/fonts
	mkdir -p ~/.local/share/applications
	mkdir -p ~/.local/wallpapers
	mkdir -p ~/.themes

	# copiar as configurações
	cp -f i3/config-lxde.conf ~/.config/i3/config
	cp -f i3/i3blocks/config.conf ~/.config/i3blocks/config
	cp -f i3/rofi/config.conf ~/.config/rofi/config.rasi

	# permissão para arquivos de script
	cp -f i3/i3blocks/i3datetime.py ~/.local/bin/i3datetime.py
	cp -f i3/i3blocks/scratchpad.sh ~/.local/bin/scratchpad
	cp -f i3/i3blocks/powermenu.sh ~/.local/bin/powermenu
	cp -f i3/i3blocks/i3cpu.py ~/.local/bin/i3cpu.py
	cp -f i3/i3blocks/i3mem.py ~/.local/bin/i3mem.py
	cp -f i3/i3blocks/i3vol.py ~/.local/bin/i3vol.py
	cp -f i3/i3blocks/i3mic.py ~/.local/bin/i3mic.py
	chmod +x ~/.local/bin/i3datetime.py
	chmod +x ~/.local/bin/scratchpad
	chmod +x ~/.local/bin/powermenu
	chmod +x ~/.local/bin/i3cpu.py
	chmod +x ~/.local/bin/i3mem.py
	chmod +x ~/.local/bin/i3vol.py
	chmod +x ~/.local/bin/i3mic.py

	# copiar os assets
	cp -f fonts/*.ttf ~/.local/share/fonts
	cp -f wallpapers/* ~/.local/wallpapers
	cp -f -r themes/* ~/.themes

	# finalizar
	echo "Configuração finalizada com sucesso!"


install_brave:
	sudo apt install -y curl
	
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources

	sudo apt update
	sudo apt install -y brave-browser

	echo "Instalação do brave finalizada com sucesso!"