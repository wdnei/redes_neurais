%% Autor: Wdnei Ribeiro da Paixao
%% Reconhecendo o alfabeto usando redes neurais
% Este arquivo mostra um exemplo de classificacao por redes neurais de "imagens" ou matrizes
% que representam figuras de letras do alfabeto.
% Cada secao deste documento mostra cada passo que foi seguido. No entanto,
% a ultima secao demonstra o teste, que pode ser executado varias vezes sem
% a necessidade executar todo o documento, pois uma vez a rede neural
% criada não há a necessidade de treina-la novamente


%% Inicializa a matrix criando o alfabeto
[alfabetoMat,alfabetoAlvo] = prprob;

%% Inicializa a rede neural com 25 neuronios na camada interna
net1 = patternnet(25);
%view(net1);

%% Cria varias matrizes do mesmo alfabeto com ruido,para que a rede aumente a taxa de acerto
numNoise = 30; %quando maior este numero maior serah o numero de variacoes criadas e mais tempo demorarah  o treinamento
Xn = min(max(repmat(alfabetoMat,1,numNoise)+randn(35,26*numNoise)*0.2,0),1);
Tn = repmat(alfabetoAlvo,1,numNoise);


%% Treina a rede com os alfabetos com ruido 
net1 = train(net1,Xn,Tn);


%% TESTE INTERATIVO
% Testa a rede com um novo alfabeto com ruido
% É criado um novo alfabeto com ruido aleatorio e apos isto todos sao
% testados. Por fim, os resultados são mostrado de maneira interativa pela
% função showResult

taxa_ruido=0.2;%um multiplicador para gerar ruido

alfabetoAleatorio=min(max(alfabetoMat+randn(35,26)*taxa_ruido,0),1);

A = zeros(5,100);


[a ,tam]=size(alfabetoAleatorio);
x=0;
letraResult={};
%classifica o alfabeto de entrada com a rede neural
result=net1(alfabetoAleatorio);
for i = 1:(tam)        
    letraResult{i}=find(compet(result(:,i)) == 1);    
end

showResult(alfabetoAleatorio,letraResult);
