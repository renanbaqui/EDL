data Arvore a = Folha | Galho a (Arvore a) (Arvore a)
    deriving Show

arvore1 :: Arvore Int
arvore1 = Galho 7 (Galho 6 Folha Folha) (Galho 8  Folha (Galho 9 Folha Folha))

arvore2 :: Arvore Float
arvore2 = Galho 3.5 (Galho 3.0 Folha Folha) (Galho 4.0  Folha (Galho 4.5 Folha Folha))

arvore3 :: Arvore Bool
arvore3 = Galho True (Galho False Folha Folha) (Galho True  Folha (Galho False Folha Folha))


folhas :: Num a => Ord a => (Arvore a) -> a
folhas Folha         = 1
folhas (Galho _ e d) = (folhas e) + (folhas d)

altura :: Num a => Ord a => (Arvore a) -> a
altura Folha = 0
altura (Galho _ e d) = 
    if (altura e) > (altura d) 
        then (altura e) + 1
    else 
        (altura d) + 1

espelho :: (Arvore a) -> (Arvore a)
espelho Folha = Folha
espelho (Galho v e d) = Galho v (espelho d) (espelho e)

soma :: Num a => Ord a => (Arvore a) -> a
soma Folha         = 0
soma (Galho v e d) = v + (soma e) + (soma d)

dobra :: Num a => Ord a => (Arvore a) -> (Arvore a)
dobra Folha         = Folha
dobra (Galho v e d) = Galho (2*v) (dobra e) (dobra d)

possui :: Num a => Ord a => (Arvore a) -> a -> Bool
possui Folha value         = False
possui (Galho v e d) value = (v == value) || (possui e value) || (possui d value)

--Binária de busca

possui_bin :: Num a => Ord a => (Arvore a) -> a -> Bool
possui_bin Folha value  = False
possui_bin (Galho v e d) value = 
    if (value == v) then True
    else if (value <= v) then (possui_bin e value)
    else (possui_bin d value)    
    
maximo :: Num a => Ord a => (Arvore a) -> a
maximo Folha         = -1
maximo (Galho v e d) =  
    case d of
        Folha -> v
        _     -> (maximo d)

insere :: Num a => Ord a => (Arvore a) -> a -> (Arvore a)
insere Folha value         = (Galho value Folha Folha) 
insere (Galho v e d) value = 
    if (value <= v) then Galho v (insere e value) d
    else Galho v e (insere d value)

mapA :: (a -> b) -> Arvore a -> Arvore b
mapA f t = case t of
    Folha         -> Folha
    (Galho v e d) -> (Galho (f v) (mapA f e) (mapA f d))

dobra_folha :: Int -> Int
dobra_folha v = 2*v

par :: Int -> Bool
par v = v `mod` 2 == 0

to_string :: Int -> String
to_string v = show v

a1 = (mapA dobra_folha arvore1)
a2 = (mapA par arvore1)
a3 = (mapA to_string arvore1)

foldA :: (a -> b -> b) -> b -> Arvore a -> b
foldA f acc t = case t of
    Folha         -> acc
    (Galho val e d) -> (f val (foldA f (foldA f acc e) d))

soma_num :: Num a => Ord a => a -> a -> a
soma_num x y = x + y
a4 = (foldA soma_num 0 arvore2)

tolista :: (Int -> [Int] -> [Int])
tolista v l = v:l
a5 = (foldA tolista [] arvore1)

main = do
    (print a4)
    (print a5)
    (print (soma arvore1))
    (print (dobra arvore1))
    (print (possui arvore1 8))
    (print (folhas arvore1))
    (print (altura arvore1))
    (print (espelho arvore1))
    (print (possui_bin arvore1 5))
    (print (maximo arvore1))
    (print (insere arvore1 4))
