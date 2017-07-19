# Declaring the Data Model

## Resumen ##

* Existe un tipo de datos en Haskell para los caracteres y se llama `Char`.
* Para crear un valor de tipo `Char` solo tienes que escribir el caracter en comillas simples `'a'`.
* El módulo `Data.Char` contiene muchas funciones para trabajar con caracteres que por defecto no están importadas en el módulo `Prelude` que es el módulo que se importa por defecto.
* En cuanto a tipos numéricos tenemos el tipo `Int` con tamaño limitado, el tipo `Integer` con tamaño ilimitado, el tipo `Ratio` para números racionales que se crean así `n % m` y los tipos `Float` y `Double` para números de punto flotante.
* Para convertir entre varios tipos númericos usamos `fromInteger`, `toInteger`, `fromRational` y `toRational`
* Las literales numéricas en Haskell son polimórficas, es decir, el tipo de `3` es `3 :: Num t => t` que significa que `3` puede utilizarse como cualquier número, el tipo de `3.3` es `3.3 :: Fractional t => t` que significa que `3.3` puede utilizarse como cualquier número fraccionario.
* El tipo para los booleanos es `Bool` y solo existen dos constantes de este tipo `True` y `False`.
* El tipo para cadenas de caracteres es `String`.
* En Haskell el tipo `String` no es más que un alias al tipo listado de caracteres: `[Char]`, por lo que en Haskell un listado de caracteres y una cadena de caracteres es lo mismo.
* El tipo Lista en Haskell es `[a]` donde `a` es una variable de tipo (se escriben en minúsculas y los tipos se escriben capitalizados). Esto se conoce como polimorfismo paramétrico. Fijaos que las listas en Haskell son homogéneas, es decir, todos sus elementos son del mismo tipo.
* La lista vacía en Haskell se escribe `[]` y su tipo es `[] :: [t]` es decir, que puede utilizarse como cualquier lista.
* Para concatenar dos listas utilizamos la función `++`, en Haskell las funciones se pueden nombrar con símbolos.
* Las funciones nombradas con símbolos se suelen utilizar en posición *infija*, ej: `[1,2] ++ [3,4]`
* Las funciones nombradas con símbolos se pueden utilizar en posición *prefija* si las encerramos entre paréntesis, ej: `(++) [1,2] [3,4]`
* Las funciones no nombradas con símbolos se suelen utilizar en posición *prefija*, ej: `elem 3 [1,2,3]`
* Las funciones no nombradas con símbolos también se pueden utilizar en posición *infija* si las encerramos en *backticks*, ej: ```3 `elem` [1,2,3]`
* La sintaxis de lista `[1,2,3]` no es más que azúcar sintáctico para `1 : 2 : 3 : []` donde `:` es la función *cons* y `[]` es la constante de lista vacía.
* La sintaxis de condicionales es `if <condición> then <consecuencia> else <alternativa>`. La expresión `<condición>` tiene que tener tipo `Bool` y las expresiones `<consecuencia>` y `<alternativa>` tienen que tener el mismo tipo. En Haskell siempre tenemos que escribir la parte `else` de la condicional.
* La sintaxis de condicional es equivalente a la función `bool` del módulo `Data.Bool`, esto es así porque Haskell solo evalúa las expresiones según se necesitan, por lo que puedes crear nuevos operadores en el lenguaje utilizando solo funciones.
* En Haskell se utilizan las ecuaciones para definir constantes y funciones.
* `mensaje = "Hola, Mundo!"` es una constante
* `mensaje nombre = "Hola, " ++ nombre ++ "!"` es una función (porque recibe un parámetro `nombre`)
* Una tupla es una estructura de un tamaño fijo donde cada elemento puede ser de distinto tipo, ej: `('a', "abc", True)` tiene el tipo `(Char, String, Bool)`.
* Para las tuplas de dos elementos contamos con dos funciones: `fst` para acceder al primer elemento, `snd` para acceder al segundo, ej: `fst (True, 'a') = True`
* Un tipo de datos algebraicos es un tipo de datos que se construye a partir de otros tipos de datos utilizando dos operaciones: [sumas y productos](http://chris-taylor.github.io/blog/2013/02/10/the-algebra-of-algebraic-data-types/)
* Si los tipos algebraicos es una forma de crear nuevos tipos de datos a partir de otros más sencillos, *pattern-matching* es la forma de *desestructurar* valores de esos tipos de datos en valores de los tipos de datos que lo componen.
* El tipo `Maybe a` es como una lista de un solo elemento y nos permite capturar la *posibilidad de ausencia de un valor* ej, si queremos el primer elemento de una lista, qué valor usamos para cuando la lista está vacía? o si queremos dividir un entero entre otro entero, qué valor usamos para cuando el divisor es cero? estas instancias de funciones parciales se pueden convertir en funciones totales haciendo que el tipo del resultado sea un Maybe.
