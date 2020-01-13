% Ex. 9.13

a = [1,1,-1;6,2,2;-3,4,1];
b = [-3;2;1];
numit = false;
    
xa = GaussNaive(a,b,numit) % item a)
xb = GaussPivot(a,b,numit) % item b)
xc = GaussJordan(a,b,numit) % item c)

%% COMENTARIOS

% Como a matriz ? de ordem pequena, os m?todos n?o apresentam notaveis varia??es entre si.
% S? seremos capazes de perceber tais distin??es para matrizes de ordem maiores. L?, erros de
% arredondamento ser?o bem percept?veis nos m?todos de Gauss Naive e com pivotamento, enquanto o m?todo
% de GaussJordan se mostra mais exato para matrizes grandes, mas muito mais ineficiente 
% para matrizes pequenas, por necessitar de um n?mero maior de itera??es na fase de substitui??o progressiva.