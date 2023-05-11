%% Presion_Temperatura_04

function  [MATRIZ] = Presion_Temperatura_04(Presion,Temp,DATOS, AD)

% Buscamos las presiones superior e inferior
Pos1 = max( find( DATOS<=Presion ) );
Pos2 = min( find( DATOS>=Presion ) );

% Hallamos las Presiones
P1 = DATOS(Pos1);
P2 = DATOS(Pos2);

% Guardamos la tabla de la presion inferior
LC = Pos1;
Table_LC;
Table_P1 = (Table);
VT1 = Table_P1(:,1);

% Buscamos los vectores superior e inferior
T1 = max(VT1( find( VT1<=Temp ) ) );
T2 = min(VT1( find( VT1>=Temp ) ) );
PosT1 = find( VT1==T1 );
PosT2 = find( VT1==T2 );

D1 = Table_P1(PosT1,:);
D2 = Table_P1(PosT2,:);

% Guardamos la tabla de la presion superior
LC = Pos2;
Table_LC;
Table_P2 = (Table);
VT2 = Table_P2(:,1);

% Buscamos los vectores superior e inferior
T3 = max(VT2( find( VT2<=Temp ) ) );
T4 = min(VT2( find( VT2>=Temp ) ) );
PosT3 = find( VT2==T3 );
PosT4 = find( VT2==T4 );

D3 = Table_P2(PosT3,:);
D4 = Table_P2(PosT4,:);

% T1,P1
MATRIZ(1,:) = D1;
% T2,P2
MATRIZ(2,:) = D2;
% T1,P2
MATRIZ(3,:) = D3;
% T2,P2
MATRIZ(4,:) = D4;





end
