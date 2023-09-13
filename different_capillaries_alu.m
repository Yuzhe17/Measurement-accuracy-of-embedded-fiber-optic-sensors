f = figure;
f.Units = 'inches';
f.OuterPosition=[0.25 0.25 1.77 1.33];
%% ploting analytical results
E1=70;E2=0;F=8;%elastic modulus and force
%E2=1.9041;
b=12;h=20%b is width and h is height of the specimen


r=1
Znc=E1*h^2*b/[4*(E1*b*h+pi*r^2*(E2-E1))];
EIzz=E2*(pi*r^4/4+pi*r^2*Znc^2)+E1*[b*(h/2)^3/12-pi*r^4/4+Znc^2*(b*h/2-pi*r^2)]+E1*[b*(h/2)^3/12+(h/2-Znc)^2*b*h/2];
x1=0:1:15;
y1=0+0*x1;
x2=15:1:35;
y2=(x2-15)*F*Znc*10^6/(2*EIzz);

x3=35:1:75;
y3=20*F*Znc*10^6/(2*EIzz)+0*x3;

x4=75:1:95;
y4=(95-x4)*F*Znc*10^6/(2*EIzz);

x5=95:1:110;
y5=0+0*x5;
x=[x1 x2 x3 x4 x5];
y=[y1*(-1) y2*(-1) y3*(-1) y4*(-1) y5*(-1)];

plot(x,y,'--r','LineWidth',2);
hold on;

r=2
Znc=E1*h^2*b/[4*(E1*b*h+pi*r^2*(E2-E1))];
EIzz=E2*(pi*r^4/4+pi*r^2*Znc^2)+E1*[b*(h/2)^3/12-pi*r^4/4+Znc^2*(b*h/2-pi*r^2)]+E1*[b*(h/2)^3/12+(h/2-Znc)^2*b*h/2];
x1=0:1:15;
y1=0+0*x1;
x2=15:1:35;
y2=(x2-15)*F*Znc*10^6/(2*EIzz);

x3=35:1:75;
y3=20*F*Znc*10^6/(2*EIzz)+0*x3;

x4=75:1:95;
y4=(95-x4)*F*Znc*10^6/(2*EIzz);

x5=95:1:110;
y5=0+0*x5;
x=[x1 x2 x3 x4 x5];
y=[y1*(-1) y2*(-1) y3*(-1) y4*(-1) y5*(-1)];
plot(x,y,'--r','LineWidth',2);
hold on;

r=3
Znc=E1*h^2*b/[4*(E1*b*h+pi*r^2*(E2-E1))];
EIzz=E2*(pi*r^4/4+pi*r^2*Znc^2)+E1*[b*(h/2)^3/12-pi*r^4/4+Znc^2*(b*h/2-pi*r^2)]+E1*[b*(h/2)^3/12+(h/2-Znc)^2*b*h/2];
x1=0:1:15;
y1=0+0*x1;
x2=15:1:35;
y2=(x2-15)*F*Znc*10^6/(2*EIzz);

x3=35:1:75;
y3=20*F*Znc*10^6/(2*EIzz)+0*x3;

x4=75:1:95;
y4=(95-x4)*F*Znc*10^6/(2*EIzz);

x5=95:1:110;
y5=0+0*x5;
x=[x1 x2 x3 x4 x5];
y=[y1*(-1) y2*(-1) y3*(-1) y4*(-1) y5*(-1)];
plot(x,y,'--r','LineWidth',2);
hold on;

xlabel('Position(mm)','FontName','Times New Roman','Fontsize',56)
set(gca,'FontName','Times New Roman','FontSize',56)
ylabel('Microstrain(\mu\epsilon)','FontName','Times New Roman','Fontsize',56)
set(gca,'FontName','Times New Roman','FontSize',56)
legend('2mm','4mm','6mm','FontName','Times New Roman','Fontsize',56)
ylim([-1200 0])

%legend('Analytical prediction','Strain measurement from the fibre','Numerical prediction','Updated strain at Position1','Updated strain at Position2','Updated strain at Position3','FontSize',14)
%legend('Strain measurement from the fibre','Numerical prediction','Updated strain at Position1','Updated strain at Position2','Updated strain at Position3','FontSize',16)
%legend('Analytical prediction','Numerical prediction','FontSize',26)
%legend('Analytical prediction along upper boundary','Strain measurement from the fibre','numerical prediction along upper boundary','Updated strain at Position1','Updated strain at Position2','Updated strain at Position3','FontSize',14);

%legend('Analytical prediction along capillary center','Analytical prediction along upper boundary','Analytical prediction along lower boundary','Strain measurement from the fibre','Updated strain at Position1','Updated strain at Position2','Updated strain at Position3','FontSize',14);

