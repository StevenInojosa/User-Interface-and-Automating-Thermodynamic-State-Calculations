%% Presión y volumen especifico en VSC
% Temperatura_Prop_03

% Definimos el vector de temperaturas
VT = MATRIZ(:,Opcion) ;

% Buscamos las lineas de la tabla con la temperatura dada 
MT = find( VT == PoT );

% Generamos la matriz con la temperatura dato
M = MATRIZ(MT,:);

% Generamos el vector de Propiedades (v/u/h/s)
VProp = M(:,Prop);

% Buscamos las propiedades (v/u/h/s) superior e inferior
Prop1 = max(VProp( find( VProp<= v ) ) );
Prop2 = min(VProp( find( VProp>= v ) ) );

% Buscamos las posiciones en la MATRIZ
PosProp1 = min( find( MATRIZ(:,Prop)==Prop1 ) );
PosProp2 = min( find( MATRIZ(:,Prop)==Prop2 ) );

D1 = MATRIZ(PosProp1,:);
D2 = MATRIZ(PosProp2,:);

% Interpolamos el volumen
I = D1 + (D2-D1)/(Prop2-Prop1)*(v-Prop1);

% Guardaremos MATRIZ con otro nombre para poder usarla en el script de
% Resultados
Tablas = MATRIZ;

% Vemos si Prop1 es producto de una interpolación 
if mod( (PosProp1+2),3 ) == 0
    MATRIZ = Tablas(PosProp1,:) ;  
        
elseif mod( (PosProp1+1),3 ) == 0
    MATRIZ = Tablas(PosProp1-1:PosProp1+1,:) ;
        
elseif mod( (PosProp1),3 ) == 0
    MATRIZ = Tablas(PosProp1,:) ;
        
else
    MATRIZ = Tablas(PosProp1,:) ;
        
end

Resultados;
 
% Vemos si Prop2 es producto de una interpolación 
if mod( (PosProp2+2),3 ) == 0
    MATRIZ = Tablas(PosProp2,:) ;  
        
elseif mod( (PosProp2+1),3 ) == 0
    MATRIZ = Tablas(PosProp2-1:PosProp2+1,:) ;
        
elseif mod( (PosProp2),3 ) == 0
    MATRIZ = Tablas(PosProp2,:) ;
        
else
    MATRIZ = Tablas(PosProp2,:) ;
        
end


if D1~=D2
    Resultados
% Finalmente mostramos la interpolación a la propiedad dato (v/u/h/s)
MATRIZ = zeros(3,6);

MATRIZ(1,:) = D1;
MATRIZ(2,:) = I;
MATRIZ(3,:) = D2;
Resultados
end





