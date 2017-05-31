# Going Functional

## Resumen ##

* En Haskell, todas las piezas de código consisten en *expresiones* que se evalúan de forma similar a las funciones matemáticas.
* Las expresiones en Haskell son puras, no tienen *side-effects*, por lo tanto las funciones, que se componen de expresiones, también son puras.
* Las funciones puras son más *componibles* que los procedimientos (o funciones no puras). Para saber más sobre la importancia de la composicionalidad os recomiendo ver a Brian Beckman explicando [la composición es **la forma** de controlar la complejidad](https://youtu.be/ZhuHCtR3xq8?t=16m46s)
* Haskell por defecto opera en un modo de evaluación perezosa (*lazy evaluation*), eso significa que las expresiones solo se evalúan cuando se necesitan.
* Un sistema de tipos (*type system*) es una abstracción que categoriza los valores que pueden aparecer durante la ejecución de un programa. Los tipos se utilizan para poner restricciones o invariantes a las operaciones que se pueden hacer sobre los valores.
* El chequeo de tipos se puede realizar en dos momentos:
  1. antes de ejecutar el programa durante la *compilación* (sistema de tipos estático) 
  2. o bien mientras se ejecuta el programa durante la ejecución o *runtime* (sistema de tipos dinámico)
* El sistema de tipos de Haskell es estático.
* El sistema de tipos de Haskell es también *muy fuerte*, mientras más fuerte un sistema de tipos más restricciones o invariantes se usan sobre sus valores.
* Idris es otro lenguaje con sintaxis parecida a la de Haskell y que cuenta con *tipos dependientes*.
* Los tipos dependientes nos permiten poner restricciones todavía más fuertes a nuestros valores, por ejemplo, podemos expresar con tipos que si concatenamos una lista de longitud 'n' con una lista de longitud 'm', el resultado debe ser una lista de longitud 'n+m'. Si quieres saber más mira [Tipos dependientes en Haskell](https://www.schoolofhaskell.com/user/konn/prove-your-haskell-for-great-safety/dependent-types-in-haskell)
* Haskell tiene _polimorfismo paramétrico_ (en lugar de _polimorfismo de subtipo_ que encontramos en la OOP) y consiste en que los tipos más generales son parametrizados con variables que representan a su vez otros tipos, por ejemplo: una lista generalizada se escribe como `[a]` donde `a` es la variable, instancias más concretas de ese tipo son la lista de enteros `[Int]`, la lista de caracteres `[Char]`, etc.
* El compilador más utilizado de forma habitual para Haskell es [GHC](https://www.haskell.org/ghc/))

## Historia de Haskell ##

Haskell es considerado un sucesor de [Miranda](https://en.wikipedia.org/wiki/Miranda_(programming_language)) a su vez influenciado por [SASL](https://en.wikipedia.org/wiki/SASL_programming_language) y [KRC](https://en.wikipedia.org/wiki/Kent_Recursive_Calculator), los últimos tres diseñados por [David Turner](https://en.wikipedia.org/wiki/David_Turner_(computer_scientist)) y todos ellos influenciados por [ISWIM](https://en.wikipedia.org/wiki/ISWIM) diseñador por [Peter Landin](https://en.wikipedia.org/wiki/Peter_Landin). Podéis encontrar más información al respecto en el paper [Conception, Evolution, and Application of Functional Programming Languages](http://www.dbnet.ece.ntua.gr/~adamo/languages/books/p359-hudak.pdf) escrito por [Paul Hudak](https://en.wikipedia.org/wiki/Paul_Hudak) (uno de los integrantes del comité que diseñó Haskell).

Durante los años 90 se produjeron varias versiones de Haskell, culminando en un reporte llamado [Haskell 98](https://www.haskell.org/onlinereport/) y que fue tomado como estándar de implementación para compiladores de Haskell.

## Instalar Haskell ##

Para escribir y utilizar programas creados en Haskell nos basta con descargar el compilador GHC, pero recomendamos en lugar de eso instalar la herramienta [Stack](https://docs.haskellstack.org/en/stable/README/) que además de instalarnos el compilador de GHC en un *sandbox* nos permite gestionar proyectos e instalar dependencias.

[Hackage](http://hackage.haskell.org/) es el archivo central de paquetes de Haskell escritos por la comunidad (equivalente a Pypi de Python o NPM de JavaScript). [Stackage](https://www.stackage.org/) es lo mismo pero solo contiene los paquetes considerados *estables* y gestionados por Stack.

[Haddock](https://www.haskell.org/haddock/) es la herramienta utilizada para generar documentación a partir de código Haskell (equivalente a Pydoc de Python o Javadoc de Java).

## Ejecución ##

Para ejecutar el código de ejemplo de este directorio seguid las instrucciones en un terminal:

```sh
$ cd cap01
$ stack build       # compilar el proyecto
$ stack exec cap01  # ejecutar el programa que ha sido compilado como cap01
```
