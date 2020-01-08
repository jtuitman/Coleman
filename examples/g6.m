/////////////////////////////////////////////
// Example 6.4.1: A curve of genus 6      //
/////////////////////////////////////////////

load "coleman.m";

Q:=-x^4*y - x^2*y^3 - x*y^4 + y^5 - x^4 + x^2*y^2 - x^3 + x^2 + x*y + 1;

p:=1009;
N:=3;
data:=coleman_data(Q,p,N);
r:=data`r;

Integers()!Evaluate(r,0) mod p;
Integers()!Evaluate(r,2) mod p;

//finite points

P1:=set_point(0,-1, data);
P2:=set_point(2,-1, data);
integrals:=coleman_integrals_on_basis(P1,P2,data);

