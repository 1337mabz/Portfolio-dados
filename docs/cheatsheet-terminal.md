# Cola do terminal (bash) + DuckDB

## Autocompletar e histórico

| Atalho | O que faz |
|---|---|
| `Tab` | autocompleta arquivo/pasta/comando |
| `Tab` `Tab` | mostra todas as opções |
| `↑` / `↓` | navega no histórico |
| `Ctrl + R` | busca no histórico (digite parte do comando) |
| `Ctrl + G` | sai da busca |
| `history` | lista os últimos comandos |
| `history \| grep sql` | procura no histórico |
| `!!` | repete o último comando |
| `!$` | último argumento do comando anterior |
| `!123` | executa o comando nº 123 do `history` |

## Edição da linha

| Atalho | O que faz |
|---|---|
| `Ctrl + A` | início da linha |
| `Ctrl + E` | fim da linha |
| `Ctrl + U` | apaga até o início |
| `Ctrl + K` | apaga até o fim |
| `Ctrl + W` | apaga a palavra anterior |
| `Alt + .` | cola o último argumento do comando anterior |
| `Ctrl + C` | cancela o comando |
| `Ctrl + L` | limpa a tela |

## Navegação e arquivos

```bash
pwd                          # pasta atual
cd ~/Documentos/portfolio-dados
cd -                         # volta para a pasta anterior
ls -lh                       # lista com tamanhos legíveis
tree -L 2                    # árvore de diretórios (se instalado)
cp origem destino
mv antigo novo
rm arquivo                   # atenção: não vai para a lixeira
```

## Git (resumo)

```bash
git status                   # o que mudou
git diff                     # mudanças ainda não adicionadas
git diff --staged            # o que vai no próximo commit
git add arquivo              # coloca na fila
git commit -m "tipo: msg"    # cria o snapshot
git push                     # envia para o GitHub
git log --oneline -5         # últimos commits
git pull                     # baixa mudanças do remoto
```

## Shell do DuckDB

```bash
duckdb data/olist.duckdb     # abre o banco
```

```
.tables                      # lista tabelas
.schema orders               # colunas da tabela
.mode box                    # formato de saída
.quit                        # sair (ou Ctrl+D)
```

## Ordem de execução de uma query

```
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
```
