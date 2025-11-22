# Arquivos de configuração

## Como executar um script em outro diretório

```bash
make -f sway/debian-minimal.sh test
make -f sway/debian-minimal.sh install_deps
make -f sway/debian-minimal.sh sys_config
```

## Comandos úteis

```bash
# Para alterar o layout do teclado
setxkbmap br

# Para listar os dipositivos de bloco do sistema
lsblk
```
