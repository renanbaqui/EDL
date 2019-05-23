data Arvore = Folha | Galho Int Arvore Arvore
    deriving Show

a1 = Galho 1 (Galho 2 Folha Folha) (Galho 3 Folha Folha)
a2 = Galho 10 (Galho 20 (Galho 30 Folha Folha) Folha) Folha
a3 = Galho 50 Folha (Galho 100 (Galho 200 Folha Folha) (Galho 300 Folha Folha))

folhas :: Arvore -> Int
folhas Folha         = 1
folhas (Galho _ e d) = (folhas e) + (folhas d)

altura :: Arvore -> Int
altura Folha         = 0
altura (Galho _ e d) =  if (altura e) > (altura d) 
                        then 
                            (altura e) + 1 
                        else 
                            (altura d) + 1

espelho :: Arvore -> Arvore
espelho Folha         = Folha
espelho (Galho a e d) = Galho a (espelho d) (espelho e)

soma :: Arvore -> Int
soma Folha         = 0
soma (Galho a e d) = a + (soma e) + (soma d)

dobra :: Arvore -> Arvore
dobra Folha         = Folha
dobra (Galho a e d) = (Galho (2*a) (dobra e) (dobra d))

possui :: Arvore -> Int -> Bool
possui Folha _         = False
possui (Galho a e d) i = (a == i) ||  (possui e i) || (possui d i)

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


main = do print (folhas a3)
          print (altura a3)
          print (espelho a3)
          print (soma a3)
          print (dobra a3)
          print (possui a3 50)
          print (insere_bin a3 200)
