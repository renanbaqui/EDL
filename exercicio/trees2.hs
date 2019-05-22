data Arvore a = Folha | Galho a (Arvore a) (Arvore a)
    deriving Show

a1 = Galho 10 (Galho 10 Folha Folha) (Galho 10 Folha Folha)
a2 = Galho 10 (Galho 10 (Galho 20 Folha Folha) Folha) Folha
a3 = Galho 10 Folha (Galho 10 (Galho 20 Folha Folha) (Galho 10 Folha Folha))

soma :: Num a => Arvore a -> a
soma Folha         = 0
soma (Galho v e d) = v + (soma e) + (soma d)

dobra :: Arvore Int -> Arvore Int
dobra Folha         = Folha
dobra (Galho v e d) = Galho (2*v) (dobra e) (dobra d)

f1 = soma a1
f2 = dobra a2

main = putStrLn("\n Soma A1 = " ++ (show f1) ++ 
"\n Dobra A2 = " ++ (show f2))
