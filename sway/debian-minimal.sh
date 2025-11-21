install_deps:
	sudo apt update

	# instalar aplicativos
	sudo apt install -y nwg-look wdisplays foot thunar\
		pipewire alsa-utils easyeffects bluetooth blueman wofi\
		bash-completion neovim kclock htop firefox-esr
	
	# instalar o sway
	sudo apt install -y sway sway-backgrounds swaybg xwayland greetd wlgreet\
		swappy mako-notifier

	# remover recursos não utilizados
	sudo apt autoremove -y

	@echo "Instalação concluída com sucesso!"


sys_config:
	# criar diretórios de configuração
	mkdir -p ~/.config/sway
	mkdir -p ~/.config/waybar
	mkdir -p ~/.config/wofi

	# criar diretórios de assets
	mkdir -p ~/.local/share/fonts
	mkdir -p ~/.local/share/applications
	mkdir -p ~/.local/wallpapers
	mkdir -p ~/.local/bin

	# copiar configurações
	cp -f sway/config.conf ~/.config/sway/config
	cp -f sway/waybar/config.conf ~/.config/waybar/config
	cp -f sway/wofi/config.conf ~/.config/wofi/config

	# copiar assets
	cp -f fonts/*.ttf ~/.local/share/fonts
	cp -f shortcuts/*.desktop ~/.local/share/applications
	cp -f wallpapers/* ~/.local/wallpapers

	@echo "Configuração finalizada com sucesso!"


test:
	@echo "configure debian minimal"