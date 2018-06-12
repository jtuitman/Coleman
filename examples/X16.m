/////////////////////////////////////////////////////////////////////////////////////////////////////
// X16 from http://www.birs.ca/workshops/2017/17w5065/files/explicit-moduli-banff-2017-probs-2.pdf //
/////////////////////////////////////////////////////////////////////////////////////////////////////

P3<a,b,c,d>:=ProjectiveSpace(RationalField(),3);

f1 := a^2 + 51*a*b + 648*b^2 - 900*a*c - 22086*b*c + 211572*c^2 - 25650*a*d- 629856*b*d + 11499732*c*d + 156402576*d^2;

f2 := a*b^2 + 24*b^3 - 438*a*b*c - 10818*b^2*c - 11232*a*c^2 -  186732*b*c^2 - 243648*c^3 - 12996*a*b*d - 320382*b^2*d -  285444*a*c*d - 2161728*b*c*d- 104818536*c^2*d +  992412*a*d^2 + 90530136*b*d^2 - 5156170344*c*d^2 - 67660478712*d^3;

X16 := Curve(ProjectiveSpace(Rationals(),3),[f1,f2]);

// First find a plane model

K:=FunctionField(X16);
A,B:=AlgorithmicFunctionField(K);

f:=DefiningPolynomial(A);
R:=Parent(f);
S:=BaseRing(R);
g:=(S.1+207/8)^4*Evaluate(f,R.1/(S.1+207/8));

AssignNames(~R,["y"]);
AssignNames(~S,["x"]);

1024^4*Evaluate(1024*g,R.1/1024);
/*
y^5 + (-462336*x^2 - 25618176*x - 353935872)*y^4 + (-58029244416*x^4 - 5520812802048*x^3 - 194129399513088*x^2 - 2977707298258944*x - 16704830741151744)*y^3 + (26734831387803648*x^6 + 
    4273688630003761152*x^5 + 284383394292628979712*x^4 + 10083152147947337023488*x^3 + 200912480536974738849792*x^2 + 2133120483665337737281536*x + 9427882225023772495183872)*y^2 + 
    (3131804025298373050368*x^8 + 634741948374903202775040*x^7 + 56186483585715668999208960*x^6 + 2836741992549476668450799616*x^5 + 89332276997009061108057636864*x^4 + 1796457321598851402262558801920*x^3 
    + 22524390330155925790676182106112*x^2 + 160950465351227242219705567543296*x + 501679956920746268229595325005824)*y + 76138502665750442120577024*x^10 + 18437944418772383930165231616*x^9 + 
    1998804635088196666101155758080*x^8 + 127636125909151737330174158438400*x^7 + 5311267370542739228822354314395648*x^6 + 150299566240850137118044640426065920*x^5 + 
    2924235564391909177179797437047373824*x^4 + 38537044744211435443287786624846397440*x^3 + 328173327359398605806866791661484113920*x^2 + 1623190096489340193459428916260694392832*x + 
    3516044255959759675411605028645996855296
*/

load "coleman.m";
Q:=y^5 + (-462336*x^2 - 25618176*x - 353935872)*y^4 + (-58029244416*x^4 - 5520812802048*x^3 - 194129399513088*x^2 - 2977707298258944*x - 16704830741151744)*y^3 + (26734831387803648*x^6 + 
    4273688630003761152*x^5 + 284383394292628979712*x^4 + 10083152147947337023488*x^3 + 200912480536974738849792*x^2 + 2133120483665337737281536*x + 9427882225023772495183872)*y^2 + 
    (3131804025298373050368*x^8 + 634741948374903202775040*x^7 + 56186483585715668999208960*x^6 + 2836741992549476668450799616*x^5 + 89332276997009061108057636864*x^4 + 1796457321598851402262558801920*x^3 
    + 22524390330155925790676182106112*x^2 + 160950465351227242219705567543296*x + 501679956920746268229595325005824)*y + 76138502665750442120577024*x^10 + 18437944418772383930165231616*x^9 + 
    1998804635088196666101155758080*x^8 + 127636125909151737330174158438400*x^7 + 5311267370542739228822354314395648*x^6 + 150299566240850137118044640426065920*x^5 + 
    2924235564391909177179797437047373824*x^4 + 38537044744211435443287786624846397440*x^3 + 328173327359398605806866791661484113920*x^2 + 1623190096489340193459428916260694392832*x + 
    3516044255959759675411605028645996855296;
