%% Presion_Temperatura_01

function  [MATRIZ] = Presion_Temperatura_01(Presion,Temp,Saturated)

% Definimos E como tolerancia a la desviación para la presion
% Tambien cambiar en Sustancia_Menu
E = 0.09;

% Definimos el vector de Temperaturas
T = Saturated(:,1);
% Definimos el vector de Presion
P = Saturated(:,2);

% Vemos si esta en saturación

% Para ello ubicamos la posición de las temperaturas inferiores y 
% superiores a la temperatura dada

Pos1 = max( find( T<=Temp ) );
Pos2 = min( find( T>=Temp ) );

% Hallamos las temperatura
T1 = T(Pos1);
T2 = T(Pos2);

D1 = (Saturated(Pos1,:));
D2 = (Saturated(Pos2,:));
% Interpolamos a la temperatura dada
V = D1 + (D2-D1)/(T2-T1)*(Temp-T1);

MATRIZ(1,:) = D1; 
MATRIZ(2,:) = V; 
MATRIZ(3,:) = D2;

MATRIZ = vpa(MATRIZ,6);


end

    
    
    
    

