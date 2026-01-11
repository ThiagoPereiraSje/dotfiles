# Arquivos de configuração

## Como executar um script em outro diretório

```bash
make -f sway/debian-minimal.sh test
make -f sway/debian-minimal.sh install
make -f sway/debian-minimal.sh sway_config
```

## Comandos úteis

```bash
# Para alterar o layout do teclado
setxkbmap br

# Para listar os dipositivos de bloco do sistema
lsblk

# Para montar um hd
sudo mount /dev/sdb1 /mnt/meu_hd

# Para desmontar
sudo umount /mnt/meu_hd

# Dispositivos de áudio disponíveis
wpctl status

# Escolher saída de audio ou microfone padrão
wpctl set-default 48

# Para descobrir a classe de alguma janela
xprop | grep WM_CLASS
```

## Referências

- [Drewgrif](https://github.com/drewgrif/jag_dots/tree/main)
