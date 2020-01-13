
function I = int_trapezio(xvalues)

    % xvalues -> vector [0:step:n]
    
    I = 0;
    y = zeros(1,length(xvalues));
    integral_y = zeros(1,length(xvalues));
    h = (xvalues(1,2)-xvalues(1,1));
    
    count = 1;
    for x = xvalues
        y(1,count) = 6+3*cos(x); % f(x)
        if (count ~= 1)
            I = I + ((y(1,count)+y(1,count-1))*h)/2;
            integral_y(1,count) = I;
        end
        count = count+1;
    end
    
    %plot(xvalues,y,xvalues,integral_y,'LineWidth',3);
    %legend('f(x)','integral f(x)','Location','NorthWest');
 
end



