-- 1-6

data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Mul Exp Exp
         | Div Exp Exp
         | And Exp Exp
         | Or Exp Exp
         | Not Exp
         | Maior Exp Exp
         | Menor Exp Exp
         | Igual Exp Exp
         | Diff Exp Exp
         | MaiorIgual Exp Exp
         | MenorIgual Exp Exp
         deriving Show

-- e0 = Num 1
-- e1 = Add (Num 1) (Sub (Num 10) (Num 20))
-- e2 = Add (Num 1) (Sub (Num 10) (Num 20))
-- e3 = Sub (Add (Num 5) (Num 5)) (Sub (Num 5) (Num 5))

e0 = Add (Num 1) (Num 2) -- 1 + 2 =3
e1 = Add (Add (Add (Num 1) (Num 2)) (Num 3)) (Num 4) -- ((1 + 2) + 3) + 4 = 10
e2 = Add (Num 1) (Add (Num 2) (Add (Num 3) (Num 4))) -- 1 + ( 2 + ( 3 + 4)) = 10
e3 = Sub (Sub (Sub (Num 1) (Num 2)) (Num 3)) (Num 4) -- ((1 - 2) - 3) - 4 = -8
e4 = Sub (Num 1) (Sub (Num 2) (Sub (Num 3) (Num 4))) -- (1 - (2 - (3-4))) = -2
e5 = Sub (Sub (Num 1) (Num 2)) (Sub (Num 3) (Num 4)) -- (1 - 2) - (3 - 4) = 0

avalia :: Exp -> Int
avalia (Num v) = v
avalia (Add a b) = (avalia a) + (avalia b)
avalia (Sub a b) = (avalia a) - (avalia b) 
avalia (Mul a b) = (avalia a) * (avalia b) 
avalia (Div a b) = (avalia a) `div` (avalia b) 
avalia (And a b) =  if x /= 0 && y /= 0 then 1 else 0
                    where 
                        x = (avalia a)  
                        y = (avalia b)
avalia (Or a b) =  if x == 0 || y == 0 then 0 else 1
                    where 
                        x = (avalia a)  
                        y = (avalia b)
avalia (Not a) = if (avalia a) /= 0 then 0 else 1
avalia (Maior a b) = if x > y then 1 else 0
                    where 
                        x = (avalia a)  
                        y = (avalia b)
avalia (Menor a b) = if x < y then 1 else 0
                    where 
                        x = (avalia a)  
                        y = (avalia b)
avalia (Igual a b) = if x == y then 1 else 0
                    where 
                        x = (avalia a)  
                        y = (avalia b)
avalia (Diff a b) = if x /= y then 1 else 0
                    where 
                        x = (avalia a)  
                        y = (avalia b)
avalia (MaiorIgual a b) = if x >= y then 1 else 0
                    where 
                        x = (avalia a)  
                        y = (avalia b)
avalia (MenorIgual a b) = if x <= y then 1 else 0
                    where 
                        x = (avalia a)  
                        y = (avalia b)


avalia' :: Exp -> Exp
avalia' (Num v) = (Num v)
avalia' (Add (Num a) (Num b)) = Num (a + b)
avalia' (Add a b) = (avalia' (Add (avalia' a) (avalia' b)))
avalia' (Sub (Num a) (Num b)) = Num (a - b)
avalia' (Sub a b) = (avalia' (Sub (avalia' a) (avalia' b)))
avalia' (Mul (Num a) (Num b)) = Num (a * b)
avalia' (Mul a b) = (avalia' (Mul (avalia' a) (avalia' b)))
avalia' (Div (Num a) (Num b)) = Num (a `div` b)
avalia' (Div a b) = (avalia' (Div (avalia' a) (avalia' b)))
avalia' (And (Num a) (Num b)) =  if a /= 0 && b /= 0 then Num 1 else Num 0
avalia' (And a b) = (avalia' (And (avalia' a) (avalia' b)))
avalia' (Or (Num a) (Num b)) =  if a == 0 || b == 0 then Num 0 else Num 1
avalia' (Or a b) = (avalia' (Or (avalia' a) (avalia' b)))
avalia' (Not (Num a)) = if a /= 0 then Num 0 else Num 1
avalia' (Not a) = (avalia' (Not (avalia' a)))
avalia' (Maior (Num a) (Num b)) = if a > b then Num 1 else Num 0
avalia' (Maior a b) = (avalia' (Maior (avalia' a) (avalia' b)))
avalia' (Menor (Num a) (Num b)) = if a < b then Num 1 else Num 0
avalia' (Menor a b) = (avalia' (Menor (avalia' a) (avalia' b)))
avalia' (Igual (Num a) (Num b)) = if a == b then Num 1 else Num 0
avalia' (Igual a b) = (avalia' (Igual (avalia' a) (avalia' b)))
avalia' (Diff (Num a) (Num b)) = if a /= b then Num 1 else Num 0
avalia' (Diff a b) = (avalia' (Diff (avalia' a) (avalia' b)))
avalia' (MaiorIgual (Num a) (Num b)) = if a >= b then Num 1 else Num 0
avalia' (MaiorIgual a b) = (avalia' (MaiorIgual (avalia' a) (avalia' b)))
avalia' (MenorIgual (Num a) (Num b)) = if a <= b then Num 1 else Num 0
avalia' (MenorIgual a b) = (avalia' (MenorIgual (avalia' a) (avalia' b)))

main = print (avalia e5)
