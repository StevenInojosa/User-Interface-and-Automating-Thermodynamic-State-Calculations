%% Resultados_Int

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

v_Resultado = x*vg_Resultado + (1-x)*vf_Resultado; 
u_Resultado = x*ug_Resultado + (1-x)*uf_Resultado; 
h_Resultado = x*hg_Resultado + (1-x)*hf_Resultado; 
s_Resultado = x*sg_Resultado + (1-x)*sf_Resultado; 


Resultado1_Sat = { T_Resultado P_Resultado vf_Resultado v_Resultado vg_Resultado};
Resultado2_Sat = { T_Resultado P_Resultado uf_Resultado u_Resultado ug_Resultado};
Resultado3_Sat = { T_Resultado P_Resultado hf_Resultado h_Resultado hg_Resultado};
Resultado4_Sat = { T_Resultado P_Resultado sf_Resultado s_Resultado sg_Resultado};                  
              
              
              
 % Creamos una variable que guarde una tabla con los datos que mostraremos
% posteriormente
t1=table(Resultado1_Sat{1,:},'VariableNames',{ 'T' 'P' 'vf' 'v' 'vg' });
t2=table(Resultado2_Sat{1,:},'VariableNames',{ 'T' 'P' 'uf' 'u' 'ug' });
t3=table(Resultado3_Sat{1,:},'VariableNames',{ 'T' 'P' 'hf' 'h' 'hg' });
t4=table(Resultado4_Sat{1,:},'VariableNames',{ 'T' 'P' 'sf' 's' 'sg' });


    disp(' ')
    disp(' Estado: Mezcla Liquido-Vapor ')
    
    disp(' ')
    % Mostramos la tabla
    disp(t1)
    
    disp(' ')
    % Mostramos la tabla
    disp(t2)
    
    disp(' ')
    % Mostramos la tabla
    disp(t3)
    
    disp(' ')
    % Mostramos la tabla
    disp(t4)