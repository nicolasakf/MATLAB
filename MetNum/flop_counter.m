
function flop_counter(var_file)

clc

profileStruct = profile('info');

fd = 0;

% Calculo de FLOPS para o metodo de Gauss Jordan

profile on
[flops_GJ,Details]  = FLOPS('GaussJordan',var_file,profileStruct);
flops_GJ = flops_GJ - fd;

% Calculo de FLOPS para o metodo de Gauss Naive

profile on
[flops_GN,Details]  = FLOPS('GaussNaive',var_file,profileStruct);
flops_GN = flops_GN - fd;

% Calculo de FLOPS para o metodo de Gauss completo

profile on
[flops_GP,Details]  = FLOPS('GaussPivot',var_file,profileStruct);
flops_GP = flops_GP - fd;

fprintf('\n----------------------------------------------------------\n')
fprintf('Flops para metodo de GaussNaive = %0.1d\n', flops_GN);
fprintf('Flops para metodo de GaussPivot = %0.1d\n', flops_GP);
fprintf('Flops para metodo de GaussJordan = %0.1d\n', flops_GJ);
end
