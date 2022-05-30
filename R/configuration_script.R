#################### mlPipe - R package to automate machine learning functions in R ######################
#################### Matheus Maciel Alcantara Salles #####################################################
#################### PPGZoologia UFPR  ###################################################################
#################### Zoology Department ##################################################################

## Msc. Matheus Maciel Alcantara Salles - PPGZoo - UFPR
## matheusmaciel.salles@gmail.com

### Upload packages "usethis" and "devtools"
library(usethis)
library(devtools)

# if you want to create a project
usethis::create_project("C:/Users/mathe/OneDrive/mlPipe")
# if you want to crate a package
usethis::create_package("C:/Users/mathe/OneDrive/mlPipe")

### Adicionando git ao projeto
usethis::use_git()
# escolha se quer fazer o commit dos arquivos.
# Se sim: Yup

# escolha a opção para reiniciar o RStudio


### Configurando o github no projeto,
# Vai criar o repositório na conta
# argumentos private e visibility pra alterar a visibilidade do repositório
usethis::use_github()
# Repositório criado!

## Algumas precauções
# Get a situation report on your current Git/GitHub status.
# Useful for diagnosing problems.
usethis::git_sitrep()

# Vaccinate your global gitignore file
# Adds .DS_Store, .Rproj.user, .Rdata, .Rhistory, and .httr-oauth to your
# global (a.k.a. user-level) .gitignore. This is good practice as it
# decreases the chance that you will accidentally leak credentials to GitHub
usethis::git_vaccinate()

### Adicionando arquivos ---------------------------------
## Criar um arquivo README.md
usethis::use_readme_md()
# O arquivo será criado e aberto, para ser editado e salvo.
# faça o commit e Push para o GitHub

### Ignorar arquivos no git ---------------------------------
usethis::use_git_ignore(c("proj_setup/"))
