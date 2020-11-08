# SWC First Script
# HP Nestler, November 8, 2020

5+6
4*3
7/3

# download packages install.package() - only once per installation
# Tidyverse is a package of packages
# install.packages("tidyverse")


# activate packages for session, packages should be installed 
library(tidyverse)
library(dplyr)

# DATA WRANGLING

# read data into R
# read.delim()
# read.csv()

# download.file("https://raw.githubusercontent.com/iaviney/SWC_Workshop/main/Data/Data_Workfolder/gapminderdata/gapminder_by_country/gapminder.txt", "/cloud/project/gapminder.txt")
read.delim("gapminder.txt")

# dataframe = R Table concept = tibble

# <- assignment operator
gapminder <- read.delim("gapminder.txt")

# examine the file/object
# others are head() and tail()
view(gapminder2) # Tidyverse allows lowercase 'view'
summary(gapminder) # overview on file statistics
glimpse(gapminder) # view columns in rows & variable types
colnames(gapminder)

# size of dataframe matrix
nrow(gapminder)
ncol(gapminder)

# select() chooses variables from dataframe
gap1 <- select(gapminder, "country", "year", "pop") # quotes on column names are optional
view(gap1)

# filter() chooses values
filter(gapminder, country == "Cambodia")

# Boolean Operators
# = assignment operator, same as <-
# == test equality
# < > 
# | or, & and
# ! not for boolean operator, not the logical NOT

number_five = 5
number_six = 6
number_five == number_six

filter(gapminder, country == "Cambodia", year == 2002)
filter(gapminder, country == "Cambodia" ! year == 2002)
filter(gapminder, continent != 'Asia')

# piping data through commands %>% (more for coding efficiency, ) - line break after each command

gapminder %>%
  select(country, year, pop, continent) %>%
  filter(continent != 'Asia')

# arrange = sort, asc/desc

gapminder %>%
  select(country, year, pop, continent) %>%
  filter(continent == 'Africa') %>%
  arrange(desc(pop))

# group() and summarize()
# mean () median() max() min()

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(avg_life_exp = mean(lifeExp))

gapminder %>%
  mutate(pop_in_millions = pop/1000000) %>%
  {. ->> gap2 } # assign into new variable
  
#  write.csv("Data/Data_Workfolder/gapminder_ext.csv") # write into file

view(gap2)

# ggplot introduction in ggplot_intro.R
