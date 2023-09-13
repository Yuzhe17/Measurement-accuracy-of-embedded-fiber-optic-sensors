%ploting analytical results
E1=1.3;F=0.15;%elastic modulus and force
E2=1.8;
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
y_3_=20*F*(Znc+1)*10^6/(2*EIzz)+0*x3;% the case that fibre is attached on lower edge
x4=75:1:95;
y4=(95-x4)*F*Znc*10^6/(2*EIzz);
y_4=(95-x4)*F*(Znc-r)*10^6/(2*EIzz);% the case that fibre is attached on upper edge
y_4_=(95-x4)*F*(Znc+r)*10^6/(2*EIzz);% the case that fibre is attached on lower edge
x5=95:1:110;
y5=0+0*x5;
x=[x1 x2 x3 x4 x5];
y=[y1 y2 y3 y4 y5];
y_up=[y1 y_2 y_3 y_4 y5];
y_low=[y1 y_2_ y_3_ y_4_ y5];
plot(x,y,'--r','LineWidth',3);
hold on
plot(x,y_up,'-c','LineWidth',3);
hold on
plot(x,y_low,'-ob','LineWidth',3);


xlabel('Positions(mm)','FontName','SansSerif','Fontsize',50)
set(gca,'FontName','SansSerif','FontSize',50)
ylabel('Microstrain(\mu\epsilon)','FontName','SansSerif','Fontsize',50)
set(gca,'FontName','SansSerif','FontSize',50)
legend('Capillary center','Capillary upper boundary','Capillary lower boundary','FontSize',24)

%{
%% plotting strain measurement
hold on
sample1=importdata('30.txt');
sample1_1=sample1.data(2,920:1089);
x_axis=[0:0.6531:169*0.6531];
plot(x_axis,sample1_1);
%% plotting simulation results
simulation=xlsread('simulation_0.xlsx','xyToExcel','A1:B65');
simulation=[simulation(:,1),10^6.*simulation(:,2)];
X=simulation(:,1);
Y=simulation(:,2);
hold on
plot(X,Y)
%% updating the numerical and analytical model with the real fibre positions
Znc=E1*h^2*b/[4*(E1*b*h+pi*r^2*(E2-E1))]-0.3;
EIzz=E2*(pi*r^4/4+pi*r^2*Znc^2)+E1*[b*(h/2)^3/12-pi*r^4/4+Znc^2*(b*h/2-pi*r^2)]+E1*[b*(h/2)^3/12+(h/2-Znc)^2*b*h/2];
y_cs1=20*F*Znc*10^6/(2*EIzz);
x_cs1=40;
hold on;
scatter(x_cs1,y_cs1)

Znc=E1*h^2*b/[4*(E1*b*h+pi*r^2*(E2-E1))]-0.3;
EIzz=E2*(pi*r^4/4+pi*r^2*Znc^2)+E1*[b*(h/2)^3/12-pi*r^4/4+Znc^2*(b*h/2-pi*r^2)]+E1*[b*(h/2)^3/12+(h/2-Znc)^2*b*h/2];
y_cs2=20*F*Znc*10^6/(2*EIzz);
x_cs2=60;
hold on;
scatter(x_cs2,y_cs2)
%}
