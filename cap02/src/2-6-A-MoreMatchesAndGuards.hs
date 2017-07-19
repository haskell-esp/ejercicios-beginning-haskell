{-https://github.com/haskell-esp/ejercicios-beginning-haskell

##### 2-6. MORE MATCHES AND GUARDS

Up to this point we have introduced matching on lists and
tuples, and guards. The following tasks will help you
ensure that you have understood those concepts.

1) Define the famous Ackermann function. Try using guard.

   * https://en.wikipedia.org/wiki/Ackermann_function

Pseudocode:

A (m,n) =
                               n+1 , m = 0
                     A (m−1,   1 ) , m > 0, n = 0
           A (m − 1, A (m  , n−1)) , m > 0, n > 0

2) Define the unzip function, which takes a list of tuples
   and returns two lists, one with all the first components.

   unzip [] = ([],[])
   unzip [(1,2)] = ([1],[2])
   unzip [(1,2),(3,4)] = ([1,3],[2,4])

-}

{- 1 -}
ackermann :: Integer -> Integer -> Integer
ackermann m n
  | m == 0           = n + 1
  | m >  0 && n == 0 = ackermann (m-1) 1
  | m >  0 && n >  0 = ackermann (m-1) (ackermann m (n-1))

{- 2 -}
unzip' :: [(a,a)] -> ([a], [a])
unzip' []          = ([] ,[])
unzip' [(x,y)]     = ([x],[y])
unzip' ((x,y):xys) = (x : xs , y : ys)
  where (xs, ys)   = unzip' xys

{- GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
λ: :l cap02/src/2-6-A-MoreMatchesAndGuards.hs
[1 of 1] Compiling Main ( cap02/src/2-6-A-MoreMatchesAndGuards.hs, interpreted )
Ok, modules loaded: Main.
λ: ackermann 3 4
125
λ: unzip' [(1,2),(3,4)]
([1,3],[2,4])
-}
