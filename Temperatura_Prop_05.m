% Temperatura_Prop_05

% De acuerdo a cual propiedad tenemos que calcular nombramos Propf y Propg
switch Prop
    case 2
        % Volumen especifico
        Propf = 3;
        Propg = 5;
        
    case 3
        % Energia interna
        Propf = 6;
        Propg = 8;
        
    case 4
        % Entalpia
        Propf = 9;
        Propg = 11;
        
    case 5
        % Entropia
        Propf = 12;
        Propg = 14;
        
end

    



MATRIZ = vpa(MATRIZ,6);


D1 = MATRIZ(1,:);
V  = MATRIZ(2,:);
D2 = MATRIZ(3,:);

if D1 == D2
    disp(' Podemos leer directamente de tabla en MLV ')
    MATRIZ = D1;
    Resultados_Sat
else
    % Presentamos la interpolación y luego guardamos el vector interpolado
    disp(' Interpolando en MLV ')
    Resultados_Sat
    MATRIZ = V;
    
end

Propf = MATRIZ(Propf);
Propg = MATRIZ(Propg);
% X = (v-vf) / (vg-vf);
% Calculamos la calidad
x = (v-Propf)/(Propg-Propf);
disp('La calidad es de: ')
disp(vpa(x,3) )
vf = double(MATRIZ(3));
vg = double(MATRIZ(5));
        
    
% Energia interna
uf = double(MATRIZ(6));
ug = double(MATRIZ(8));
    
% % Entalpia
hf = double(MATRIZ(9 ));
hg = double(MATRIZ(11));
    
% Entropia
sf = double(MATRIZ(12));
sg = double(MATRIZ(14));

volumen  = x*vg + (1-x)*vf;
energiaI = x*ug + (1-x)*uf;
entalpia = x*hg + (1-x)*hf;
entropia = x*sg + (1-x)*sf;

% Guardamos la matriz con otro nombre
SAVE = MATRIZ;

MATRIZ = zeros(1,6);

MATRIZ(6) = SAVE(2)  ;
MATRIZ(1) = SAVE(1)  ;
MATRIZ(2) = volumen  ;
MATRIZ(3) = energiaI ;
MATRIZ(4) = entalpia ;
MATRIZ(5) = entropia ;

disp(' Finalmente usando x calculamos las propiedades restantes en el estado ')
Resultados



