type Autores = [String]
type Musica  = (String, Int, Int)
bandas :: [Autores]
bandas = [ ["Gilberto Gil"],
           ["Victor","Leo"],
           ["Gonzagao"],
           ["Claudinho","Bochecha"] ]
musicas :: [Musica]
musicas = [ ("Aquele Abraco", 1, 100),
            ("Esperando na Janela", 1, 150),
            ("Borboletas", 2, 120),
            ("Asa Branca", 3, 120),
            ("Assum Preto", 3, 140),
            ("Vem Morena", 3, 200),
            ("Nosso Sonho", 4, 150),
            ("Quero te Encontrar", 4, 100) ]


nome :: [String]
nome = map (\(a,_,_) -> a) musicas

dois :: [Musica]
dois = filter (\(_,_,c) -> c >= 120) musicas

--duracao :: [Int]
--duracao = foldr (\(_,_,k) aux -> if k > aux then k else aux)o musicas

nomes2 :: [String]
nomes2 = map (\(a,_,_) -> a) (filter (\(_,_,c) -> c >= 120) musicas)

--main = print (nome, dois, nomes2)
main = print duracao
