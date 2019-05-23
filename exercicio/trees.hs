data Arvore = Folha | Galho Arvore Arvore
    deriving Show

a1 = Galho (Galho Folha Folha) (Galho Folha Folha)
a2 = Galho (Galho (Galho Folha Folha) Folha) Folha
a3 = Galho Folha (Galho (Galho Folha Folha) (Galho Folha Folha))

folhas :: Arvore -> Int
folhas Folha       = 1
folhas (Galho e d) = (folhas e) + (folhas d)

altura :: Arvore -> Int
altura Folha       = 1
altura (Galho e d) = if (altura e) > (altura d) 
                     then 
                        (altura e) + 1 
                     else 
                        (altura d) + 1

espelho :: Arvore -> Arvore
espelho Folha       = Folha
espelho (Galho e d) = (Galho d e)


main = print (espelho a3)
