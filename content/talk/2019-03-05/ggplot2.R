library("tidyverse")
library("gapminder")

## ------------------------------------------------------------------------
head(gapminder)

## ---- 
hist(gapminder$lifeExp, col="lightblue", main="", xlab="Life Exp")

## ---- 
ggplot(gapminder, aes(lifeExp))+geom_histogram(fill="lightblue")+labs(title="")

## ---- 
plot(gapminder$gdpPercap, gapminder$lifeExp, main="", xlab="GDP", ylab="Life Exp")

## ---- 
ggplot(gapminder, aes(gdpPercap,lifeExp))+geom_point()+labs(title="")

## ------------------------------------------------------------------------
plot = ggplot(gapminder, aes(x = gdpPercap, y = lifeExp))

## ---- 
plot + geom_point()

## ---- 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + geom_point() 

## ---- 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + geom_point() + 
  scale_x_log10()

## ---- 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + geom_point() + 
  scale_x_log10() + theme_minimal() + theme(legend.position="bottom") 

## ---- 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha=0.5) + theme_minimal() + theme(legend.position="bottom") +
  scale_x_log10(breaks = c(300, 1e3, 3e3, 10e3, 30e3)) + 
  labs(title = "Gapminder and ggplot2",
       x = "Gross Domestic Product (log scale)",
       y = "Life Expectancy at birth (years)",
       color = "Continent", size = "Population")

## ---- 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point() + geom_smooth() 

## ---- 
ggplot(gapminder, aes(x=reorder(continent, continent, length)))+geom_bar(aes(fill=continent))

## ---- 
ggplot(gapminder, aes(x=reorder(continent, continent, length)))+geom_bar(aes(fill=continent))+
  coord_polar() #<<


## ---- 
ggplot(gapminder, aes(x = continent, y = lifeExp)) +
  geom_boxplot(fill="lightblue", outlier.colour = "hotpink") +
  geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)


## ---- 
ggplot(gapminder,aes(lifeExp))+geom_density(aes(group=continent,colour=continent,fill=continent),alpha=0.1) +
  annotate("text", x = 38, y = 0.09, parse = TRUE, size = 8, label = "y==frac(1, sqrt(2*pi)) * e^{-x^2/2}") 


## ---- 
gapminder %>%
  mutate(gdp=gdpPercap*pop) %>%
  group_by(continent,year) %>%
  summarize(MeanLifeExp=mean(lifeExp), MeanGDP=mean(gdp)) %>%
  ggplot(aes(year,MeanGDP,color=continent)) + 
  geom_line()


## ---- 
ggplot(gapminder, aes(gdpPercap, lifeExp, group=continent, color=year, size=pop)) + 
  geom_point() + 
  facet_wrap(~ continent) +
  scale_color_gradient(low="red", high="green") +
  theme_minimal()+ theme(legend.position="bottom") 


## ---- 
gapminder %>% filter(year==2007) %>%
  ggplot(aes(x = gdpPercap, y = lifeExp, color = continent, size = pop, label = country)) +
  geom_text() +
  # clean the axes names and breaks
  scale_x_log10(limits = c(200, 60000)) +
  labs(title = "GDP versus life expectancy in 2007",
       x = "GDP per capita (log scale)",
       y = "Life expectancy") +
  # add a nicer theme
  theme_classic() + theme(legend.position="none")

## ---- 
library(GGally)
ggcorr(gapminder[,3:6], label = T)


## ---- 
install.packages("gifski")
library(gganimate)

gapminder %>%
  ggplot(aes(gdpPercap, lifeExp, size = pop, colour = continent)) +
  geom_point(alpha = 0.4) +
   geom_text(aes(x = gdpPercap, y = lifeExp + 2, label = country), size=4,
            data = filter(gapminder, country %in% c("Spain"))) +
  scale_x_log10(limits = c(200, 60000)) +
  theme_light() + theme(legend.position = 'bottom') +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita (log)', y = 'Life expectancy') +
  transition_time(year) + 
  ease_aes('linear')  


