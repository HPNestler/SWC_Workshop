# ggplot Intro
# H. Peter Nestler, November 8, 2020

library(tidyverse)

# download.file("https://raw.githubusercontent.com/iaviney/SWC_Workshop/main/Data/Data_Workfolder/gapminderdata/gapminder_by_country/gapminder.txt", "/cloud/project/gapminder.txt")
gapminder <- read.delim("gapminder.txt")
# view(gapminder)

# ggplot syntax
# ggplot(data = , mapping = aes(x= ,y=))
# then add geom to assign plot type

# First plot
ggplot(data = gapminder, mapping = aes(x=continent, y=lifeExp, fill=continent)) +
  geom_boxplot() + # plot styile for data
  labs(title = "Life Expectancies", x=element_blank(), y="Years", fill=element_blank()) + # Labels
  theme_bw() # overall look of graph
#+
#  geom_point() # add for additional layers