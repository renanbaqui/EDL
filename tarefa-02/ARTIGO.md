# Linguagem C++

[1 Origens e influências](#an-h2-header)

[2 Classificação](#an-h2-header)

[3 Avaliação comparativa com foco em expressividade](#an-h2-header)

[4 Exemplos de códigos representativos](#an-h2-header)


**Origens e Influências**

A linguagem de programação C++ foi desenvolvida pelo cientista dinamarquês Bjarne Stroustrup, que começou a trabalhar no "C
com classes", o predecessor do C++ em 1979. Stroustrup percebeu que a linguagem Simula tinha características muito interessantes
para desenvolvilmente de programas grandes de software, mas era muito lenta para uso prático, enquanto o a linguagem BCPL era
rápida, mas de muito baixo nível para ser aplicada em desenvolvimento de softwares grandes. Quando Stroustrup começou a
trabalhar na AT&T Bell Labs, ele teve a tarefa de analizar o kernel do UNIX e, através de sua experiência no Ph.D., ele pode
melhorar a linguagem C com caracteristicas do Simula. O cientista escolheu a linguagem C por ser de uso geral, rápida, portátil
e usada amplamente.

Seguem abaixo todas as linguaguens que tiveram influencia na criação do C++: 
* Ada
* ALGOL 68
* C
* CLU
* ML
* Simula

**Classificação**

Podemos classificara linguagem C++ quanto aos seguintes aspectos:
* Multi-paradigma
* Procedural
* Funcional
* Orientada a objetos
* Estática

A linguagem C++ foi projetada para suportar múltiplos paradigmas de programação, principalmente programação 
estruturada e programação orientada a objetos, que permite ao programador escolher a melhor solução para um
determinado problema. Intitulamos C++ como uma linguagem multiparadigmas por ter as características descritas acima.
Outra característica é a tipagem estática, ou seja, a verificação do tipo de dado é feita em tempo de compilação.

**Comparação**

###Linguagem C                                       

Programação estruturada 

   Tipagem estática   
   
    #include<stdio.h>				
	  int main()						
	  {						
	     printf("Hello, World\n!");		
    }			
    
###Linguagem C++

Multiparadigma

   Tipagem estática    
   
    #include<iostream>
    int main()
    {
        std::cout<<"Hello, world!"<<"\n";
    }
   **As linguagens descritas acima tem sintaxe diferente e semântica igual.**

##Vantagens
		#include <iostream>

		class Data
		{
			int dia;
			int mes;
			int ano;
			void escreve()
			{
				cout<<dia<<'/'<<mes<<'/'<<ano;
			}
			void le()
			{
				char barra1, barra2;
				cin>>dia>>barra1>>mes>>barra2>>ano;	
			}
		};

		main()
		{
			Data d={1,12,2000};
			d.escreve();
			d.le();
			d.escreve();
			return 0;
		}

No código acima temos a implementação de uma classe que pega datas e imprime as mesmas. Em c++ esta implementação é melhor
organizada do que na linguagem C. Isso faz com que se entenda o código mais facilmente.

- A classe "clock" é definida da seguinte maneira: 


		class clock
       		{ 
        	      protected: 
						int hr; 
						int min; 
						int sec; 
						int is_pm; 
        	      public: 
				 		clock(int h, int m, int s, int pm); 
			      		void set_clock (int h, int m, int s, int pm);  
			      		void read_clock (int &h, int &m, int &s, int &pm); 
			      		void advance(); 
		};
	
	
- Temos também a classe calendar

		class calendar
		{ 
			protected: 
					int mo; 
					int day; 
        			int yr; 
	  		public:
        			calendar(int m, int d, int y); 
        			void set_calendar (int m, int d, int y);  
					void read_calendar (int &m, int &d, int &y);  
					void advance();
		};
	
- E a classe clock_calendar é a classe filha dessas duas outras classes, isso se chama herança múltipla 
e torna nosso código mais genérico, entre outras coisas, como, menos linhas de comando pra digitar. Temos assim,
uma vantagem para as demais linguagens. 


        class clock_calendar : public clock, public calendar { 
        	 public: 
        	 		clock_calendar(int mt, int d, int y, int h, int mn,int s, int pm); 
        	 		void advance(); 
        };

**Exemplos de códigos representativos**
C++ é uma linguagem de uso geral e já foi utilizada para diversas aplicações, como na lista a seguir:

- Microsoft Windows
- Apple macOS
- Beos
- Solaris
- Symbian
- Mozilla Firefox e Thunderbird
- Google.com
- YouTube.com
- Amazon.com
- Twitter.com
- Adobe (Photoshop, Image Ready, Illustrator e Premier)
- Source Engine (Half-Life, Left 4 Dead, TF2, Counter-Strike)
- Creation Engine (Skyrim, Fallout 4, Oblivion)

**Conclusão**

C++ é uma das linguagens mais utilizadas do mundo, ocupando a 5° posição no ranking da Redmonk. Faz sucesso
por ser uma linguagem multiparadigma e de uso geral. Um dos motivos para tal sucesso é a existência de várias
possibilidades para resolver um determinado problema.

https://en.wikipedia.org/wiki/C%2B%2B#Language
https://www.quora.com/What-is-C++-used-for
https://www.mycplus.com/featured-articles/top-10-applications-written-in-c-cplusplus/

