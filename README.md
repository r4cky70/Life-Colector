# Life-Interactive

## Implementação do Jogo da Vida

Jogo da Vida de John Conway interativo com diversas estrururas setadas e possibilidade de personalização do tabuleiro.

Clone o repositório

```bash
git clone https://github.com/r4cky70/Life-Colector.git
```

Entre no repositório

```bash
cd Life-Colector
```
## Implementação em Haskell

## Para a funcionalidade da aplicação em Haskell é necessário

- Ter em sua máquina [haskell , Cabal e GHC](https://www.haskell.org/downloads/).
- Ter em sua máquina o Haskell plataform funcionando :

    ```bash
    sudo apt-get install haskell-platform
    ```
  
### Utilizando Cabal
Inicialmente, intala-se o cabal executável :

```bash
cabal update
```
```bash
cabal install Cabal cabal-install
```
Agora, será necessário entrar no diretório Haskell:

```bash
cd Haskell
```

Por fim,  execute o seguinte comando para instalar as dependências faltantres e iniciar o jogo:

```bash
cabal run
```
