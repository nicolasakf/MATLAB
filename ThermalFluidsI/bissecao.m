function [x,er,it] = bissecao(fxvec,xl,xu,es)

    xi = (xl + xu)/2;
    er = (xu - xl)/2;
    it = 0;

    while er > es
        
        fa = fxvec(1)*xl^2 + fxvec(2)*xl + fxvec(3);
        fxi = fxvec(1)*xi^2 + fxvec(2)*xi + fxvec(3);

        if fa*fxi > 0
            xl = xi; 
        elseif fa*fxi < 0
            xu = xi; 
        else
            if fa == 0
                x = xl;
                er = 0;
                break
            else
                x = xi;
                er = 0;
                break
            end
        end

        xi = (xl + xu)/2;
        er = (xu - xl)/2;

        x = xi;

        it = it + 1;

    end
    
end