clear all
close all
L(1) = Link([pi/3  0 41.65 0],'standard');
L(2) = Link([pi/3  0 22.29 0],'standard');
L(3) = Link([pi/3  0 15.51 0],'standard');
KR = SerialLink(L);
qf = [pi/3 pi/3 pi/3];
Tf = KR.fkine(qf);
 
q0 = [0 0 0];
q =  KR.ikine(Tf ,q0,'mask',[1 1 1 0 0 0]);
      
t = 0:0.12:5;
Q =jtraj(q0,qf,t);
Tr = fkine(KR,Q);
for i = 1:1:length(t)
    T = Tr(i);
    trs = transl(T);
    xx(i) = trs(1);
    yy(i) = trs(2);
    zz(i) = trs(3);
end
plot(KR,Q);
hold on
plot3(xx,yy,zz,'Color',[1 0 0],'LineWidth',2)
