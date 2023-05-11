% Prop_Calidad_01

% Vemos cuantas columnas tiene
Ncolum = length(Saturated(:,1));
Vector = zeros(Ncolum,1);

%% Revisar
for i = 1:Ncolum
   
    % Guardamos las columna local con las propiedades
    D = Saturated(i,:);
    
    Prop_f = Saturated( i,PropInf );
    Prop_g = Saturated( i,PropSup );
    
    Prop_X = x*Prop_g + (1-x)*Prop_f;
    
    Vector(i) = Prop_X ;
    
    

end

% Buscamos los vectores superior e inferior
Pos1 = min( find( Vector<= Prop ) ) ;
Pos2 = max( find( Vector>= Prop ) ) ;

D1 = Saturated (Pos1,:) ;
D2 = Saturated (Pos2,:) ;

Prop_D1 = Vector(Pos1);
Prop_D2 = Vector(Pos2);

% Usamos como parametro error relativo
if     abs ( (Prop_D1-Prop)/Prop_D1 ) < 1/100
    MATRIZ = D1;
    Resultados_Int
elseif abs ( (Prop_D2-Prop)/Prop_D2 ) < 1/100
    MATRIZ = D2;
    Resultados_Int
    
else 
    MATRIZ = zeros(3,14);
    
    %Interpolando 
    I = D1 + (D2-D1)/(Prop_D2-Prop_D1)*(Prop-Prop_D1);
    
    MATRIZ(3,:) = D1;
    MATRIZ(2,:) = I;
    MATRIZ(1,:) = D2;
    
    Resultados_Int
 
end




