%% Presion_Volumen_03

% Primero tenemos aque interpolar volumen
% Luego se interpola presión


% Buscamos las presiones superior e inferior
Pos1 = max( find( DATOS<=PoT ) );
Pos2 = min( find( DATOS>=PoT ) );

% Hallamos las Presiones
P1 = DATOS(Pos1);
P2 = DATOS(Pos2);

% Hallamos la propiedad a interpolar primero (v,u,h,s)
T1 = MATRIZ(1,Prop);
T2 = MATRIZ(2,Prop);
T3 = MATRIZ(3,Prop);
T4 = MATRIZ(4,Prop);

% Guardamos 
D1 = MATRIZ(1,:);
D2 = MATRIZ(2,:);
D3 = MATRIZ(3,:);
D4 = MATRIZ(4,:);

% Interpolando (v,u,h,s)
V1 = D1 + (D2-D1)/(T2-T1)*(v-T1);
V2 = D3 + (D4-D3)/(T4-T3)*(v-T3);

%Interpolando Presion/Temperatura
I = V1 + (V2-V1)/(P2-P1)*(PoT-P1);

B1 = D1 + (D3-D1)/(P2-P1)*(PoT-P1);
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
        disp(' Podemos Interpolar volumen especifico ');
        Resultados
        
        MATRIZ(1,:) = D3;
        MATRIZ(2,:) = V2;
        MATRIZ(3,:) = D4;
        % Redefinimos la matriz para mostrarla en tabla
        MATRIZ = MATRIZ(1:3,:);
        % Mostramos los resultados en Tabla
        disp(' Podemos Interpolar volumen especifico');
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