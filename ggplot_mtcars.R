data("mtcars")
view(mtcars)
mtcars2 <- data.frame(mtcars)
mtcars2$cyl <- as.factor(mtcars2$cyl)
ggplot(data = mtcars2, aes(x = cyl , y = mpg)) +
  geom_point()

mtcars2 %>% 
  group_by(cyl) %>% 
  summarise_each(funs = c(mean, max, min), mpg)

data("mpg")
view(mpg)



ggp <- ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +

ggp + scale_y_continuous(labels = comma_format(big.mark = ".", decimal.mark = ",")) 
