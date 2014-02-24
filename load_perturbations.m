function V = load_perturbations

A = load('long_night_times.txt');
[m,n] = size(A);

for i = 1:m
    %vector of perturbation in units of var_gamma_sleep_model,i.e. 8
    %minutes = 1 unit. Matrix A is the perturbations in minutes.
    V(i) = A(i,1);
end
V = V/60;