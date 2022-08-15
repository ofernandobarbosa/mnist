# Avaliação Sprint 3 - Programa de Bolsas Compass.uol e universidades de Rio Grande e Pelotas
Avaliação da terceira sprint do programa de bolsas Compass.uol para formação em chatbot Rasa.

----

### GRUPO:
#### [Anderson Oliveira](https://github.com/andersonaoliveira)
#### [Fernando Barbosa](https://github.com/ofernandobarbosa)
#### [Vinicius Telles](https://github.com/VTellesRg)

----
### DATASET ESCOLHIDO:
<img src="https://raw.githubusercontent.com/mbornet-hl/MNIST/master/IMAGES/GROUPS/mnist_v5_MNIST-2_01001-02000_25x40.png">

#### [MNIST 0️⃣1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣](https://www.tensorflow.org/datasets/catalog/mnist)
----

### LINK PARA TESTAR A APLICAÇÃO
* [Jupter Notebook](https://jupyter-lab-ofernandobarbosa.cloud.okteto.net/lab/workspaces/auto-O?reset)
* Token de acesso -> okteto
----
<img src="/img/login.png">
----

### COMO INSTALAR
1 - Após o login, no diretório AI, abra o arquivo setup.ipynb.

2 - Execute o notebook clicando em RUN e, em seguida, em RUN ALL CELLS.

3 - Retorne para o diretório raiz ./Work e execute o arquivo mnist.ipynb.

4 - Basta executar este arquivo da mesma forma que executou no passo 2 e seu notebook foi executado.

----
<img src="/img/run.png">
----

### SOBRE O DATASET ESCOLHIDO:
O banco de dados [MNIST](https://www.tensorflow.org/datasets/catalog/mnist) possui 70 mil imagens manuscritas de digitos de 0 a 9, que foram normalizadas e centralizadas em um quadrado de tamanho 28 x 28 pixels. Cada imagem é um array de números de pontos flutuantes, representados em uma escala de cinza de 0 (preto) à 1 (branco).
####
----
### TREINAMENTO:
No fit do modelo, foi utilizado o artifício de normalização do modelo com o aumento do 'batch_size', auxiliando na redução do tempo de treinamento do modelo.

<img src="img/image.png">

Nas 'epochs' utilizamos o valor 10, pois ao treinar outros modelos, percebemos um overfiting entre a validação e o treino, ou seja, a partir do momento em que a acurácia do treino atingir métricas maiores que a acurácia de validação, o treino é considerado dispensável, podemos considerar então o treino como viciado.
<img src="img/image3.png">
<img src="img/image1.png">
<img src="img/image2.png">

####
----
### CÓDIGO:
Código detalhado dentro do [Jupyter Notebook 💻](/mnist.ipynb) 
####
----
### MONGODB:

#### Ferramentas Utilizadas

Optamos por utilizar o banco de dados não relacional MongoDB com a finalidade de guardar informações processadas no próprio código e, também, realizar testes com elas.

Para isso instalamos, importamos e utilizamos ferramentas como o PYMONGO, o BSON.BINARY, o Mongo Express e o próprio MONGODB. Essas ferramentas permitiram que pudessemos salvar os próprios arquivos, de forma binária, dentro do banco e também recuperar estes intactos no momento oportuno.

#### Instalação

A instalação das ferramentas MongoDB e Mongo Express se deram via arquivo [docker-compose](/docker-compose.yml).

Enquanto isso, o PyMongo foi instalado na própria aplicação principal mnist.ipynb através do comando
```py
!pip install pymongo
``` 

#### Conectando com o mongo

- A conexão com o MongoDB se deu na aplicação principal com o comando

```py 
client = MongoClient("mongodb://root:root@mongodb:27017/")
```

- Criamos banco de dados que denominamos "sprint3" através do comando

```py 
database = client["sprint3"]
```

- Utilizamos duas bases de dados, foram elas 'modelo' e 'numeros' para guardar, em binário, respectivamente:

    1 - Modelos Treinados

    2 - Imagens criadas a mão, no paint, para testes

#### Acesso aos arquivos

- Para reestabelecer os arquivos salvos no MongoDB, utilizamos função de pesquisa `find_one` com os parâmetros de `filename` em que localizamos o arquivo específico, a função open para criar e abrir e a função `write` para escrever de volta o arquivo convertido em binário.

#### Testes com arquivos gerados pelo MongoDB

- Ao fim, utilizando arquivos recuperados do banco de dados, realizamos testes com as imagens feitas a mão para conferir a calibragem da aplicação com os testes previamente realizados via modelo h5.

----
### IMAGENS PARA TESTE:
As imagens para teste foram criadas manualmente via paint com lápis espessura 2, foram salvas, normalizadas e centralizadas em tamanhos variados.

<img src="img/zero.png"> <img src="img/um.png"> <img src="img/dois.png"> <img src="img/tres.png"> <img src="img/quatro.png"> <img src="img/cinco.png">
<img src="img/seis.png"> <img src="img/sete.png"> <img src="img/oito.png"> <img src="img/nove.png">
----
### CONSIDERAÇÕES FINAIS:
#### Dificuldades encontradas

Impende destacar nossas dificuldades na utilização do JupyterLab integrado ao container no Okteto porque, após a instalação, não é mais concedido acesso de administrador ao utilizador do sistema. Ou seja, muito embora se utilize de usuário root (necessário) para realizar a instalação da aplicação, ainda assim, não temos permissões para realizar alterações nos arquivos criados originalmente.

No terminal, por exemplo, não temos senha ou usuário Administrador para remover essas limitações.

<img src="img/writable-false.png">

#### Soluções encontradas

A solução que encontramos foi, após a criação dos arquivos e pastas, criarmos uma cópia da aplicação principal diretamente na raiz '/work' e executar nosso notebook a partir dela. Nossos modelos e arquivos para testes são, também, colocados na pasta raiz, mas isso é feito diretamente pelo banco de dados. 

<img src="img/writable-true.png">

----
