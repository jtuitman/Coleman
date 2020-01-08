/////////////////////////////////////////////
// Example 6.4.2: A curve of genus 45      //
/////////////////////////////////////////////

load "coleman.m";

Q:=-x^11 - x^10*y + x^9*y^2 + x^4*y^7 - x^3*y^8 - x^2*y^9 + x*y^10 + y^11 + x^10 + x^9*y - x^7*y^3 - x^6*y^4 - 
    x^5*y^5 + x^4*y^6 - x^3*y^7 + x^2*y^8 + x*y^9 - x^9 - x^7*y^2 + x^6*y^3 + x^5*y^4 - 
    x^4*y^5 - x^3*y^6 - x^2*y^7 - y^9 + x^8 - x^6*y^2 - x^4*y^4 + x^3*y^5 + x*y^7 +
    y^8 - x^7 - x^6*y + x^5*y^2 - x^4*y^3 + x^3*y^4 - x^2*y^5 + x*y^6 - y^7 + 
    x^6 + x^5*y - x^4*y^2 - x*y^5 + y^6 - x^5 - x^4*y + x^3*y^2 - x^2*y^3 + 
    x*y^4 - x^4 - x^3*y- x^2*y^2 + x*y^3 - y^4 + x^3 + y^3 - x^2 + x + y;

p:=13;
N:=5;
data:=coleman_data(Q,p,N);

//finite points

P1:=set_point(0,-1,data);
P2:=set_point(0,0,data);
integrals:=coleman_integrals_on_basis(P1,P2,data);