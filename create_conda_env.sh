#!/bin/bash

# Solicitando entradas do usuário
read -p 'Nome do ambiente: ' envname
read -p 'Versão do Python (ex: 3.7): ' pyversion
read -p 'Caminho do arquivo de requisitos (enter se não houver): ' requirements
read -p 'Libs adicionais separadas por espaço (enter se não houver): ' libs

# Criando ambiente
conda create --name $envname python=$pyversion

# Ativando ambiente
source activate $envname

# Instalando requisitos se o arquivo de requisitos for fornecido
if [ ! -z "$requirements" ]
then
    pip install -r $requirements
fi

# Instalando libs adicionais se fornecidas
if [ ! -z "$libs" ]
then
    pip install $libs
fi
