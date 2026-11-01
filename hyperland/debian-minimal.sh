.SILENT:

install: install_deps hyper_config install_brave

install_deps:
	sudo apt update

	# instalar aplicativos
	sudo apt install -y --no-install-recommends --no-install-suggests\
		polkitd waybar wofi foot htop pcmanfm xwayland bash-completion\
		nwg-look wdisplays pipewire pipewire-pulse wireplumber\
		bluetooth libspa-0.2-bluetooth blueman neovim\
		xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk\
		grim slurp wl-clipboard brightnessctl\
		papirus-icon-theme wlogout fonts-dejavu
	
	# pacotes gráficos
	sudo apt install -y\
		firmware-amd-graphics libgl1-mesa-dri libglx-mesa0\
		mesa-vulkan-drivers mesa-utils vulkan-tools

	# adicionar repositório trixie-backports
	echo "deb http://deb.debian.org/debian trixie-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
	sudo apt update

	# instalar o hyperland
	sudo apt install -t trixie-backports hyprland -y

	# remover recursos não utilizados
	sudo apt autoremove -y

	# finalizar
	echo "Instalação das dependências concluída com sucesso!"


hyper_config:
	# criar diretórios de configuração
	mkdir -p ~/.config/hypr
	mkdir -p ~/.config/waybar
	mkdir -p ~/.config/wofi

	# criar diretórios de assets
	mkdir -p ~/.local/share/applications
	mkdir -p ~/.local/wallpapers
	mkdir -p ~/.local/bin
	mkdir -p ~/.themes

	# copiar configurações
	cp -f /usr/share/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf	
	cp -f sway/waybar/config.conf ~/.config/waybar/config
	cp -f sway/waybar/style.css ~/.config/waybar/style.css
	cp -f sway/waybar/wl_date.py ~/.config/waybar/wl_date.py
	cp -f sway/waybar/wl_cpu.py ~/.config/waybar/wl_cpu.py
	cp -f sway/waybar/wl_mem.py ~/.config/waybar/wl_mem.py
	cp -f sway/waybar/wl_mic.py ~/.config/waybar/wl_mic.py
	chmod +x ~/.config/waybar/wl_date.py
	chmod +x ~/.config/waybar/wl_cpu.py
	chmod +x ~/.config/waybar/wl_mem.py
	chmod +x ~/.config/waybar/wl_mic.py

	cp -f sway/wofi/config.conf ~/.config/wofi/config
	cp -f sway/wofi/style.css ~/.config/wofi/style.css

	# copiar assets
	cp -f wallpapers/* ~/.local/wallpapers
	cp -f -r themes/* ~/.themes

	echo "Configuração do sway finalizada com sucesso!"


install_brave:
	sudo apt install -y curl
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
	sudo apt update
	sudo apt install -y brave-browser

	echo "Instalação do brave finalizada com sucesso!"


test:
	echo "configure debian minimal"