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
