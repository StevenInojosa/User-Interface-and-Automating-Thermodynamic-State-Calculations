%% Resultados

% Guardamos todos los datos en una sola variable a la que llamaremos
% Resultados

% Guardamos los vectores como Double con sus decimales
P_Resultado =  double( MATRIZ(:,6) );
T_Resultado =  double( MATRIZ(:,1) );
v_Resultado =  double( MATRIZ(:,2) );
u_Resultado =  double( MATRIZ(:,3) );
h_Resultado =  double( MATRIZ(:,4) );
s_Resultado =  double( MATRIZ(:,5) );

Resultado = { P_Resultado T_Resultado v_Resultado u_Resultado h_Resultado s_Resultado } ;

 % Creamos una variable que guarde una tabla con los datos que mostraremos
% posteriormente
t=table(Resultado{1,:},'VariableNames',{ 'P' 'T' 'v' 'u' 'h ' 's' });

 
    disp(' ')
    % Mostramos la tabla
    disp(t)