%%%%%%%%%%%          PT(c,t) curve fitting              %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%         by Gao lu         %%%%%%%%%%%%%%%%%%%%%%%%%%%%
  clc;
clear all;

initial_guess = [1; 1; 1; 1; 1; 1; 1; 1];  % Initial guess value [a; b; c]
lb = [0; 0; 0; 0; 0; 0; 0; 0];         % Parameter lower bound [a_min; b_min; c_min]
ub = [Inf; Inf; Inf;Inf; Inf; Inf;Inf; Inf];        % Upper bound of parameter [a_max; b_max; c_max]
%p0=[1 1 1 1 1 1 1 1];
c=[15 22 28];  % Concentration value
ydata = [0.005566996	0.104090421	0.015289911	0.302309604	0.029682072	0.364361859	0.32742138	0.0288308	0.379170658];  % PT value
ydata=reshape(ydata,3,3); 

%========================Curve fitting was performed according to different time points==========================%
[params_fit_2] = lsqnonlin(@(p) calculateRMSE(p, c, ydata(:,1),2), initial_guess, lb, ub);  % 2 h

[params_fit_4] = lsqnonlin(@(p) calculateRMSE(p, c, ydata(:,2),4), initial_guess, lb, ub);  % 4 h

[params_fit_6] = lsqnonlin(@(p) calculateRMSE(p, c, ydata(:,3),6), initial_guess, lb, ub);  % 6 h



fun_2 = @(p,x) 1-1./(1+(((p(1)+p(2)*x./(p(3)+x)).*(1-exp(-p(4)*2))).^p(7)+p(5)*x./(p(6)+x)).^p(8));


fun_4 = @(p,x) 1-1./(1+(((p(1)+p(2)*x./(p(3)+x)).*(1-exp(-p(4)*4))).^p(7)+p(5)*x./(p(6)+x)).^p(8));


fun_6 = @(p,x) 1-1./(1+(((p(1)+p(2)*x./(p(3)+x)).*(1-exp(-p(4)*6))).^p(7)+p(5)*x./(p(6)+x)).^p(8));

x=0.01:0.01:1000;

R_2=fun_2(params_fit_2,x); 
R_4=fun_4(params_fit_4,x); 
R_6=fun_6(params_fit_6,x); 
semilogx(x, R_2);hold on;semilogx(x,R_4);semilogx(x,R_6);scatter(c,ydata(:,1));scatter(c,ydata(:,2));scatter(c,ydata(:,3));
%plot(x, R_2);hold on;plot(x, R_4);plot(x, R_6);scatter(t,ydata(1,:));scatter(t,ydata(2,:));scatter(t,ydata(3,:));
R_2=R_2';
R_4=R_4';
R_6=R_6';
params_fit_2=params_fit_2';
params_fit_4=params_fit_4';
params_fit_6=params_fit_6';
params_fit=[params_fit_2;params_fit_4;params_fit_6];
R=[R_2,R_4,R_6];