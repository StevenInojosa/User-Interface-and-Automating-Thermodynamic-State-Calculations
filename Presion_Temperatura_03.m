%% Presion_Temperatura_03

% Buscamos las presiones superior e inferior
Pos1 = max( find( DATOS<=Presion ) );
Pos2 = min( find( DATOS>=Presion ) );

% Hallamos las Presiones
P1 = DATOS(Pos1);
P2 = DATOS(Pos2);

% Guardamos las presiones en la 6ta casilla
MATRIZ(1,6) = P1;
MATRIZ(2,6) = P1;
MATRIZ(3,6) = P2;
MATRIZ(4,6) = P2;

% Hallamos las Temperaturas
T1 = MATRIZ(1,1);
T2 = MATRIZ(2,1);
T3 = MATRIZ(3,1);
T4 = MATRIZ(4,1);

D1 = MATRIZ(1,:);
D2 = MATRIZ(2,:);
D3 = MATRIZ(3,:);
D4 = MATRIZ(4,:);

% Interpolando temperatura
V1 = D1 + (D2-D1)/(T2-T1)*(Temp-T1);
V2 = D3 + (D4-D3)/(T4-T3)*(Temp-T3);

%Interpolando presión
I = V1 + (V2-V1)/(P2-P1)*(Presion-P1);

B1 = D1 + (D3-D1)/(P2-P1)*(Presion-P1);
if P1 == P2
    P = P1;
    if T1 == T2
        MATRIZ = MATRIZ(1,:);
        % Mostramos los resultados en Tabla
        disp(' Podeemos leer directamente de Tabla ');
        % Mostramos en pantalla el titulo de nuestra tabla
        fprintf('A una Presión de %d kPA ', P);
        Resultados
    else
        MATRIZ(1,:) = D1;
        MATRIZ(2,:) = V1;
        MATRIZ(3,:) = D2;
        % Redefinimos la matriz para mostrarla en tabla
        MATRIZ = MATRIZ(1:3,:);
        % Mostramos los resultados en Tabla
        disp(' Podemos Interpolar en temperatura ');
        % Mostramos en pantalla el titulo de nuestra tabla
        fprintf('A una Presión de %d kPA ', P);
        Resultados
    end
else
        if T1 == T2 & T3 == T4
        
        MATRIZ(1,:) = D1;
        MATRIZ(2,:) = B1;
        MATRIZ(3,:) = D3;
        % Redefinimos la matriz para mostrarla en tabla
        MATRIZ = MATRIZ(1:3,:);
        % Mostramos los resultados en Tabla
        disp(' Podemos Interpolar Presiones ');
        Resultados
        
        else
        MATRIZ(1,:) = D1;
        MATRIZ(2,:) = V1;
        MATRIZ(3,:) = D2;
        % Redefinimos la matriz para mostrarla en tabla
        MATRIZ = MATRIZ(1:3,:);
        % Mostramos los resultados en Tabla
        disp(' Podemos Interpolar Temperatura ');
        Resultados
        
        MATRIZ(1,:) = D3;
        MATRIZ(2,:) = V2;
        MATRIZ(3,:) = D4;
        % Redefinimos la matriz para mostrarla en tabla
        MATRIZ = MATRIZ(1:3,:);
        % Mostramos los resultados en Tabla
        disp(' Podemos Interpolar Temperatura');
        Resultados
        
        MATRIZ(1,:) = V1;
        MATRIZ(2,:) = I ;
        MATRIZ(3,:) = V2;
        % Redefinimos la matriz para mostrarla en tabla
        MATRIZ = MATRIZ(1:3,:);
        % Mostramos los resultados en Tabla
        disp(' Finalmente Interpolamos Presión ');
        Resultados
    
    
    end
    
end