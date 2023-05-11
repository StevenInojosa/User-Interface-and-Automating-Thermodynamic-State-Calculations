% Water MENU
%% Recordar agregar       ---> Saturated Water Pressure Entry <---
%% Recordar Agregar Submenu para MLV (Table_MLV)

E = 0.09;
loop = 2;
           
            while loop == 2;
             Mensajes(2) ;
             disp('  ')   
             Sub1 = input('Seleccione el estado a definir : '); 
             disp('  ') 
             switch Sub1
                
                     %% P-T  Presión y Temperatura
                 case 1
                     % input('Ingrese la Temperatura [?C]: ')
                     % input('Ingrese la Presión [kPa]: ');
                     Presion = input(' Ingrese la Presión [kPa] ' ); 
                     Temp = input(' Ingrese la temperatura [c] '); 
                     Table_MLV;
                     MATRIZ = Presion_Temperatura_01(Presion,Temp,Saturated) ;
                     
                     if MATRIZ(:,1) == MATRIZ(:,3)
                        V = MATRIZ(1,:) ;
                        
                        elseif abs( MATRIZ(1,1) - Temp ) <= 0.09
                        V = MATRIZ(1,:) ;
                        elseif abs( MATRIZ(3,1) - Temp ) <= 0.09
                        V = MATRIZ(3,:) ;
                        else 
                            V = MATRIZ(:,2) ;
                            MATRIZ;
                      end

                     % Vemos en que fase esta
                     if V(2)-Presion> E
                        % VSC
                        K=3;
                        elseif abs(V(2)-Presion ) <= E
                        % MLV
                        K=2;
                        else
                        % LC
                        K=1;
                     end
                    
                     if K == 3
                         VSC = 50;
                     Table_VSC;
                     MATRIZ = Presion_Temperatura_02(Presion,Temp,DATOS,AD);
                     Presion_Temperatura_03
                     disp('Estado: VSC ')
                     disp('  ')
                     
                     elseif K == 1
                         LC = 50;
                     Table_LC;
                     MATRIZ = Presion_Temperatura_04(Presion,Temp,DATOS,AD);
                     Presion_Temperatura_03
                     disp('Estado: LC ') 
                     disp('  ')
                     end
                     
                     Pausa = input('Presione Enter para continuar ');
                     
                     %% Presión y volumen especifico 
                 case 2
                     % Ubicamos PoT en Sat
                     P = input(' Ingrese la Presión [kPa] ');
                     v = input(' Ingrese el volumen especifico [m^3/kg] ');
                     PoT = P;
                     % Prop es la columna de la propiedad pars este caso:
                     % Volumen especifico
                     Prop = 2;
                     
                     % Opcion 2 es Presión
                     Opcion = 2;
                     Table_MLV;
                     MATRIZ = Presion_Prop_01(PoT,Saturated,Opcion);
                     
                     if MATRIZ(:,1) == MATRIZ(:,3)
                        V = MATRIZ(1,:) ;
                        
                        elseif abs( MATRIZ(1,Opcion) - PoT ) <= 0.09
                        V = MATRIZ(1,:) ;
                        elseif abs( MATRIZ(3,Opcion) - PoT ) <= 0.09
                        V = MATRIZ(3,:) ;
                     else
                            V = MATRIZ(2,:) ;
                            MATRIZ;
                     end
                      
                     % Vemos en que fase esta
                     if v - V(5) > 0
                        % VSC
                        K=3;
                        elseif V(3)<=v & v<=V(5)
                        % MLV
                        K=2;
                        else
                        % LC
                        K=1;
                     end
                     
                     if K == 3
                         VSC = 50;
                     Table_VSC;
                     % Conseguimos las propiedades para su posterior
                     % interpolacion
                     MATRIZ = Presion_Prop_02(PoT,Opcion,v,DATOS,AD,Prop);
                     Presion_Prop_03
                     disp('Estado: VSC ')
                     disp('  ')
                    
                     elseif K == 1
                         LC = 50;
                     Table_LC;
                     % Conseguimos las propiedades para su posterior
                     % interpolacion
                     MATRIZ = Presion_Prop_04(PoT,Opcion,v,DATOS,AD,Prop);
                     Presion_Prop_03
                     disp('Estado: LC ') 
                     disp('  ')
                     end
                     
                     Pausa = input('Presione Enter para continuar ');
                     
                     %% Temperatura y volumen especifico
                 case 3
                     T = input(' Ingrese la temperatura [c]');
                     v = input(' Ingrese la el volumen especifico [m^3/kg] ');
                     PoT = T;
                     % Prop es la columna de la propiedad para este caso:
                     % Volumen especifico
                     Prop = 2;
                     
                     % Opcion 1 es Temperatura
                     Opcion = 1;
                     Table_MLV;
                     MATRIZ = Temperatura_Prop_01(PoT,Saturated,Opcion);
                     
                     if MATRIZ(:,1) == MATRIZ(:,3)
                        V = MATRIZ(1,:) ;
                        
                        elseif abs( MATRIZ(1,Opcion) - PoT ) <= 0.09
                        V = MATRIZ(1,:) ;
                        elseif abs( MATRIZ(3,Opcion) - PoT ) <= 0.09
                        V = MATRIZ(3,:) ;
                     else
                            V = MATRIZ(2,:) ;
                            MATRIZ;
                     end
                     
                     % Vemos en que fase esta
                     if v - V(5) > 0
                        % VSC
                        K=3;
                        elseif V(3)<=v & v<=V(5)
                        % MLV
                        K=2;
                        else
                        % LC
                        K=1;
                     end
                        
                      if K == 3
                         VSC = 50;
                     Table_VSC;
                     % Conseguimos las propiedades para su posterior
                     % interpolacion
                     MATRIZ = Temperatura_Prop_02(PoT,Opcion,v,DATOS,AD,Prop,n);
                     Temperatura_Prop_03;
                     disp('Estado: VSC ')
                     disp('  ')
                     
                     elseif K == 2
                     Temperatura_Prop_05;
                         
                     elseif K == 1
                         LC = 50;
                     Table_LC;
                     % Conseguimos las propiedades para su posterior
                     % interpolacion
                     MATRIZ = Temperatura_Prop_04(PoT,Opcion,v,DATOS,AD,Prop,n);
                     Temperatura_Prop_03;
                     disp('Estado: LC ') 
                     disp('  ')
                     end
                     
                     Pausa = input('Presione Enter para continuar ');
                        
                     %% Presión y calidad
                 case 4
                     P = input(' Ingrese la Presión [kPa] ');
                     x = input(' Ingrese la calidad ');
                     PoT = P;
                    
                     % Opcion 2 es Presión
                     Opcion = 2;
                     Table_MLV;
                     MATRIZ = PoT_Calidad_01(PoT,Saturated,Opcion,x);
                     
                     Pausa = input('Presione Enter para continuar ');
                     
                     %% Temperatura y calidad
                 case 5
                     T = input(' Ingrese la temperatura [c] ');
                     x = input(' Ingrese la calidad ');
                     PoT = T;
                    
                     % Opcion 1 es Temperatura
                     Opcion = 1;
                     Table_MLV;
                     MATRIZ = PoT_Calidad_01(PoT,Saturated,Opcion,x);
                     
                     Pausa = input('Presione Enter para continuar ');
                     
                     %% Volumen especifico y calidad
                 case 6
                     Prop = input(' Ingrese volumen especifico [m^3/kg] ');
                     x = input(' Ingrese la calidad ');
                     
                     % vf y vg
                     PropInf = 3;
                     PropSup = 5;
                     
                     Table_MLV;
                     Prop_Calidad_01
                     
                     Pausa = input('Presione Enter para continuar ');
                     
                     
                 case 0
                     % Cambiar fluido de Trabajo
                     loop = 1;
                     
                 case 100
                     % Salir del programa
                     loop = 0;
                     disp('Ha salido del programa ')
                     
                     
               % Borramos las variables
%                        Delete      
             end
            end
            
