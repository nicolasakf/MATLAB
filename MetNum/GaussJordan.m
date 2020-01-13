
function [x,err]=GaussJordan(A,B,numit,pivot)

    iter = 0;
    [n,m]=size(A); % size of matrix A
    err =0;
    x=zeros(n,1);
    
    if n ~= m
        displ('error: n~=m');
        err = 1;
    end
    if length(B) ~= n 
        disp('error: wrong size of B');
        err = 2;
    else
        if size(B,2) ~= 1
            B=B';
            disp('error: B is a matrix');
            err = 3;
        end
    end
    if err == 0
        Aa=[A,B];
        for i=1:n 
            if pivot
                [Aa(i:n,i:n+1),err]=gauss_pivot(Aa(i:n,i:n+1));
             else
                err = 0;
            end
            if err == 0
                Aa(1:n,i:n+1)=gauss_jordan_step(Aa(1:n,i:n+1),i);
                iter = iter + 1;
            end
        end
        x=Aa(:,n+1);
    end
    A=0;
    
    if numit
        display(iter);
    end
    
end

%----------------------------------------------------

function A1=gauss_jordan_step(A,i)

    [n,m]=size(A); % size of matrix A
    A1=A;
    s=A1(i,1);
    A1(i,:) = A(i,:)/s;
    k=[[1:i-1],[i+1:n]];
    for j=k
        s=A1(j,1);
        A1(j,:)=A1(j,:)-A1(i,:)*s;
    end
end

%----------------------------------------------------------

function [A1,err]=gauss_pivot(A)

    [n,m]=size(A); % size of matrix A
    A1=A;
    err = 0; % error flag
    if A1(1,1) == 0
        check = true;
        i = 1;
        while check
            i = i + 1;
            if i > n  
                disp('error: matrix is singular');
                err = 1;
                check = false;
            else
                if A(i,1) ~= 0 && check
                    check = false;
                    B=A1(i,:);      % next three operations exchange rows 1 and i
                    A1(i,:)=A1(1,:);
                    A1(1,:)=B;
                end
            end
        end
    end
end