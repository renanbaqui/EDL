data Arvore = Folha Int | Galho Arvore Arvore
    deriving Show

a1 = Galho (Galho (Folha 10) (Folha 20)) (Galho (Folha 30) (Folha 40))
a2 = Galho (Galho (Galho (Folha 5) (Folha 15)) (Folha 25)) (Folha 35)
a3 = Galho (Folha 100) (Galho (Galho (Folha 120) (Folha 140)) (Galho (Folha 160) (Folha 180)))

folhas :: Arvore -> Int
folhas (Folha _)   = 1
folhas (Galho e d) = (folhas e) + (folhas d)

altura :: Arvore -> Int
altura (Folha _)   = 1
altura (Galho e d) = if (altura e) > (altura d) 
                        then 
                            (altura e) + 1 
                        else 
                            (altura d) + 1

espelho :: Arvore -> Arvore
espelho (Folha v)   = (Folha v)
espelho (Galho e d) = (Galho d e)

soma :: Arvore -> Int
soma (Folha v)   = v
soma (Galho e d) = (soma e) + (soma d)

dobra :: Arvore -> Arvore
dobra (Folha v)         = (Folha (2*v))
dobra (Galho e d) = (Galho (dobra e) (dobra d))

possui :: Arvore -> Int -> Bool
possui (Folha v) i   = i == v
possui (Galho e d) i = (possui e i) || (possui d i)

maximo_bin :: Arvore -> Int
maximo_bin (Folha v)   = v
maximo_bin (Galho e d) = if x > y then 
                            x
                           else
                            y
                           where
                            x = (maximo_bin e)
                            y = (maximo_bin d)

insere_bin :: Arvore -> Int -> Arvore
insere_bin (Folha v) a   =  if v > a then 
                                Galho (Folha a) (Folha v)
                            else
                                Galho (Folha v) (Folha a)
insere_bin (Galho e d) a = Galho e (insere_bin d a)


main = print (insere_bin a2 2)
