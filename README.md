# Life-Interactive

#### Jogo da Vida de John Conway interativo com diversas estrururas setadas e possibilidade de personalização do tabuleiro.

O Jogo da Vida não é um jogo de computador típico. É, em sua ideia inicial, tido como um jogo autônomo, e foi inventado pelo matemático de Cambridge John Conway.
Esse jogo ficou amplamente conhecido quando foi mencionado em um artigo publicado pela Scientific American em 1970. Ele consiste em um conjunto de células que, com base em algumas regras matemáticas, podem viver, morrer ou se multiplicar. Dependendo das condições iniciais, as células formam vários padrões ao longo do jogo.

### Regras do jogo:

#### Para um espaço preenchido:

Cada célula com um ou nenhum vizinho morre, como que por solidão.
Cada célula com quatro ou mais vizinhos morre, como que por superpopulação.
Cada célula com dois ou três vizinhos sobrevive.

#### Para um espaço vazio:

Cada célula com três vizinhos se torna preenchida.

## Implementação do Jogo da Vida

Clone o repositório

```bash
git clone https://github.com/r4cky70/Life-Colector.git
```

## Implementação em Haskell

### Para a funcionalidade da aplicação em Haskell é necessário

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

### Iniciando o jogo

Entre no repositório

```bash
cd Life-Interactive
```
Por fim,  execute o seguinte comando para iniciar o jogo:

```bash
cabal run
```
