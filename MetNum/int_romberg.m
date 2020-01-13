
function I = int_romberg(imax,x0,xf)

    % imax = n_interactions + 1

    matrizI = zeros(imax,imax);
    
    for i = 1:imax
         matrizI(imax+1-i,1) = trapezio_romberg([x0:xf/((imax+1-i)^2):xf]);
    end
    
    for j = 1:imax
        for i = 1:imax-j
            if j ~= imax
                matrizI(i,j+1) = (4^j*matrizI(i+1,j)-matrizI(i,j))/(4^j-1);
            end
        end
    end
    matrizI
    I = matrizI(1,imax);
end


function It = trapezio_romberg (xvalues)

    It = 0;
    y = zeros(1,length(xvalues));
    integral_y = zeros(1,length(xvalues));
    h = (xvalues(1,2)-xvalues(1,1));
    
    count = 1;
    for x = xvalues
        y(1,count) = (x+1/x)^2; % f(x)
        if (count ~= 1)
            It = It + ((y(1,count)+y(1,count-1))*h)/2;
            integral_y(1,count) = It;
        end
        
    count = count+1;
    end
    
end