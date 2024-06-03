<p align="center">
  <img src="image.png" alt="Alt Text">
</p>
<div align="center">

  <h1>AUTOMAÇÃO DA API SERVREST - ROBOT FRAMEWORK</h1>
</div>

## PRÉ-REQUISITOS
Requisitos de software e hardware necessários para executar este projeto de automação


* [Python 3.11](https://www.python.org/downloads/ "Python") ou superior
* [Robot Framework 6.1](https://robotframework.org/robotframework/ "Robot Framework") ou superior
* Biblioteca [RequestsLibrary](https://docs.robotframework.org/docs/different_libraries/requests "SetupTools")
* Biblioteca [Faker Library](https://pypi.org/project/robotframework-faker/ "Faker Library")
* [Vs Code](https://code.visualstudio.com/download) IDE
* Extensions Vs Code
    * Robot Framework Language
    * Python

## ESTRUTURA DO PROJETO

| Diretório                         | Finalidade                                                                                                 | 
|--------------------------------|------------------------------------------------------------------------------------------------------------|
| Features           | Local onde são descritas as features "Test Cases" em formato BDD                                           |
| Resource             | Local onde estão criados os recursos de configuração do projeto                                                           |
| Factories               | Local onde devem ser criados os bodys para cada Post                   |
| Results             | Local onde são criadas as evidências e relatórios do projeto                                        |

## INSTALANDO O ROBOT E BIBLIOTECAS
```sh default
pip install -r requirements.txt
```

## COMANDO PARA EXECUTAR OS TESTES

Com o prompt de comando acesse a pasta do projeto e execute o comando abaixo para rodar os testes automatizados.

```sh default
robot -d Results ./features/
```

## COMANDO PARA EXECUÇÃO DE TESTES COM TAGS

Com o prompt de comando acesse a pasta do projeto e execute o comando abaixo para rodar um cenário com a tag específica.

Ex.:
```sh default
robot -d Results -t "Fazer um Get Produtos com sucesso" features/get_produtos.robot
```

## EVIDÊNCIAS
Os arquivos com as evidências ficam localizados na pasta Results do projeto, esta pasta só é criada depois da primeira execução, nesta pasta se encontram os logs, o report html com os status da execução e os prins evidênciando a execução.
