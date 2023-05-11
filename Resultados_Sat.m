%% Resultados_Sat

% Guardamos todos los datos en una sola variable a la que llamaremos
% Resultados

% Guardamos los vectores como Double con sus decimales
T_Resultado =  double( MATRIZ(:,1) );
P_Resultado =  double( MATRIZ(:,2) );

vf_Resultado =  double( MATRIZ(:,3) );
vg_Resultado =  double( MATRIZ(:,5) );

uf_Resultado =  double( MATRIZ(:,6) );
ug_Resultado =  double( MATRIZ(:,8) );

hf_Resultado =  double( MATRIZ(:,9) );
hg_Resultado =  double( MATRIZ(:,11) );

sf_Resultado =  double( MATRIZ(:,12) );
sg_Resultado =  double( MATRIZ(:,14) );

Resultado1_Sat = { T_Resultado P_Resultado vf_Resultado vg_Resultado...
                  uf_Resultado ug_Resultado } ;
Resultado2_Sat = { T_Resultado P_Resultado hf_Resultado hg_Resultado... 
                  sf_Resultado sg_Resultado } ;

 % Creamos una variable que guarde una tabla con los datos que mostraremos
% posteriormente
t1=table(Resultado1_Sat{1,:},'VariableNames',{ 'T' 'P' 'vf' 'vg' 'uf' 'ug' });
t2=table(Resultado2_Sat{1,:},'VariableNames',{ 'T' 'P' 'hf' 'hg' 'sf' 'sg' });
    
    disp(' ')
    disp(' Estado: Mezcla Liquido-Vapor ')
    
    disp(' ')
    % Mostramos la tabla
    disp(t1)
    
    disp(' ')
    % Mostramos la tabla
    disp(t2)