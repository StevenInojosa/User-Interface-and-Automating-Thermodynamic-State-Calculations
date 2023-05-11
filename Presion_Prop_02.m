%% Presión y volumen especifico en VSC
% Presion_Volumen_02

% 
function  [MATRIZ] = Presion_Prop_02(PoT,Opcion,v,DATOS,AD,Prop)
% Opcion = 1 <-- T-v
% Opcion = 3 <-- P-v
% Definimos E como tolerancia a la desviación para la presion
% Tambien cambiar en Sustancia_Menu
E = 0.09;


% Para ello ubicamos la posición de las Presiones inferiores y 
% superiores a la temperatura dada

Pos1 = max( find( DATOS<=PoT ) );
Pos2 = min( find( DATOS>=PoT ) );

% Hallamos las Presiones/temperaturas
P1 = DATOS(Pos1);
P2 = DATOS(Pos2);

%% Guardamos la tabla del VOLUMEN inferior
VSC = Pos1;
Table_VSC;
Table_P1 = (Table);
VT1 = Table_P1(:,Prop);
% Buscamos los vectores superior e inferior
v1 = max(VT1( find( VT1<= v & v<10^10) ) );
v2 = min(VT1( find( VT1>= v & v<10^10) ) );
PosT1 = find( VT1==v1 );
PosT2 = find( VT1==v2 );

D1 = Table_P1(PosT1,:);
D2 = Table_P1(PosT2,:);

% Guardamos la tabla del VOLUMEN superior
VSC = Pos2;
Table_VSC;
Table_P2 = (Table);
VT2 = Table_P2(:,Prop);

% Buscamos los vectores superior e inferior
v3 = max(VT2( find( VT2<= v & v<10^10) ) );
v4 = min(VT2( find( VT2>= v & v<10^10) ) );
PosT3 = find( VT2==v3 );
PosT4 = find( VT2==v4 );

D3 = Table_P2(PosT3,:);
D4 = Table_P2(PosT4,:);

% Generamos la matriz

MATRIZ = zeros(4,6);

% v1,P1
MATRIZ(1,1:5) = D1;
% v2,P2
MATRIZ(2,1:5) = D2;
% v1,P2
MATRIZ(3,1:5) = D3;
% v2,P2
MATRIZ(4,1:5) = D4;

% Guardamos las Presiones
MATRIZ(1,6) = P1;
MATRIZ(2,6) = P1;
MATRIZ(3,6) = P2;
MATRIZ(4,6) = P2;




end