%% Para ejecutar el programa hacerlo desde  Termodinamica.m

% Menú
% Construiremos el menu usando el comando switch, que para cada opcion
% (numero) nos dara un submenu segun sea el caso (que sera mostrado gracias
% al script de Mensajes), y realizara los calculos en el script de acciones

% Definimos la variable loop
loop=1;

% El ciclo se mantendra mientras loop sea 1, lo que nos permitira volver al
% menu principal despues de terminar cada acción en los distintos submenus

while loop==1
   
    % Mostraremos el menu principal 
    Mensajes(1); 
    
    % Elegimos una opción del menu principal
    AD = input('Seleccione el Fluido de Trabajo : '); 
    
    % Borramos el Command Window
    clc
    
   switch AD
       
        
        case 1
            Menu_Water  ;
            
            
                       
         
   
            
        % Salimos del programa                
       case 10
           loop=0;
            disp('Ha salido del programa ')
    end
    
end