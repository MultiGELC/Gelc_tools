#!/bin/sh
# Arquivo Shell Script - coletacorpusweb.sh - Coletando corpora da internet
# Função: Criar um menu de opções para baixar textos da internet.

clear
echo "	Menu de Opções
	1 - Baixar urls (sites inteiros)
	2 - Baixar um página html
	3 - Baixar um pdf
	4 - Converter arquivos html em txt
	5 - Converter arquivos pdf em txt
	6 - Verificar codificação de arquivos txt
	0 - Sair "
read opt

if [ $opt -eq 1 ]
then 
echo "Insira a url do site (endereço!!!):"
read site
wget -r $site
echo "Coletado com sucesso!"
fi

if [ $opt -eq 2 ]
then 
echo "Insira a url da página (endereço)"
read site
wget $site
echo "Coletado com sucesso!"
fi

if [ $opt -eq 3 ]
then 
echo "Insira a url da página com o pdf (endereço)"
read site
wget $site
echo "Coletado com sucesso!"
fi

if [ $opt -eq 4 ]
then 
echo "Insira o nome do diretório onde os arquivos html estão salvos (o diretório deve estar neste diretório atual)"
read dir
cd $dir
for i in *.*; do html2text "$i" > "$i.txt"; done
for i in *.html.txt; do mv -- "$i" "${i%.html.txt}.txt"; done
fi

if [ $opt -eq 5 ]
then 
echo "Insira o nome do diretório onde os arquivos pdf estão salvos (o diretório deve estar neste diretório atual)"
read dir
cd $dir
for i in *.*; do pdftotext "$i" > "$i.txt"; done
rm *.pdf.txt
fi

if [ $opt -eq 6 ]
then 
echo "Insira o nome do diretório onde os arquivos txt estão salvos (o diretório deve estar neste diretório atual)"
read dir
cd $dir
file -bi *.txt > $dir.txt
fi

if [ $opt -eq 0 ]
then 
exit
fi