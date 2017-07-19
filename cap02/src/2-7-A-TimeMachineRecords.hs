{-https://github.com/haskell-esp/ejercicios-beginning-haskell

##### 2-7. TIME MACHINE RECORDS
Rewrite the TimeMachine data type defined earlier using records.
You should find that updating the prices of time machines is now
much more concise.
-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE RecordWildCards #-}
data TimeMachineR
   = TimeMachineR { manufacturerR :: String
                  , modelR        :: Integer
                  , nameR         :: String
                  , directionR    :: Direction
                  , priceR        :: Double
                  } deriving Show

data Direction
  = ToPast
  | ToFuture
  | ToPastOrFuture
  deriving Show

type Percentage = Double

salesPromotion'2 :: [TimeMachineR] -> Percentage -> [TimeMachineR]
salesPromotion'2 [] _ = []
salesPromotion'2 (tm : tms) discount =
  let t@(TimeMachineR { priceR = pr }) = tm
  in (t { priceR = pr * discount }) : (salesPromotion'2 tms discount)

-- NamedFieldPuns
salesPromotion'3 :: [TimeMachineR] -> Percentage -> [TimeMachineR]
salesPromotion'3 [] _ = []
salesPromotion'3 (tm : tms) discount =
  let t@(TimeMachineR { priceR }) = tm
  in (t { priceR = priceR * discount }) : (salesPromotion'3 tms discount)

-- RecordWildCards
salesPromotion :: [TimeMachineR] -> Percentage -> [TimeMachineR]
salesPromotion [] _ = []
salesPromotion (tm : tms) discount =
  let t@(TimeMachineR { .. }) = tm
  in (t { priceR = priceR * discount }) : (salesPromotion'3 tms discount)

tmList = [ (TimeMachineR "ACME" 123 "Ok1" ToPast   100.0)
         , (TimeMachineR "Hskl" 007 "Ok2" ToFuture 150.0)
         ]

{- GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
λ: :l cap02/src/2-7-A-TimeMachineRecords.hs
[1 of 1] Compiling Main ( cap02/src/2-7-A-TimeMachineRecords.hs, interpreted )
Ok, modules loaded: Main.
λ: salesPromotion tmList 0.90
[TimeMachineR {manufacturerR = "ACME", modelR = 123, nameR = "Ok1", directionR = ToPast  , priceR =  90.0}
,TimeMachineR {manufacturerR = "Hskl", modelR =   7, nameR = "Ok2", directionR = ToFuture, priceR = 135.0}]
-}
