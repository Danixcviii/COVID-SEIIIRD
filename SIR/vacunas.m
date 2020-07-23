function vac = vacunas(n)

    numerodias= n-1;
    x=0:1:numerodias; 
    monto_mensual=10E9;
    b_1=3655.6;
    b_2=3388.1;
    m=-4.366;
    b_prom=(b_1+b_2)/2;

    y_1=m*x+b_1;
    y_2=m*x+b_2;
    y_prom=m*x+b_prom;

    yruido=awgn(y_prom,32,"measured");
    
  
    for i=1:length(yruido)
        monto_mensual_dolar(i)=monto_mensual/yruido(i);
    end

    for i=1:length(yruido)
        numero_vacunas(i)=(monto_mensual_dolar(i)/5);
    end

    vac = zeros(1, numerodias+1);
    max_mes = 30;
    dia  = 1;
    vacunas = floor(numero_vacunas(1));
    for k = 1:length(vac)
        if dia == 30
            dia = 1;
            vacunas = floor(numero_vacunas(k));
        end
        vac(k) = vacunas;
        dia = dia + 1; 
    end
    
     vac = vac/max_mes;
    
     dates = datetime(2020, 07, 22, 0, 0, 0):datetime(2020, 07, 22, 0, 0, 0)...
             + caldays(numerodias);
     
    figure
        subplot(2, 1, 1)
        plot(dates, yruido)
        hold on
        plot(dates, y_1)
        hold on
        plot(dates, y_2)
        hold on
        plot(dates, y_prom)
        
        legend('Precio', 'Resistencia', 'Soporte', 'Tendencia')
        title('USD/COP - 1D')
        
        
        subplot(2, 1, 2)
        plot(dates, vac)
        
        ylabel('vacunas disponibles')
        title('Vacunas suministradas por día')
    
   
    

   % clear b_1 b_2 b_prom dia i k m max_mes monto_mensual_dolar
    %clea monto_mensual numero_vacunas numerodias vacunas x x_men y_1 y_2 y_prom yruido

end