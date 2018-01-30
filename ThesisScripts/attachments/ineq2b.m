function [out] = ineq2b(x,tb,paramvec)

% This is the steady-state system without a government budget constraint

% Assign parameters
alp = paramvec(1); D1 = paramvec(2); D2 = paramvec(3); 
etae = paramvec(4); etah = paramvec(5); A = paramvec(6);
bp = paramvec(7); bt = paramvec(8); n1 = paramvec(10); 
n2 = paramvec(9);
ti = 0;

s1 = x(1); h1 = x(2); c01 = x(3); c21 = x(4); 
s2 = x(5); h2 = x(6); c02 = x(7); c22 = x(8);
h = x(9); k = x(10); w = x(11); R = x(12); e1 = x(13);
e2 = x(14); c11 = x(15); c12 = x(16); b1 = x(17); b2 = x(18); 
te = x(19);
% Use FOCs to get output
out = [1/c11 - bp*bt*(1-tb)*R/c11;...
       1/c11 - bp*bt*w*D1*etae*(e1)^(etae-1)*h1^etah/((1-te)*c11);...
       1/c11 - bp/c01;...
       1/c21 - bp*(1-tb)/c11;...
       
       % Type One budget constraints
       w*h1+(1-tb)*b1-c11-c01-s1-(1+te)*e1;...
       R*s1-b1-c21;...
       h1^(1-etah) - D1*e1^etae; ...
       
       %Type Two FOCs
       1/c12 - bp*bt*(1-tb)*R/c12;...
       1/c12 - bp*bt*w*D2*etae*(e2)^(etae-1)*h2^etah/((1+te)*c12);...
       1/c12 - bp/c02;...
       1/c22 - bp*(1-tb)/c12;...
      
       % Type Two Constraints
       w*h2+(1-tb)*b2-c12-c02-s2-(1+te)*e2;...
       R*s2-b2-c22;...
       h2^(1-etah) - D2*e2^etae;... 
       
       % Economy Wide Budget Constraints
       w - (1-alp)*(k/h)^alp; ...
       R - alp*A*(k/h)^(alp-1);...
       k - (s1*n1+s2*n2);...
       h - (h1*n1+h2*n2);...
       
       tb*(b1*n1+b2*n2)+te*(e1*n1+e2*n2)];
    
   
