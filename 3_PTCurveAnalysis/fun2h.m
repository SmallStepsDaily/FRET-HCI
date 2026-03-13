%%%%%%%%%%%          dual-mechanism peak model              %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%         by Gao lu         %%%%%%%%%%%%%%%%%%%%%%%%%%%%

function y = model_function(x, params,t)
    k1=params(1);k2=params(2);Ki=params(3);k3=params(4);k4=params(5);Ke=params(6);m=params(7);n=params(8);
    y =  1-1./(1+(((k1+k2*x./(Ki+x)).*(1-exp(-k3*t))).^m+k4*x./(Ke+x)).^n);
