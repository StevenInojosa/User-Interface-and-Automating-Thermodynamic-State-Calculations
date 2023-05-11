


function  [MATRIZ] = PoT_Calidad_01(PoT,Saturated,Opcion,x)

% Opcion = 1 <-- T-v
% Opcion = 2 <-- P-v
% Definimos E como tolerancia a la desviación para la presion
% Tambien cambiar en Sustancia_Menu
E = 0.09;

% Definimos el vector de Presion/Temperatura
P = Saturated(:,Opcion);

% Para ello ubicamos la posición de las Presiones/temperatura inferiores y 
% superiores a la temperatura dada

Pos1 = max( find( P<=PoT ) );
Pos2 = min( find( P>=PoT ) );

% Hallamos las Presiones/temperaturas
P1 = P(Pos1);
P2 = P(Pos2);

D1 = (Saturated(Pos1,:));
D2 = (Saturated(Pos2,:));
% Interpolamos a la presion/temperatura dada
V = D1 + (D2-D1)/(P2-P1)*(PoT-P1);

MATRIZ = zeros(3,14);

MATRIZ(1,:) = D1; 
MATRIZ(2,:) = V; 
MATRIZ(3,:) = D2;

if D1 == D2
    
    disp(' Podemos leer directamente de tabla en MLV ')
    MATRIZ = D1;
    Resultados_Sat
    PoT_Calidad_02
else
    
    % Presentamos la interpolación y luego guardamos el vector interpolado
    disp(' Interpolando en MLV ')
    Resultados_Sat
    MATRIZ = V;
    
    PoT_Calidad_02


end


end
