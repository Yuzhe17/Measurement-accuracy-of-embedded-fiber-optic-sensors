%% ploting analytical results
E1=70;E2=0;F=8;%elastic modulus and force
%E2=1.9041;
b=12;h=20%b is width and h is height of the specimen
%{
Znc=E1*h^2*b/[4*(E1*b*h+pi*r^2*(E2-E1))];
EIzz=E2*(pi*r^4/4+pi*r^2*Znc^2)+E1*[b*(h/2)^3/12-pi*r^4/4+Znc^2*(b*h/2-pi*r^2)]+E1*[b*(h/2)^3/12+(h/2-Znc)^2*b*h/2];
STRAIN=F*L*Znc*10^6/(2*EIzz)
%}

r=1;%radius is 1mm
Znc=E1*h^2*b/[4*(E1*b*h+pi*r^2*(E2-E1))];
EIzz=E2*(pi*r^4/4+pi*r^2*Znc^2)+E1*[b*(h/2)^3/12-pi*r^4/4+Znc^2*(b*h/2-pi*r^2)]+E1*[b*(h/2)^3/12+(h/2-Znc)^2*b*h/2];
x1=0:1:15;
y1=0+0*x1;
x2=15:1:35;
y2=(x2-15)*F*Znc*10^6/(2*EIzz);
y_2=(x2-15)*F*(Znc-r)*10^6/(2*EIzz);% the case that fibre is attached on upper edge
y_2_=(x2-15)*F*(Znc+r)*10^6/(2*EIzz);% the case that fibre is attached on lower edge
x3=35:1:75;
y3=20*F*Znc*10^6/(2*EIzz)+0*x3;
y_3=20*F*(Znc-r)*10^6/(2*EIzz)+0*x3;% the case that fibre is attached on upper edge
y_3_=20*F*(Znc+r)*10^6/(2*EIzz)+0*x3;% the case that fibre is attached on lower edge
x4=75:1:95;
y4=(95-x4)*F*Znc*10^6/(2*EIzz);
y_4=(95-x4)*F*(Znc-r)*10^6/(2*EIzz);% the case that fibre is attached on upper edge
y_4_=(95-x4)*F*(Znc+r)*10^6/(2*EIzz);% the case that fibre is attached on lower edge
x5=95:1:110;
y5=0+0*x5;
x=[x1 x2 x3 x4 x5];
y=[y1*(-1) y2*(-1) y3*(-1) y4*(-1) y5*(-1)];
y_up=[y1*(-1) y_2*(-1) y_3*(-1) y_4*(-1) y5*(-1)];
y_low=[y1*(-1) y_2_*(-1) y_3_*(-1) y_4_*(-1) y5*(-1)];
plot(x,y,'--r','LineWidth',1);
hold on
plot(x,y_up,'-g','LineWidth',1);
hold on
plot(x,y_low,'-ob','LineWidth',1);

p=patch([x fliplr(x)], [y_up fliplr(y_low)], 'k')

alpha(p,0.1)

xlabel('Position(mm)','FontName','Times New Roman','Fontsize',56)
set(gca,'FontName','Times New Roman','FontSize',56)
ylabel('Microstrain(\mu\epsilon)','FontName','Times New Roman','Fontsize',56)
set(gca,'FontName','Times New Roman','FontSize',56)

ylim([-1200 0])

%legend('2mm','4mm','6mm','Fontsize',16)
%legend('Capillary center','Capillary upper boundary','Capillary lower boundary','FontSize',40)
