data Arvore = Folha | Galho Arvore Arvore
    deriving Show

a1 = Galho (Galho Folha Folha) (Galho Folha Folha)
a2 = Galho (Galho (Galho Folha Folha) Folha) Folha
a3 = Galho Folha (Galho (Galho Folha Folha) (Galho Folha Folha))

folhas :: Arvore -> Int
folhas Folha       = 1
folhas (Galho e d) = (folhas e) + (folhas d)

altura :: Arvore -> Int
altura Folha = 0
altura (Galho d e) = if (folhas d > folhas e) then (1 + altura d)
                     else (1 + altura e)

espelho :: Arvore -> Arvore
espelho Folha = Folha
espelho (Galho d e) = Galho (espelho e) (espelho d)


-- main = putStrLn("\n A1 = " ++ (show a1) ++ 
                "\n A2 = " ++ (show a2) ++ 
                "\n A3 = " ++ (show a3) ++
                "\n Folhas A1 = " ++ (show (folhas a1)) ++ 
                "\n Altura A2 = " ++ (show (altura a2)) ++ 
"\n Espelho A3 = " ++ (show (espelho a3)))
