function taylor

    pts = [-3,-2,-1,0,1];
    
    n = length(pts);
    system = sym(zeros(n,n)); %use symbolic math library
    first = zeros(n,1);
    second = zeros(n,1);
    third = zeros(n,1);
    
    
    %get system
    for i=1:n
        for j=1:n
            system(j,i) = pts(i)^(j-1);         
        end
    end
    
    disp(system)
    
    %first derivative
    first(2) = 1;
    second(3) = 2;
    third(4) = 6;
    
    disp('for function coeficients in the respective order')
    disp(pts)

    disp('first derivative coeffs:')
    first = system\first;
    disp(transpose(first)) %transpose for readability
    
    %test for order of accuracy
    err =0;
    for i = 1:n
        err = err + first(i)*pts(i)^n;
    end
    if err == 0
        %extra order of accuracy
        disp('Order:')
        disp(n)
    else
        disp('Order:')
        disp(n-1)
    end
    
    
    disp('second derivative coeffs:')
    second = system\second;
    disp(transpose(second))
    
    %test for order of accuracy
    err =0;
    for i = 1:n
        err = err + second(i)*pts(i)^n;
    end
    if err == 0
        %extra order of accuracy
        disp('Order:')
        disp(n-1)
    else
        disp('Order:')
        disp(n-2)
    end
    
    disp('third derivative coeffs:')
    third = system\third;
    disp(transpose(third))
    
    %test for order of accuracy
    err =0;
    for i = 1:n
        err = err + third(i)*pts(i)^n;
    end
    if err == 0
        %extra order of accuracy
        disp('Order:')
        disp(n-2)
    else
        disp('Order:')
        disp(n-3)
    end
    
    
   
end
