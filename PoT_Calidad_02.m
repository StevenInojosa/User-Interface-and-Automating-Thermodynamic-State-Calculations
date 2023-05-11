% PoT_Calidad_02

% Ubicamos los datos de la tabla interpolada    
vf = double(MATRIZ(3));
vg = double(MATRIZ(5));
        
    
% Energia interna
uf = double(MATRIZ(6));
ug = double(MATRIZ(8));
    
% Entalpia
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

disp(' ')
disp(' Finalmente usando usando las siguientes ecuaciones calcularemos las propiedades restantes ')
disp('      v = x*vg + (1-x)*vf')
disp('      u = x*ug + (1-x)*uf')
disp('      h = x*hg + (1-x)*hf')
disp('      s = x*sg + (1-x)*sf')
Resultados
