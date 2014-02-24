function Slow_coefficient_find

%%Look for eigenvalue negative real parts in the monoamine coefficient
%%matrix and linearization of AD, GABA 

% k1 = 0.49;
% k2 = 0.1;
% k3 = 0.3;
% k4 = 0.15;
G = 0.8;
A = 0.7;
i = 1;

while (1+i)>1
    
    c = rand(5,1);
    k1 = ;
    k2 = ;
    k3 = ;
    k4 = ;
    mu = ;
    M = [-k2-(G^2) -2*G*A;k4+(G^2) -k3+2*G*A];
    E = eig(M);
    R = real(E);
    
    if R(1:2)<zeros(2,1) %real parts of eigenvalues are all <0
        
        fid = fopen('slow_coefficients.txt','w');
        fprintf(fid,'%12.5f\n',c');
        fclose(fid);
        %Generate c as txt file
        disp(R)
        disp('Coefficients found!')
        break

    end
end