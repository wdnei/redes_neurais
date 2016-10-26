%% Autor: Wdnei Ribeiro da Paixao
function showResult( alfabetoEntrada,letrasResultado )
%SHOWRESULT Funcao para mostrar os resultados de forma incremental
% Como entrada é passado o alfabeto de entrada para teste e um array
% contendo o resultado da classificação realizada pela rede neural
[alfabetoMat,alfabetoAlvo] = prprob;

f=figure();
iAtual=0;

bl1 =uicontrol('Style', 'pushbutton', 'String', 'Resultado anterior',...
        'Position', [0,10,100,23],'ButtonDownFcn',@lineCallback);
bl2 =uicontrol('Style', 'pushbutton', 'String', 'Proximo resultado',...
        'Position', [450,10,100,23]); 

tam=length(letrasResultado);
bl1.Callback=@(src,evt) mostrar(-1);

bl2.Callback=@(src,evt) mostrar(1);
mostrar(1);


function mostrar(inc)
        iAtual=iAtual+inc;
        
        if(iAtual<1)
            iAtual=tam;
        end
        
        if(iAtual>tam)
            iAtual=1;
        end        
        f;        
        subplot(1,2,1);
        plotchar(alfabetoEntrada(:,iAtual));
        title('Entrada');

        subplot(1,2,2);
        plotchar(alfabetoMat(:,letrasResultado{iAtual}));
        title('Saida');
            
    end

end

