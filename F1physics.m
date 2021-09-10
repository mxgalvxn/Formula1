%Equipo 3
%Monse Galván
%Jorge Cruz
%Carlos Solano
%Diego Rosas
%Avir Gariel


clear;
clc;
set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
hold on; 
grid on;
set(0,'DefaultLegendAutoUpdate','off');
axis([500 1100 200 800]);
delete(findall(gcf,'type','text'));

title(('Pista Formula 1'));
xlabel('Eje X [m]');
ylabel('Eje Y [m]');


%Punto A
px1=593.90356;
py1=547.57066;

%Punto B
px2=716.05394;
py2=349.60281;

%Punto C
px3=905.59763;
py3=547.57066;

%Punto D
px4=1010.8997;
py4=463.32902;

curvasx=[px1,px2,px3,px4];
curvasy=[py1,py2,py3,py4];

pista=polyfit(curvasx,curvasy, 3);

N=100;
paso=(px4-px1)/(N-1);
x=zeros(1,N);
y=zeros(1,N);

xt=zeros(1,N);
yt=zeros(1,N);

xt1=zeros(1,N);
yt1=zeros(1,N);


xt2=zeros(1,N);
yt2=zeros(1,N);

velocidad = zeros(1,N);
velocidad1 = zeros(1,N);
velocidad2 = zeros(1,N);
velocidad3 = zeros(1,N);

x(1)=px1;
x(N)=px4;
y(1)=py1;
y(N)=py4;


xt(1)=px1;
xt(N)=px4;
yt(1)=py1;
yt(N)=py4;

xt1(1)=px1;
xt1(N)=px4;
yt1(1)=py1;
yt1(N)=py4;

xt2(1)=px1;
xt2(N)=px4;
yt2(1)=py1;
yt2(N)=py4;

g=9.8;
f=1.1;
for i=2:1:N
    x(i)=x(i-1)+paso;
    y(i)=(pista(1)*x(i)^3+pista(2)*x(i)^2+pista(3)*x(i)+pista(4));
    derivada=-0.000107*x(i).^2+.1744345*x(i)-70.042489;
    derivada2=-0.000214*x(i)+.1744345;
    radiocurvatura=((1+derivada.^2).^(3/2))/derivada2;
    velocidad(i)=3.6*sqrt(abs(radiocurvatura*g*f));
end
for i=2:1:N
    xt(i)=xt(i-1)+paso;
   
    if xt(i)<640
       yt(i)=(pista(1)*xt(i)^3+pista(2)*xt(i)^2+pista(3)*xt(i)+pista(4));
       derivada=-0.000107*xt(i).^2+.1744345*xt(i)-70.042489;
       derivada2=-0.000214*xt(i)+.1744345;
       radiocurvatura=((1+derivada.^2).^(3/2))/derivada2;
       velocidad1(i)=3.6*sqrt(abs(radiocurvatura*g*f)+20);
    elseif xt(i)>640 && xt(i)<700
    yt(i)=(-9/5)*xt(i)+1561;
       derivada=-0.000107*xt(i).^2+.1744345*xt(i)-70.042489;
       derivada2=-0.000214*xt(i)+.1744345;
       radiocurvatura=((1+derivada.^2).^(3/2))/derivada2;
       velocidad1(i)=3.6*sqrt(abs(radiocurvatura*g*f)+20)
    else
        yt(i)=300;
        xt(i)=700;
        velocidad1(i)=0;
    end
   
    
end

for i=2:1:N
    xt1(i)=xt1(i-1)+paso;
    if xt1(i)<871
         yt1(i)=(pista(1)*xt1(i)^3+pista(2)*xt1(i)^2+pista(3)*xt1(i)+pista(4));
         derivada=-0.000107*xt1(i).^2+.1744345*xt1(i)-70.042489;
       derivada2=-0.000214*xt1(i)+.1744345;
       radiocurvatura=((1+derivada.^2).^(3/2))/derivada2;
       velocidad2(i)=3.6*sqrt(abs(radiocurvatura*g*f)+50)
    elseif xt1(i)>871 && xt1(i)<950
    yt1(i)=(13/11)*xt1(i)-(5625/11);
         derivada=-0.000107*xt1(i).^2+.1744345*xt1(i)-70.042489;
       derivada2=-0.000214*xt1(i)+.1744345;
       radiocurvatura=((1+derivada.^2).^(3/2))/derivada2;
       velocidad2(i)=3.6*sqrt(abs(radiocurvatura*g*f)+50)
    else
        yt1(i)=611;
        xt1(i)=950;
        velocidad2(i)=0;
    end    
end
for i=2:1:N
    xt2(i)=xt2(i-1)+paso;
    if xt2(i)<951
         yt2(i)=(pista(1)*xt2(i)^3+pista(2)*xt2(i)^2+pista(3)*xt2(i)+pista(4));
          derivada=-0.000107*xt2(i).^2+.1744345*xt2(i)-70.042489;
       derivada2=-0.000214*xt2(i)+.1744345;
       radiocurvatura=((1+derivada.^2).^(3/2))/derivada2;
       velocidad3(i)=3.6*sqrt(abs(radiocurvatura*g*f)+60); 
    elseif xt2(i)>951 && xt2(i)<1000
    yt2(i)=(-2/7)*xt2(i)+(5757/7);
       derivada=-0.000107*xt2(i).^2+.1744345*xt2(i)-70.042489;
       derivada2=-0.000214*xt2(i)+.1744345;
       radiocurvatura=((1+derivada.^2).^(3/2))/derivada2;
       velocidad3(i)=3.6*sqrt(abs(radiocurvatura*g*f)+60)
    else
        yt2(i)=536;
        xt2(i)=1000;
        velocidad3(i)=0;
    end    
end


plot(x+2,y+10,'color','b')
hold on
plot(x,y)
hold on
plot(x-2,y-10,'color','b')
%gradas
%grada 1
xg1=[653.9331 696.0539 720.1748 683.6298];
yg1=[463.329 387.5115 387.5115 484.3894];
%grada 2
xg2=[813.8714 836.5077 908.1131 874.4164];
yg2=[556.329 512.6324 592.6619 626.3586];
%grada 1
patch( xg1,yg1,'red')
hold on
%grada 2
patch(xg2,yg2, 'blue')
hold on

text(835,450,['Curva peligrosa ']);
text(1010,540,['Curva peligrosa ']);
text(625,350,['Curva peligrosa ']);
hold on
%comet(x,y)
hold on
drawan2(x,y,0.000001,4,970,750,velocidad)
hold on
%comet(xt,yt)
hold on
drawan2(xt,yt,0.000001,4,970,700,velocidad1)
hold on
%comet(xt1,yt1)
hold on
drawan2(xt1,yt1,0.000001,4,970,650,velocidad2)
hold on
%comet(xt2,yt2)
drawan2(xt2,yt2,0.000001,4,970,600,velocidad3)



