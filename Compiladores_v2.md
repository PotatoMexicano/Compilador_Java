<!-- Ɛ -->

<style>
    g{color:green; font-weight:bold}
    r{color:red; font-weight:bold}
</style>

# GR - Gramática Regular (GLD)
<b>Nesta gramática a substituição é realizada da Esquerda -> Direita.</b>  
* É necessário montar a Gramática, Produção, Exemplos e Demonstração de funcionamento.  
  
<b>Lado negativo:</b> Não é possivel determinar abertura e fechamento de elementos.  
<b>Exemplo</b> ( ... ) { ... } [ ... ]
<hr>

### O que é gramática ?
Gramática = (Não Terminal, Terminal, Produção, Start)

<hr>

## a(ba)* = a, aba, ababa ...

### Gramática = ({S,X},{a,b},P,S)  

```json
P = {
    S -> aX
    X -> baX | Ɛ
}
```
:warning: Para todo elemento com fechamento **kleene**, ele será em loop em si mesmo, e caso esteja no final da expressão, terá o **epson** (Ɛ)
<hr>

## a(a+b) = aa, ab
### Gramática = ({S,X},{a,b},P,S)  
```json
P = {
    S -> aX
    X -> a | b
}
```
:warning: Quando não temos **kleene** ou **positivo**, não haverá repetição, consideramos apenas 1 iteração.

<hr>

## a(a+b)* = a, aa, ab, aaa, aab, aba, abb ...
### Gramática  = ({S,X},{a,b},P,S)
```json
P = {
    S -> aX
    X -> aX | bX | Ɛ
}
```

<hr>

## (a+b)* (cc)+ (b)+ = ccb, accb, bccb, aaccb, abccb ...
### Gramática = ({S,Y,Z},{a,b,c},P,S)

```json
P = {
    S -> aS | bS | Y
    Y -> ccY | ccZ
    Z -> b | bZ
}
```

* Tabela com algumas possibilidades de combinações  .
    |(a+b)*|(cc)+|(b)+|Resultado|
    |:--:|:--:|:--:|:--:|
    |Ɛ|cc|b|ccb|
    |a|cc|b|accb|
    |b|cc|b|bccb|
    |aa|cc|b|aaccb|
    |ab|cc|b|abccb|
    |ba|cc|b|baccb|
    |bb|cc|b|bbccb|
### Demonstração
```json
S     => S -> bS
bS    => S -> aS
baA   => S -> Y
baY   => Y -> ccZ
baccZ => Z -> b
// baccb
```
<hr>

# GLC - Gramática Livre de Contexto

<b>Nesta gramática a substituição é realizada pelo <- Centro -> </b>  

<b>Lado positivo:</b> É possivel determinar abertura e fechamento de elementos.  
<b>Exemplo</b> ( ... ) { ... } [ ... ]

<hr>

## | 2 + 1 | 2+(1-1) | (2+1)-1 | 2+(1-(1)) |
```json
S -> NON | NOC | CON
C -> (N) | (NON) | (NOC)
N -> 1 | 2
O -> + | -
```

### Demonstração
```json
S         => S -> NOC
NOC       => N -> 2
2OC       => O -> +
2+C       => C -> (NOC)
2+(NOC)   => N -> 1
2+(1OC)   => O -> -
2+(1-C)   => C -> (N)
2+(1-(N)) => N -> 1
// 2+(1-(1))
```
<hr>

# BNF - Backus Naur Form

Os símbolos não-terminais são delimitados pelos sinais <b> < > </b>  



|Notação|Símbolo|
|:--:|:--:|
|Produção|<b>: : =<b>|
|NTerminal|<b>< ></b>|
|Alternativa|<b> \| </b>|
|Repetição| { ... }|

## Exemplo
```json
<letra> ::= a | b | c | ... | z
<palavra> ::= <letra><palavra> | <letra>
```
```json
<boolean> ::= true | false
```
```json
<integer> ::=  <numeric><numeric>
<numeric> ::= 0|1|2|3|4|5|6|7|8|9
```


<hr>

# EBNF Extended Backus Naur Form

|Notação|Símbolo|
|:--:|:--:|
|Prioridade| ( ... )|
|Opcional|[ ... ]|
|Terminal|' ... '|

## Exemplo
```json
<letra> ::= 'a' | 'b' | 'c' | ... | 'z'
```
```json
<number> ::= <numeric>{<numeric>}
<numeric> ::= 0|1|2|3|4|5|6|7|8|9
```
```json
<decimal> ::= <integer>'.'<integer>
<integer> ::= <numeric>{<numeric>}
<numeric> ::= 0|1|2|3|4|5|6|7|8|9
```

<hr>

## GSC - Gramática Sensivel a Contexto
Ɛ 
## GRE - Gramática Recursivamente Enumerável   
Ɛ
# Compilador Java

## Compilador em formato T
## Bootstraping
## BNF + Gráfico

## JFLEX
### Como converter uma expressão regular para BNF ?
Dada a expressão regular  : 
```java
(a+b)* (cc)+ (b)+
```
Envolva toda a expressão por parenteses, para que o resultado final seja considerado uma única string.

```java
( (a+b)* (cc)+ (b)+ )
```
Após, os elementos **+** (mais) que estiverem fazendo a função de OU, devem ser substituidos por **|** (pipe).

```java
( (a|b)* (cc)+ (b)+ )
```
Remove os parenteses dos elementos simples.
```java
( (a|b)* cc+ b+ )  { System.out.println(yytext()); }
```

### YYText e YYLength
### Anatomia do JFLEX
### Caracteres invisíveis
### Detecção do final do arquivo

