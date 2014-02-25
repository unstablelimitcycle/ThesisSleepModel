function [e1,e2,e3,e4,e5,e6] = alpha_solve(a1,a2,a3,a4,a5,a6,a7,a8)

%Exponents either 0,1 or 2. Know that a7 is fixed at 2, so by argument of
%symmetry, a6 should be 2, a5 should be 1 and a8 should be 1. Only alphas
%left to determine are a1, a2, a3, a4. Know a2 cannot be 0 due to zeta =
%10^(3*a2) - 1, so start it's loop at 1. 

tol = 10^(-5);
%Set order of error that we have been using consistently in analysis, which
%is that anything 
a1 = 0;
a2 = 1;
a3 = 0;
a4 = 0;
a5 = 1;
a6 = 2;
a7 = 2;
a8 = 1;
count = 0;

%First implement for the initial values
zeta = 10^(3*a2) - 1;
phi = (1 - 10^(3*(a6-a5-a4)))*(10^(-3*a8-3*a3) + 10^(3*a2-3*a7) - 10^(-3*a8) - 10^(3*a2-3*a7-3*a3))/(1-(10^(3*a6))*(10^(-3*a1-6*a4-3*a5) + 10^(-3*a1) - 10^(-3*a4-3*a5) - 10^(-6*a1-3*a4)));

e1 = 10^(3*a2)*(1/zeta)*(10^(-3*a7) - 10^(-3*a8));
e2 = (1/zeta)*(10^(-3*a8) - 10^(3*a2-3*a7));
e3 = 1;
e4 = phi*(1/zeta)*(10^(-3*a4-3*a5) - 10^(-3*a1));
e5 = -phi*(1/zeta)*(10^(-3*a5) - 10^(-6*a1));
e6 = phi*(1/zeta)*(1 - 10^(-3*a1-3*a4));

[e1,e2,e3,e4,e5]
count = count +1;

%Go into loops
if e1>tol && e2>tol && e4>tol && e5>tol && e6>tol
                
   [a1,a2,a3,a4,a5,a6,a7,a8,e1,e2,e3,e4,e5,e6]
   return;
else
    
    for i = 1:2
        for j = 1:2
            for k = 1:2
                a1 = k;
                
                zeta = 10^(3*a2) - 1;
                phi = (1 - 10^(3*(a6-a5-a4)))*(10^(-3*a8-3*a3) + 10^(3*a2-3*a7) - 10^(-3*a8) - 10^(3*a2-3*a7-3*a3))/(1-(10^(3*a6))*(10^(-3*a1-6*a4-3*a5) + 10^(-3*a1) - 10^(-3*a4-3*a5) - 10^(-6*a1-3*a4)));

                e1 = 10^(3*a2)*(1/zeta)*(10^(-3*a7) - 10^(-3*a8));
                e2 = (1/zeta)*(10^(-3*a8) - 10^(3*a2-3*a7));
                e4 = phi*(1/zeta)*(10^(-3*a4-3*a5) - 10^(-3*a1));
                e5 = -phi*(1/zeta)*(10^(-3*a5) - 10^(-6*a1));
                e6 = phi*(1/zeta)*(1 - 10^(-3*a1-3*a4));
                [e1,e2,e3,e4,e5]
                count = count+1;
                
                if e1>tol && e2>tol && e4>tol && e5>tol && e6>tol
                   [a1,a2,a3,a4,a5,a6,a7,a8,e1,e2,e3,e4,e5,e6]
                   break;
                else
                    a1 = 0;
                end
             end %End for loop 1
             
             a3 = j;
                
             zeta = 10^(3*a2) - 1;
             phi = (1 - 10^(3*(a6-a5-a4)))*(10^(-3*a8-3*a3) + 10^(3*a2-3*a7) - 10^(-3*a8) - 10^(3*a2-3*a7-3*a3))/(1-(10^(3*a6))*(10^(-3*a1-6*a4-3*a5) + 10^(-3*a1) - 10^(-3*a4-3*a5) - 10^(-6*a1-3*a4)));

             e1 = 10^(3*a2)*(1/zeta)*(10^(-3*a7) - 10^(-3*a8));
             e2 = (1/zeta)*(10^(-3*a8) - 10^(3*a2-3*a7));
             e4 = phi*(1/zeta)*(10^(-3*a4-3*a5) - 10^(-3*a1));
             e5 = -phi*(1/zeta)*(10^(-3*a5) - 10^(-6*a1));
             e6 = phi*(1/zeta)*(1 - 10^(-3*a1-3*a4));
             [e1,e2,e3,e4,e5]
             count = count +1;
             
             if e1>tol && e2>tol && e4>tol && e5>tol && e6>tol
                [a1,a2,a3,a4,a5,a6,a7,a8,e1,e2,e3,e4,e5,e6]
                break;
             else
                a3 = 0;
             end
             
        end %End for loop 2
        
        a4 = i;
        
        zeta = 10^(3*a2) - 1;
        phi = (1 - 10^(3*(a6-a5-a4)))*(10^(-3*a8-3*a3) + 10^(3*a2-3*a7) - 10^(-3*a8) - 10^(3*a2-3*a7-3*a3))/(1-(10^(3*a6))*(10^(-3*a1-6*a4-3*a5) + 10^(-3*a1) - 10^(-3*a4-3*a5) - 10^(-6*a1-3*a4)));

        e1 = 10^(3*a2)*(1/zeta)*(10^(-3*a7) - 10^(-3*a8));
        e2 = (1/zeta)*(10^(-3*a8) - 10^(3*a2-3*a7));
        e4 = phi*(1/zeta)*(10^(-3*a4-3*a5) - 10^(-3*a1));
        e5 = -phi*(1/zeta)*(10^(-3*a5) - 10^(-6*a1));
        e6 = phi*(1/zeta)*(1 - 10^(-3*a1-3*a4));
        [e1,e2,e3,e4,e5]
        count = count +1;
        if e1>tol && e2>tol && e4>tol && e5>tol && e6>tol
           [a1,a2,a3,a4,a5,a6,a7,a8,e1,e2,e3,e4,e5,e6]
           break;
        else
           a4 = 0;

        end
    end %end for loop 3
