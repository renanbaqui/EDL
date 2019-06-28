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
         | Var String
         deriving Show


data Cmd = Atr String Exp   -- atribuicao, ex.: x=1
         | Seq [Cmd]      -- sequencia,  ex.: x=1 ; y=x
         | Cnd Exp Cmd Cmd
         | Rep Exp Cmd

type Amb = String -> Int
    -- uma funcao que recebe um identificador de uma variavel
    -- e retorna o valor inteiro atual associado a ela

avaliaExp :: Amb -> Exp -> Int
avaliaExp amb (Var s) = s
avaliaExp amb (Num v) = v
avaliaExp amb (Add a b) = (avaliaExp amb a) + (avaliaExp amb b)
avaliaExp amb (Sub a b) = (avaliaExp amb a) - (avaliaExp amb b) 
avaliaExp amb (Mul a b) = (avaliaExp amb a) * (avaliaExp amb b) 
avaliaExp amb (Div a b) = (avaliaExp amb a) `div` (avaliaExp amb b) 
avaliaExp amb (And a b) =  if x /= 0 && y /= 0 then 1 else 0
                    where 
                        x = (avaliaExp amb a)  
                        y = (avaliaExp amb b)
avaliaExp amb (Or a b) =  if x == 0 || y == 0 then 0 else 1
                    where 
                        x = (avaliaExp amb a)  
                        y = (avaliaExp amb b)
avaliaExp amb (Not a) = if (avaliaExp amb a) /= 0 then 0 else 1
avaliaExp amb (Maior a b) = if x > y then 1 else 0
                    where 
                        x = (avaliaExp amb a)  
                        y = (avaliaExp amb b)
avaliaExp amb (Menor a b) = if x < y then 1 else 0
                    where 
                        x = (avaliaExp amb a)  
                        y = (avaliaExp amb b)
avaliaExp amb (Igual a b) = if x == y then 1 else 0
                    where 
                        x = (avaliaExp amb a)  
                        y = (avaliaExp amb b)
avaliaExp amb (Diff a b) = if x /= y then 1 else 0
                    where 
                        x = (avaliaExp amb a)  
                        y = (avaliaExp amb b)
avaliaExp amb (MaiorIgual a b) = if x >= y then 1 else 0
                    where 
                        x = (avaliaExp amb a)  
                        y = (avaliaExp amb b)
avaliaExp amb (MenorIgual a b) = if x <= y then 1 else 0
                    where 
                        x = (avaliaExp amb a)  
                        y = (avaliaExp amb b)


avaliaCmd :: Amb -> Cmd -> Amb
avaliaCmd amb (Atr id exp) = (\x -> if x == id then v else amb x)
                        where v = avaliaExp amb exp

avaliaCmd amb (Seq c1) = foldl (\a c -> (avaliaCmd a c)) amb c1

avaliaCmd amb (Cnd exp c1 c2) = if (avaliaExp amb exp) /= 0 then 
                                avaliaCmd amb c1  
                            else
                                avaliaCmd amb c2
avaliaCmd amb (Rep exp c1) = if (avaliaExp amb exp) /= 0 then 
                                avaliaCmd amb' (Rep exp c1)
                            else 
                                amb'
                            where amb' = avaliaCmd amb c1


main = print 5
