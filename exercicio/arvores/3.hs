data Arvore = Folha Int | Galho Arvore Arvore
    deriving Show

arvore1 = Galho (Galho (Folha 4) (Folha 6)) (Galho (Folha 8) (Folha 9))

folhas :: Arvore -> Int
folhas (Folha _ )  = 1
folhas (Galho e d) = (folhas e) + (folhas d)

altura :: Arvore -> Int
altura (Folha _ )  = 0
altura (Galho e d) = 
    if (altura e) > (altura d) 
        then (altura e) + 1
    else 
        (altura d) + 1

espelho :: Arvore -> Arvore
espelho (Folha v)   = (Folha v)
espelho (Galho e d) = Galho (espelho d) (espelho e)

soma :: Arvore -> Int
soma (Folha v)     = v
soma (Galho e d) = (soma e) + (soma d)

dobra :: Arvore -> Arvore
dobra (Folha v)    = Folha (2*v)
dobra (Galho e d)  = Galho (dobra e) (dobra d)

possui :: Arvore -> Int -> Bool
possui (Folha v) value   = v == value
possui (Galho e d) value = (possui e value) || (possui d value)

--possui_bin :: Arvore -> Int -> Bool (WIP) 
--(dúvida: é possível tomar proveito dessa implementação de árvore no algoritmo de possui_bin?) 

maximo :: Arvore -> Int
maximo (Folha v)     = v
maximo (Galho e d)   = 
    case d of
        (Folha value) -> value
        _             -> (maximo d)

insere :: Arvore -> Int -> Arvore
insere (Folha v) value   =
    if (v>value)
        then Galho (Folha value) (Folha v)
    else
        Galho (Folha v) (Folha value)  
insere (Galho e d) value = 
    if (maximo d) > value
        then Galho (insere e value) d
    else
        Galho e (insere d value)

main = do
    (print (soma arvore1))
    (print (dobra arvore1))
    (print (possui arvore1 8))
    (print (folhas arvore1))
    (print (altura arvore1))
    (print (espelho arvore1))
    --(print (possui_bin arvore1 5)) WIP
    (print (maximo arvore1))
    (print (insere arvore1 4))
