load "coleman.m";

print "";
print "//////////////////////////";
print "// 1. An elliptic curve //";
print "//////////////////////////\n";

Q:=y^2-(x^3-10*x+9);
p:=5;
N:=10;
data:=coleman_data(Q,p,N);

print "/////////////////////";
print "// 1a. good points //";
print "/////////////////////\n";

P1:=set_point(0,3,data);  // not bad
P2:=set_point(8,21,data); // not bad
C:=coleman_integrals_on_basis(P1,P2,data);
C;
print "(O(5^9) 6 + O(5^9))\n";

print "//////////////////////////";
print "// 1b. finite bad point //";
print "//////////////////////////\n";

P3:=set_bad_point(1,[1,0],false,data); // finite bad
C:=coleman_integrals_on_basis(P1,P3,data:e:=51);
C;
print "(-7179*5^2 + O(5^8) 11778*5 + O(5^8))\n";

print "////////////////////////";
print "// 1c. infinite point //";
print "////////////////////////\n";

P4:=set_bad_point(0,[1,0],true,data); // infinite
C:=coleman_integrals_on_basis(P2,P4,data:e:=11); 
C;
print "(-38429*5^2 + O(5^9) 449509 + O(5^9))\n";


print "///////////////////////////////////////////////";
print "// 2. Bruin-Poonen-Stoll (Winf not diagonal) //";
print "///////////////////////////////////////////////\n";

Q:=y^3 + (-x^2 - 1)*y^2 - x^3*y + x^3 + 2*x^2 + x;
p:=7;
N:=10;
Qp:=pAdicField(p,N);
data:=coleman_data(Q,p,N);

print "/////////////////////";
print "// 2a. good points //";
print "/////////////////////\n";

P1:=set_point(5,-32582624253112412,data);
P2:=set_point(12,25123732258943588,data);
C:=coleman_integrals_on_basis(P1,P2,data);
T:=tiny_integrals_on_basis(P1,P2,data);
C-T;
print "(O(7^8) O(7^8) O(7^8) O(7^8) O(7^8) O(7^8))\n";

print "///////////////////////////";
print "// 2b. finite bad points //";
print "///////////////////////////\n";

P3:=set_point(0,0,data); // finite bad
P4:=set_point(0,1,data); // finite bad
C:=coleman_integrals_on_basis(P1,P3,data:e:=100); 
C;
print "(-104229*7 + O(7^8) -2602786 + O(7^8) -2257042 + O(7^8) 108639*7 + O(7^8) -6438562*7^-1 + O(7^8) -7758692*7^-1 + O(7^8))\n";
C:=coleman_integrals_on_basis(P1,P4,data:e:=100);
C;
print "(-339180*7 + O(7^8) -175852 + O(7^8) -2324712 + O(7^8) -1663472 + O(7^8) -7984639*7^-1 + O(7^8) 16597394*7^-1 + O(7^8))\n";

print "//////////////////////////////////////////";
print "// 2c. infinite points (all unramified) //";
print "//////////////////////////////////////////\n";

P5:=set_bad_point(0,[1,0,1],true,data); // infinite
P6:=set_bad_point(0,[1,1,1],true,data); // infinite
P7:=set_bad_point(0,[1,0,0],true,data); // infinite

C:=coleman_integrals_on_basis(P1,P5,data:e:=100);
C;
print "(-46706*7^2 + O(7^8) 2443208 + O(7^8) 1041297 + O(7^8) -2700452 + O(7^8) -16999495*7^-1 + O(7^8) 2072740*7^-1 + O(7^8))\n";
C:=coleman_integrals_on_basis(P1,P6,data:e:=100);
C;
print "(400542*7 + O(7^8) 2475229 + O(7^8) 2574377 + O(7^8) -2426073 + O(7^8) -6338660*7^-1 + O(7^8) 7283886*7^-1 + O(7^8))\n";
C:=coleman_integrals_on_basis(P1,P7,data:e:=100);
C;
print "(202305*7 + O(7^8) 1229741 + O(7^8) 1075132 + O(7^8) -780802 + O(7^8) 2476392*7^-1 + O(7^8) -8276616*7^-1 + O(7^8))\n";


print "/////////////////////////////////////////////////////";
print "// 3. modular curve X0(44) (plane model singular!) //";
print "/////////////////////////////////////////////////////\n";

Q:=y^5+12*x^2*y^3-14*x^2*y^2+(13*x^4+6*x^2)*y-(11*x^6+6*x^4+x^2);
p:=7;
N:=10;
data:=coleman_data(Q,p,N);

print "/////////////////////";
print "// 3a. good points //";
print "/////////////////////\n";

P1:=set_point(1,1,data);
P2:=set_point(8,29647929146699830,data);
C:=coleman_integrals_on_basis(P1,P2,data);
T:=tiny_integrals_on_basis(P1,P2,data);
C-T;
print "(O(7^8) O(7^8) O(7^8) O(7^8) O(7^8) O(7^8) O(7^8) O(7^8))\n";

print "//////////////////////////";
print "// 3b. finite bad point //";
print "//////////////////////////\n";

P3:=set_bad_point(0,[1,0,0,0,0],false,data); // finite bad
C:=coleman_integrals_on_basis(P1,P3,data:e:=100); // (15(P3-P1)=O on the Jacobian!)
C;
print "(O(7^5) O(7^5) O(7^5) O(7^5) 6775 + O(7^5) -14701*7^-1 + O(7^5) 3239 + O(7^5) 41632*7^-1 + O(7^5))\n";

print "////////////////////////"; 
print "// 3c. infinite point //";
print "////////////////////////\n";

P4:=set_bad_point(0,[1,0,0,0,0],true,data); // infinite
C:=coleman_integrals_on_basis(P1,P4,data:e:=100); // (15(P4-P1)=O on the Jacobian!)
C;
print "(O(7^7) O(7^7) O(7^7) O(7^7) -329870 + O(7^7) 2808875*7^-1 + O(7^7) -38631 + O(7^7) -76017*7^-1 + O(7^7))\n";