p:=11;
N:=15;

data:=coleman_data(Q,p,N);

// Point search:
Qpoints:=Q_points(data,1000);
// The search misses some points (our plane model has large coefficients), which we put in by hand:
Qpoints[4]:=set_point(-136/5,-5413632/25,data);
Qpoints[5]:=set_point(-201/7,-8425728/7,data); 

L,v:=effective_chabauty(data:Qpoints:=Qpoints,bound:=1000,e:=100);

L;
/*
[
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := 3897407 + O(11^7),
        b := [ 1 + O(11^15), -6452440 + O(11^7), 538641*11 + O(11^7), -2047391 +
            O(11^7), -2686489 + O(11^7) ],
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := 8351616 + O(11^7),
        b := [ 1 + O(11^15), -3987557 + O(11^7), -5308799 + O(11^7), -86069 + 
            O(11^7), 96414 + O(11^7) ],
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := 693614 + O(11^7),
        b := [ 1 + O(11^15), 1083177 + O(11^7), -2709913 + O(11^7), 6091373 + 
            O(11^7), -7984883 + O(11^7) ],
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := 8695826 + O(11^7),
        b := [ 1 + O(11^15), 1057538 + O(11^7), 2413657 + O(11^7), 8502671 + 
            O(11^7), 2496184 + O(11^7) ],
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := -7307715 + O(11^7),
        b := [ 1 + O(11^15), 606744 + O(11^7), 9204762 + O(11^7), -776054 + 
            O(11^7), -5401776 + O(11^7) ],
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := -7307715 + O(11^7),
        b := [ 1 + O(11^15), O(11^7), -7956797 + O(11^7), 437746 + O(11^7), 
            342086 + O(11^7) ],
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := -1566468063530895 + O(11^15),
        b := [ 1 + O(11^15), O(11^15), -596550 + O(11^6), 2150 + O(11^6), 
            -434420 + O(11^6) ],
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := 888806 + O(11^7),
        b := [ 1 + O(11^15), -1000468 + O(11^7), 7298435 + O(11^7), -7620451 + 
            O(11^7), -3307786 + O(11^7) ],
        inf := false>
]
*/

Qpoints;
/*
[
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := -1566468063530895 + O(11^15),
        b := [ 1 + O(11^15), 606744 + O(11^15), 220175262720 + O(11^15), 
            -310823379250388 + O(11^15), -317151297017572 + O(11^15) ],
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := -1566468063530895 + O(11^15),
        b := [ 1 + O(11^15), 0, -34948454400 + O(11^15), 2013866571550604 + 
            O(11^15), -1270663693429683 + O(11^15) ],
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := -1566468063530895 + O(11^15),
        b := [ 1 + O(11^15), 0, -257220624384 + O(11^15), -1877390663370096 + 
            O(11^15), 340818463903998 + O(11^15) ],
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := 835449633883103 + O(11^15),
        b := (1 + O(11^15) 1169629487219837 + O(11^15) 118469716214667*11 + 
            O(11^15) -1643616579542140 + O(11^15) 1680883938064515 + O(11^15)),
        inf := false>,
    rec<recformat<x, b, inf, xt, bt, index> | 
        x := -1193499476975929 + O(11^15),
        b := (1 + O(11^15) 1790249214260175 + O(11^15) -597517240458821 + 
            O(11^15) 1996629934431237 + O(11^15) -603631276493345 + O(11^15)),
        inf := false>
]
*/

v;
/*
[
    [ 1 + O(11^8), O(11^8), O(11^8), O(11^8) ],
    [ O(11^8), 1 + O(11^8), O(11^8), O(11^8) ],
    [ O(11^8), O(11^8), 1 + O(11^8), O(11^8) ],
    [ O(11^8), O(11^8), O(11^8), 1 + O(11^8) ]
]
*/

// Conclusion: all Coleman integrals between (known) rational points vanish (perhaps rank 0?), 8 candidate points while there seem to be only 5 points (so 3 to rule out). 
