%% Para ejecutar el programa hacerlo desde  Termodinamica.m

% Mensajes
 
 % Este Script nos muestra los distintos mensajes que pueden salir en el
 % programa mediante el comando disp, segun sea el caso, (comando switch)
 
 % Usamos el comando function con un numero de entrada, que se
 % correspondera al caso que evaluara el comando switch
 
 function  Mensajes(no)
switch no
    case 1  
   disp('______________________________________________________')
   disp('  Termodinamica           ')
   disp('                           ')
   disp('______________________________________________________')
   disp('       Menú   ')
   disp('  ')
   disp('	[1]. Water')
   disp('	[2]. Amonnia  ')
   disp('	[3]. Carbon Dioxide')
   disp('	[4]. R-410a ')
   disp('	[5]. R-134a                               ')
   disp('	[6]. Nitrogen                             ')
   disp('	[7]. Methane                               ')
   disp('  ')
   disp('	[9]. Borrar todos los datos')
   disp('	[10]. Salir del programa')
   
   disp(' ')
   
    case 2
    disp('______________________________________________________')
	disp('            ')
    disp('  Fluido de Trabajo: Water                        ')
	disp('                                           ')
	disp('______________________________________________________')
    disp('       Submenú   ')
    disp('  ')
    disp('	[1]. P-T  Presión y Temperatura')
   disp('	[2]. P-v  Presión y volumen especifico  ')
   disp('	[3]. T-v  Temperatura y volumen especifico')
   disp('	[4]. P-x  Presión y calidad ')
   disp('	[5]. T-x  Temperatura y Calidad                             ')
   disp('	[6]. v-x  Volumen especifico y calidad                      ')
   disp('	                              ')
   disp('	[0].   Cambiar Fluido de Trabajo                            ')
   disp('	[100]. Salir del Programa                                   ')
    
         
    end
    
    
 end

  