expoente = 5;
true_val = vpa(exp(-expoente),50);
inte = 20;


val = [];
val(1,1) = 1;
val(1,3) = 0;
for i = 1:inte
    
    
    if i ~= 1 && mod(i,2) ==0
        val(i,1) = val(i-1,1) - (expoente^(i-1))/factorial(i-1);
    end
    
    if i ~= 1 && mod(i,2) ~=0
        val(i,1) = val(i-1,1) + (expoente^(i-1))/factorial(i-1);
    end
    
    val(i,2) = true_val;
    
    val(i,3) = ((true_val - val(i,1))/true_val)*100;
    
    if i~=1 
        val(i,4) = ((val(i,1) - val(i-1,1))/val(i,1))*100;
    end
    
end
        
        
   
        