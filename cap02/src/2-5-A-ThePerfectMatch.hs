{-https://github.com/haskell-esp/ejercicios-beginning-haskell

##### 2-5. THE PERFECT MATCH FOR YOUR TIME MACHINES

1) For statistical purposes, write a function that
   returns the number of clients of each gender.

   * You may need to define an auxiliary data type to hold the results of this function.


2) Every year a time comes when time machines are
   sold with a big discount to encourage potential buyers.

   * Write a function that
     * given a list of time machines,
       decreases their price by some percentage.

* Use the Client and TimeMachine data type you can see just below.
-}

{- Client. There are three kinds of clients:
• Government organizations, which are known by
    their name
• Companies, for which you need to record
    its name,
    an identification number,
    a contact person (name, surname and gender) and
    its position within the company hierarchy
• Individual clients, known by
    being a person  (name, surname and gender) and
    whether they want to receive advertising
-}

-- Client
data Client
  = GovOrg     String
  | Company    String Integer Person String
  | Individual Person Bool
  deriving Show

data Person
  = Person String String Gender
  deriving Show

data Gender
  = Male
  | Female
  | Unknown
  deriving Show

type NMale    = Integer
type NFemale  = Integer
type NUnknown = Integer

type GenderStat = (NMale, NFemale, NUnknown)

type Percentage = Double

-- TimeMachine
data TimeMachine
  = TimeMachine Manufacturer Model Name Direction Price deriving Show

type Manufacturer = String
type Model        = Integer
type Name         = String
type Price        = Double

data Direction
  = ToPast
  | ToFuture
  | ToPastOrFuture
  deriving Show

-- Test data
clientList = [ (GovOrg "Haskellnautas")
             , (Company "TomaYa" 1 (Person "Jane" "Austen" Female) "Boss")
             , (Individual (Person "Marco" "Polo" Male) True)
             ]
tmList = [ (TimeMachine "ACME" 123 "Ok1" ToPast   100.0)
         , (TimeMachine "Hskl" 007 "Ok2" ToFuture 150.0)
         ]

{- 1 -}
genderStat :: [Client] -> GenderStat
genderStat [] = (0,0,0)
genderStat (client : clients) =
  case clientGender client of
    Just Male    -> (m+1, f  , u  )
    Just Female  -> (m  , f+1, u  )
    Just Unknown -> (m  , f  , u+1)
    Nothing      -> (m  , f  , u  )
  where (m,f,u) = genderStat clients


-- returns the gender of a client.
clientGender :: Client -> Maybe Gender
clientGender client =
  case client of
    Company _ _ (Person _ _ gender) _ -> Just gender
    Individual  (Person _ _ gender) _ -> Just gender
    _                                 -> Nothing

{- 2 -}
salesPromotion :: [TimeMachine] -> Percentage -> [TimeMachine]
salesPromotion [] _ = []
salesPromotion (tm : tms) discount =
  let tm1 = TimeMachine manufacturer model name direction (price * discount)
  in (tm1 : (salesPromotion tms discount))
  where
    TimeMachine manufacturer model name direction price = tm

{- GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
λ: :l cap02/src/2-5-A-ThePerfectMatch.hs 
[1 of 1] Compiling Main ( cap02/src/2-5-A-ThePerfectMatch.hs, interpreted )
Ok, modules loaded: Main.
λ: genderStat clientList 
(1,1,0)
λ: salesPromotion tmList 0.90
[TimeMachine "ACME" 123 "Ok1" ToPast 90.0,TimeMachine "Hskl" 7 "Ok2" ToFuture 135.0]
-}
