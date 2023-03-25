clear all
close all
L(1) = Link([pi/3  0 51.45 0],'standard');
L(2) = Link([pi/3  0 28.04 0],'standard');
L(3) = Link([pi/3  0 18.87 0],'standard');
KR = SerialLink(L);
qf = [pi/3 pi/3 pi/3];
Tf = KR.fkine(qf);
  %-1.0000    0.0000         0    -7.165
  % -0.0000   -1.0000         0     68.84
  %      0         0         1         0
  %     0         0         0         1

q0 = [0 0 0];
q =  KR.ikine(Tf ,q0,'mask',[1 1 1 0 0 0]);
      % KR.plot(q); 
      % KR.teach
      % KR.plot([1.0472  1.0472    1.0472])
      % KR.teach
t = 0:0.15:3;
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
