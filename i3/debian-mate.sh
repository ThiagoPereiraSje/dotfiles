.SILENT:

install: i3_config

install_deps:
	sudo apt update

	# instalar dependências
	sudo apt install -y i3 rofi picom dconf-cli
	sudo apt remove dunst

	# configurar o i3
	dconf write /org/mate/desktop/session/required-components/windowmanager "'i3'"
	dconf write /org/mate/desktop/background/show-desktop-icons false
	# desativar a tecla mod4 para o brisk-menu
	dconf write /com/solus-project/brisk-menu/hot-key "''"

	# para resetar as configurações
	# dconf reset /org/mate/desktop/session/required-components/windowmanager
	# dconf reset /org/mate/desktop/background/show-desktop-icons
	# dconf reset /com/solus-project/brisk-menu/hot-key


i3_config:
	mkdir -p ~/.local/bin
	mkdir -p ~/.local/share/fonts
	mkdir -p ~/.local/share/applications
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/rofi

	cp -f i3/config-mate.conf ~/.config/i3/config
	cp -f i3/rofi/config.conf ~/.config/rofi/config.rasi