end

a2 = a2+1;
zeta = 10^(3*a2) - 1;
phi = (1 - 10^(3*(a6-a5-a4)))*(10^(-3*a8-3*a3) + 10^(3*a2-3*a7) - 10^(-3*a8) - 10^(3*a2-3*a7-3*a3))/(1-(10^(3*a6))*(10^(-3*a1-6*a4-3*a5) + 10^(-3*a1) - 10^(-3*a4-3*a5) - 10^(-6*a1-3*a4)));

e1 = 10^(3*a2)*(1/zeta)*(10^(-3*a7) - 10^(-3*a8));
e2 = (1/zeta)*(10^(-3*a8) - 10^(3*a2-3*a7));
e4 = phi*(1/zeta)*(10^(-3*a4-3*a5) - 10^(-3*a1));
e5 = -phi*(1/zeta)*(10^(-3*a5) - 10^(-6*a1));
e6 = phi*(1/zeta)*(1 - 10^(-3*a1-3*a4));
[e1,e2,e3,e4,e5]
count = count +1;
if e1>tol && e2>tol && e4>tol && e5>tol && e6>tol
   [a1,a2,a3,a4,a5,a6,a7,a8,e1,e2,e3,e4,e5,e6]
   return;
else
    for i = 1:2
        for j = 1:2
            for k = 1:2
                a1 = k;
                
                zeta = 10^(3*a2) - 1;
                phi = (1 - 10^(3*(a6-a5-a4)))*(10^(-3*a8-3*a3) + 10^(3*a2-3*a7) - 10^(-3*a8) - 10^(3*a2-3*a7-3*a3))/(1-(10^(3*a6))*(10^(-3*a1-6*a4-3*a5) + 10^(-3*a1) - 10^(-3*a4-3*a5) - 10^(-6*a1-3*a4)));

                e1 = 10^(3*a2)*(1/zeta)*(10^(-3*a7) - 10^(-3*a8));
                e2 = (1/zeta)*(10^(-3*a8) - 10^(3*a2-3*a7));
                e4 = phi*(1/zeta)*(10^(-3*a4-3*a5) - 10^(-3*a1));
                e5 = -phi*(1/zeta)*(10^(-3*a5) - 10^(-6*a1));
                e6 = phi*(1/zeta)*(1 - 10^(-3*a1-3*a4));
                [e1,e2,e3,e4,e5]
                count = count+1
                
                if e1>tol && e2>tol && e4>tol && e5>tol && e6>tol
                   [a1,a2,a3,a4,a5,a6,a7,a8,e1,e2,e3,e4,e5,e6]
                   break;
                else
                    a1 = 0;
                end
             end %End for loop 1
             
             a3 = j;
                
             zeta = 10^(3*a2) - 1;
             phi = (1 - 10^(3*(a6-a5-a4)))*(10^(-3*a8-3*a3) + 10^(3*a2-3*a7) - 10^(-3*a8) - 10^(3*a2-3*a7-3*a3))/(1-(10^(3*a6))*(10^(-3*a1-6*a4-3*a5) + 10^(-3*a1) - 10^(-3*a4-3*a5) - 10^(-6*a1-3*a4)));

             e1 = 10^(3*a2)*(1/zeta)*(10^(-3*a7) - 10^(-3*a8));
             e2 = (1/zeta)*(10^(-3*a8) - 10^(3*a2-3*a7));
             e4 = phi*(1/zeta)*(10^(-3*a4-3*a5) - 10^(-3*a1));
             e5 = -phi*(1/zeta)*(10^(-3*a5) - 10^(-6*a1));
             e6 = phi*(1/zeta)*(1 - 10^(-3*a1-3*a4));
             [e1,e2,e3,e4,e5]
             count = count +1;
             
             if e1>tol && e2>tol && e4>tol && e5>tol && e6>tol
                [a1,a2,a3,a4,a5,a6,a7,a8,e1,e2,e3,e4,e5,e6]
                break;
             else
                a3 = 0;
             end
             
        end %End for loop 2
        
        a4 = i;
        
        zeta = 10^(3*a2) - 1;
        phi = (1 - 10^(3*(a6-a5-a4)))*(10^(-3*a8-3*a3) + 10^(3*a2-3*a7) - 10^(-3*a8) - 10^(3*a2-3*a7-3*a3))/(1-(10^(3*a6))*(10^(-3*a1-6*a4-3*a5) + 10^(-3*a1) - 10^(-3*a4-3*a5) - 10^(-6*a1-3*a4)));

        e1 = 10^(3*a2)*(1/zeta)*(10^(-3*a7) - 10^(-3*a8));
        e2 = (1/zeta)*(10^(-3*a8) - 10^(3*a2-3*a7));
        e4 = phi*(1/zeta)*(10^(-3*a4-3*a5) - 10^(-3*a1));
        e5 = -phi*(1/zeta)*(10^(-3*a5) - 10^(-6*a1));
        e6 = phi*(1/zeta)*(1 - 10^(-3*a1-3*a4));
        [e1,e2,e3,e4,e5]
        count = count+1;
            
        if e1>tol && e2>tol && e4>tol && e5>tol && e6>tol
           [a1,a2,a3,a4,a5,a6,a7,a8,e1,e2,e3,e4,e5,e6]
           break;
        else
           a4 = 0;

        end
    end %end for loop 3
    
end


count



