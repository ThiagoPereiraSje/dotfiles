.SILENT:

install: install_deps install_brave i3_config

install_deps:
	sudo apt update

	# instalar dependências
	sudo apt install -y\
		i3 rofi picom feh papirus-icon-theme bash-completion htop\
		pipewire pipewire-pulse pipewire-alsa\
		pipewire-audio-client-libraries wireplumber
	
	# remover dependências quebradas
	sudo apt autoremove -y

	# finalizar
	echo "Instalação das dependências concluída com sucesso!"


install_brave:
	sudo apt install -y curl
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
	sudo apt update
	sudo apt install -y brave-browser

	# finalizar
	echo "Instalação do brave finalizada com sucesso!"


i3_config:
	# diretórios de configuração
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/i3status
	mkdir -p ~/.config/rofi

	# assets
	mkdir -p ~/.local/bin
	mkdir -p ~/.local/share/fonts
	mkdir -p ~/.local/share/applications
	mkdir -p ~/.local/wallpapers
	mkdir -p ~/.themes

	# copiar as configurações
	cp -f i3/config-lxde.conf ~/.config/i3/config
	cp -f i3/i3status.conf ~/.config/i3status/config
	cp -f i3/rofi/config.conf ~/.config/rofi/config.rasi

	# copiar os assets
	cp -f fonts/*.ttf ~/.local/share/fonts
	cp -f shortcuts/*.desktop ~/.local/share/applications
	cp -f wallpapers/* ~/.local/wallpapers
	cp -f -r themes/* ~/.themes

	# finalizar
	echo "Configuração finalizada com sucesso!"