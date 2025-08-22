library(tidyverse)
mdata <- read.csv('data/pfpr_intvn.csv')

ncol(mdata)
nrow(mdata)
dim(mdata)


mdata$residence
unique(mdata$residence)
busia <- mdata |> filter(county == 'Busia')

# Line Plot
ggplot(busia)+
  geom_line(aes(x=year, y=pfpr, col=residence)) +
  labs(title='Plasmodium Falciparum Prevalence', x='Year', y='Pfpr (%)') +
  theme_gray()

# Scatter Plot
ggplot(busia)+
  geom_point(aes(x=itn_coverage, y=pfpr))+
  labs(title = "The relationship between ITN use and PfPr",
       x="ITN Coverage (%)",
       y="PfPRr (%)")