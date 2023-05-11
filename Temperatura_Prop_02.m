%% Presión y volumen especifico en VSC
% Temperatura_Prop_02

% 
function  [MATRIZ] = Temperatura_Prop_02(PoT,Opcion,v,DATOS,AD,Prop,n)
% Opcion = 1 <-- T-v
% Opcion = 2 <-- P-v

% Numero de tablas de presiones 
nP = length(DATOS);

% Creamos una matriz de ceros donde guardaremos todos los datos
MATRIZ = zeros(3*nP,6);

% Contador para guardar la matriz
    K = 0;
    
for i = 1:n
   
    % VSC
    VSC = i ;
    Table_VSC ;
    
    Table_P1 = (Table);
    
    % Vector de temperaturas
    VT = Table_P1(:,Opcion);
 
   
    % Buscamos los vectores superior e inferior de temperatura
T1 = max(VT( find( VT<= PoT ) ) );
T2 = min(VT( find( VT>= PoT ) ) );

% Nos aseguramos que no ocurra "Empty matrix" con las temperaturas
if   length(T1) == 0   ||    length(T2) == 0
    continue 
end

% Buscamos las posiciones 
PosT1 = find( VT==T1 );
PosT2 = find( VT==T2 );

% Guardamos las lineas superiores e inferiores con todas las propiedades
D1 = Table_P1(PosT1,:);
D2 = Table_P1(PosT2,:);


Prop1 = D1(Prop);
Prop2 = D2(Prop);

% Vemos que no ocurra que v1>=v o v2<v
if   Prop1>=10^9  ||  Prop2>=10^9 
    continue 
end

Presion = DATOS(i);

% Interpolando Temperatura
I1 = D1 + (D2-D1)/(T2-T1)*(PoT-T1);


% T1,Prop1
MATRIZ(3*K+1,1:5) = D1;
% Interpolando a temperatura
MATRIZ(3*K+2,1:5) = I1;    
% T1,Prop2
MATRIZ(3*K+3,1:5) = D2;  

% Guardamos la presión como dato
MATRIZ(3*K+1,6) = Presion;
MATRIZ(3*K+2,6) = Presion;    
MATRIZ(3*K+3,6) = Presion;  

K = K+1; 

 
  
end
 
end