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


%% TESTE
% Testa a rede com um novo alfabeto com ruido

taxa_ruido=0.2;%um multiplicador para gerar ruido

alfabetoAleatorio=min(max(alfabetoMat+randn(35,26)*taxa_ruido,0),1);

% escolhe uma letra aleatoria para testar
letraAl=randi([1 26]);


figure
%desenha entrada
subplot(1,2,1);
plotchar(alfabetoAleatorio(:,letraAl));
title('Entrada');


%classifica a letra de entrada com a rede neural
result=net1(alfabetoAleatorio(:,letraAl));
letraResult=find(compet(result) == 1);

%desenha saida
subplot(1,2,2);
plotchar(alfabetoMat(:,letraResult));
title('Saida');


