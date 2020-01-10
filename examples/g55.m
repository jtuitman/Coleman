load "coleman.m";
f:=x^11*y - x^7*y^5 - x^6*y^6 - x^4*y^8 + x*y^11 + y^12 + x^11*1 - x^10*y*1 + x^8*y^3*1 - x^6*y^5*1 + x^5*y^6*1 + 
    x^3*y^8*1 - x^2*y^9*1 - x*y^10*1 + y^11*1 + x^10*1^2 + x^9*y*1^2 - x^8*y^2*1^2 + x^7*y^3*1^2 + x^6*y^4*1^2 + 
    x^5*y^5*1^2 - x^4*y^6*1^2 + x*y^9*1^2 + y^10*1^2 - x^9*1^3 + x^8*y*1^3 + x^7*y^2*1^3 + x^6*y^3*1^3 + x^5*y^4*1^3 + 
    x^4*y^5*1^3 + x^3*y^6*1^3 - x^2*y^7*1^3 + y^9*1^3 + x^8*1^4 - x^7*y*1^4 + x^6*y^2*1^4 - x^5*y^3*1^4 + x*y^7*1^4 + 
    y^8*1^4 + x^7*1^5 + x^6*y*1^5 + x^5*y^2*1^5 - x^2*y^5*1^5 - x*y^6*1^5 + y^7*1^5 - x^6*1^6 - x^4*y^2*1^6 - 
    x^2*y^4*1^6 + x*y^5*1^6 - x^5*1^7 + x^3*y^2*1^7 - x^2*y^3*1^7 + y^5*1^7 - x^4*1^8 + x^3*y*1^8 + x^2*y^2*1^8 + 
    x*y^3*1^8 + y^4*1^8 - x^2*y*1^9 - x*y^2*1^9 + y^3*1^9 - x^2*1^10 - x*y*1^10 + x*1^11 + y*1^11;
p:=7;
t1:=Cputime();
data:=coleman_data(f,p,5);
t2:=Cputime();
t2-t1;


r:=data`r;
Integers()!Evaluate(r,0) mod p; 
Integers()!Evaluate(r,1) mod p;
P1:=set_point(0,0 ,data);
P2:=set_point(1,0 ,data);
t3:=Cputime();
integrals:=coleman_integrals_on_basis(P1,P2,data);
t4:=Cputime();
t4-t3;