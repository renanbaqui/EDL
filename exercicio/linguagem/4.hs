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
         | Seq Cmd Cmd      -- sequencia,  ex.: x=1 ; y=x
         | Cnd Exp Cmd Cmd
         | Rep Exp Cmd
         | Dcl String       -- declaracao, ex.: int x

type Amb = [(String,Int)]  

-- x = 1; => Atr "x" (Num 1)
-- x = 1 + x - 20; => Atr "x" (Add 1 (Sub (Var "x") (Num 20)))
-- x = 1; y = 2; z= x+y; => Seq (Atr "x" (Num 1)) (Seq (Atr "y" (Num 2)) (Atr "z" (Add (Var "x") (Var "y"))))

c0 = Atr "x" (Add (Num 1) (Num 2))
c1 = Seq (Atr "x" (Num 10)) (Atr "x" (Num 1))
c2 = Seq (Atr "x" (Num 1)) (Seq (Atr "y" (Add (Var "x") (Num 1))) (Atr "x" (Var "y")))


avaliaExp :: Amb -> Exp -> Int
avaliaExp amb (Var s) = foldr (\(var, val) a -> if var == s then val else a) 0 amb
avaliaExp amb (Num v) = v
avaliaExp amb (Add a b) = (avaliaExp amb a) + (avaliaExp amb b)
avaliaExp amb (Sub a b) = (avaliaExp amb a) - (avaliaExp amb b) 
avaliaExp amb (Mul a b) = (avaliaExp amb a)  * (avaliaExp amb b) 
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
avaliaCmd amb (Atr id exp) = r ++ [(id, v)]
                        where v = avaliaExp amb exp
                              r = filter (\(var, val) -> if var == id then False else True) amb
avaliaCmd amb (Seq c1 c2) = avaliaCmd amb' c2 
                            where amb' = avaliaCmd amb c1
avaliaCmd amb (Cnd exp c1 c2) = if (avaliaExp amb exp) /= 0 then 
                                avaliaCmd amb c1  
                            else
                                avaliaCmd amb c2
avaliaCmd amb (Rep exp c1) = if (avaliaExp amb exp) /= 0 then 
                                avaliaCmd amb' (Rep exp c1)
                            else 
                                amb'
                            where amb' = avaliaCmd amb c1


verificaExp :: [String] -> Exp -> Bool
verificaExp vars (Var var)   = elem var vars
verificaExp vars (Add e1 e2) = verificaExp vars e1 && verificaExp vars e2
verificaExp vars (Sub e1 e2) = verificaExp vars e1 && verificaExp vars e2
verificaExp vars (Mul e1 e2) = verificaExp vars e1 && verificaExp vars e2
verificaExp vars (Div e1 e2) = verificaExp vars e1 && verificaExp vars e2
verificaExp _    _           = True

verificaCmd :: [String] -> Cmd -> ([String], Bool)
verificaCmd vars (Dcl var)     = (var:vars, True)
verificaCmd vars (Atr var exp) = (vars,     (elem var vars) && (verificaExp vars exp))
verificaCmd vars (Seq c1 c2)   = (v2,       b1 && b2) where
                                 (v1,b1) = verificaCmd vars c1
                                 (v2,b2) = verificaCmd v1 c2

amb1 = [("y",5),("x",3),("z",2),("y",1)]


ambret = [("ret",5)]

-- Um programa só é valido caso os identificadores usados nos comandos Atr e expressões Var tenham sido previamente declarados com comandos Dcl.
verificaProg :: Cmd -> Bool
verificaProg cmd = ok
                   where 
                        (vars, ok) = verificaCmd (map (\(var, val) -> var) ambret) cmd


data MyMaybe a = MyJust a | MyNothing
                    deriving Show

avaliaProg :: Cmd -> MyMaybe Int
avaliaProg cmd = if ok then (foldr (\(var, val) a -> if var == "ret" then MyJust val else a) MyNothing (avaliaCmd ambret cmd)) else MyNothing
                 where 
                    ok = verificaProg cmd
-- print (avaliaProg (Atr "ret" (Num 2)))

main = print (avaliaProg (Atr "ret" (Num 2)))
