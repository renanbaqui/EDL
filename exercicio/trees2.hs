data Arvore = Folha | Galho Int Arvore Arvore
    deriving Show

a1 = Galho 10 (Galho 20 Folha Folha) (Galho 30 Folha Folha)
a2 = Galho 5 (Galho 15 (Galho 25 Folha Folha) Folha) Folha
a3 = Galho 100 Folha (Galho 120 (Galho 130 Folha Folha) (Galho 140 Folha Folha))

folhas :: Arvore -> Int
folhas Folha         = 1
folhas (Galho _ e d) = (folhas e) + (folhas d)

altura :: Arvore -> Int
altura Folha         = 1
altura (Galho _ e d) = if (altura e) > (altura d) 
                        then 
                            (altura e) + 1 
                        else 
                            (altura d) + 1

espelho :: Arvore -> Arvore
espelho Folha         = Folha
espelho (Galho v e d) = (Galho v d e)

soma :: Arvore -> Int
soma Folha         = 0
soma (Galho v e d) = v + (soma e) + (soma d)

dobra :: Arvore -> Arvore
dobra Folha         = Folha
dobra (Galho v e d) = (Galho (2*v) (dobra e) (dobra d))

possui :: Arvore -> Int -> Bool
possui Folha _         = False
possui (Galho v e d) i = (v == i) ||  (possui e i) || (possui d i)

maximo_bin :: Arvore -> Int
maximo_bin Folha         = 0
maximo_bin (Galho v _ d) = if x > y then 
                            x
                           else
                            y
                           where
                            x = v
                            y = (maximo_bin d)

insere_bin :: Arvore -> Int -> Arvore
insere_bin Folha _         = Folha
insere_bin (Galho v e d) a = if (maximo_bin d) <= a then
                               (Galho a (Galho v Folha d) e)
                             else
                                if v <= a then
                                    (Galho v (insere_bin e a) d)
                                else
                                    (Galho v e (insere_bin d a))


main = print (insere_bin a3 200)
