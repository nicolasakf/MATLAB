%Chapra 7

muller ('(x-4)*(x+3)*(x-1)','x',-4,-5,-6,0.0001,100) % raiz -3
muller ('(x-4)*(x+3)*(x-1)','x',0,-1,-2,0.0001,100) % raiz -1
muller ('(x-4)*(x+3)*(x-1)','x',3,2,1,0.0001,100) % raiz 4

bairstow (3, [1,-2,-11,12], 1, -1, 10, 0.0001) % raiz -3
bairstow (3, [1,-2,-11,12], 1, -1, 10, 0.0001) % raiz -1
bairstow (3, [1,-2,-11,12], 1, -1, 10, 0.0001) % raiz 4

%% COMENT?RIOS

%Ambos os m?todos s?o eficientes ao achar as ra?zes, mas pequena ? a
%diferen?a entre a varia??o do n?mero de itera??es de cada um. Podemos ver
%que o m?todo de muller com 4 itera??es j? ? capaz de cumprir com o es
%estipulado, ao passo que o metodo de bairstow demora uma itera??o a mais,
%para o mesmo tempo de processamento.
