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

### Adding git to the project
usethis::use_git()
# choose if you want to commit your files.
# If yes: Yup

# choose the best option to restart RStudio


### Config GitHub in your project,
# You´re going to create a repository in your account
# arguments private and visibility to modify repository's visibility
usethis::use_github()
# repository created!

## Some warnings
# Get a situation report on your current Git/GitHub status.
# Useful for diagnosing problems.
usethis::git_sitrep()

# Vaccinate your global gitignore file
# Adds .DS_Store, .Rproj.user, .Rdata, .Rhistory, and .httr-oauth to your
# global (a.k.a. user-level) .gitignore. This is good practice as it
# decreases the chance that you will accidentally leak credentials to GitHub
usethis::git_vaccinate()

### Adding important files ---------------------------------
## Create a README.md file
usethis::use_readme_md()
# You have do edit and then save your README file.
# commit it and then push it to your GitHub profile

### Ignore git files ---------------------------------
usethis::use_git_ignore(c("proj_setup/"))

# R is GPL, any work linking dynamically or statically to R would have to be GPL-based also
# licensas de pacotes permitidas no CRAN:
# https://www.r-project.org/Licenses/
# AGPL, GPLv2, GPLv3, MIT, Creative Commons, Artistic License, etc.

## By now we're going to use GPL
use_gpl3_license()
