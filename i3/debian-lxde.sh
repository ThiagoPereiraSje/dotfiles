.SILENT:

install: install_deps i3_config

install_deps:
	sudo apt update

	# instalar dependências
	sudo apt install -y i3 rofi picom

	# finalizar
	echo "Instalação das dependências concluída com sucesso!"


i3_config:
	# diretórios de configuração
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/rofi

	# assets
	mkdir -p ~/.local/bin
	mkdir -p ~/.local/share/fonts
	mkdir -p ~/.local/share/applications
	mkdir -p ~/.local/wallpapers
	mkdir -p ~/.themes

	# copiar as configurações
	cp -f i3/config-lxde.conf ~/.config/i3/config
	cp -f i3/rofi/config.conf ~/.config/rofi/config.rasi

	# copiar os assets
	cp -f fonts/*.ttf ~/.local/share/fonts
	cp -f shortcuts/*.desktop ~/.local/share/applications
	cp -f wallpapers/* ~/.local/wallpapers
	cp -f -r themes/* ~/.themes

	# finalizar
	echo "Configuração finalizada com sucesso!"