function coefficient_find

%%Look for eigenvalue negative real parts in the monoamine coefficient
%%matrix and linearization of AD, GABA 

GA1 = 1;
hNET = 0.457;
hSERT = 0.463;
hDAT = 1.22;
k1 = 0.49;
k2 = 0.1;
k3 = 0.3;
k4 = 0.15;
G = 0.3;
A = 0.2;
i = 1;

while (1+i)>1
    
    c = rand(50,1);
    M = [-c(1)-GA1,c(2),0,c(3),0,0,0,0,c(4),0;0,c(5)-c(6),0,0,c(7),c(8)-c(9),-c(10),0,c(11),-0.001;0,c(12),c(13)-c(14),c(15),0,c(16),0,0,c(17),0.001;0,c(18),c(19),c(20),0,0,-c(21),0,c(22),0;0,c(23),c(24),0,-c(25),-c(26),-c(27),0,c(28),0;0,c(29),0,c(30),0,-c(31)-c(32)-hNET,0,0,c(33),-0.001;0,c(34),c(35),0,0,c(36),-c(37)-c(38)-hSERT,0,c(39),-0.001;0,c(40),0,0,c(41),-c(42),c(43),-c(44)-hDAT,c(45),-0.001;0,0,0,0,0,0,0,0,-k2-G^2,-2*G*A;0,0,0,-c(46),-c(47),-c(48),-c(49),-c(50),k4+G^2,-k3+2*G*A];
    E = eig(M);
    R = real(E);
    
    if R(1:10)<zeros(10,1) %real parts of eigenvalues are all <0
        
        fid = fopen('coefficients.txt','w');
        fprintf(fid,'%12.5f\n',c');
        fclose(fid);
        %Generate c as txt file
        disp(R)
        disp('Coefficients found!')
        break

    end
end
