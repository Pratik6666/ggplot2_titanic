library(ggplot2)
titanic <- read.csv("titanic.csv",stringsAsFactors = F)
View(titanic)

#the variables which can only assume pre defined values are set as factors
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

#########################################
#survival rate
#########################################

ggplot(data = titanic, aes(x = Survived)) +
  geom_bar()
#percentage
prop.table(table(titanic$Survived))

# male female percentage
ggplot(data = titanic, aes(x = Sex)) +
  geom_bar() 
prop.table(table(titanic$Sex))

#small customization
ggplot(data = titanic, aes(x = Survived))+
  theme_bw()+
  geom_bar()+
  labs(y = "Passenger Count ", x = "Survivors", title = "Survivors of Titanic")

###########################################
#What was the survival rate by gender???
###########################################

ggplot(data = titanic, aes(x = Sex, fill = Survived)) +
  geom_bar()+
  theme_gray()+
  labs(title = "Survival for male and female", y = "Passenger Count")

#practice - male female - class distribution
ggplot(data = titanic, aes(x = Sex, fill = Pclass))+
  geom_bar()

################################################
# What was the survival rate by class of ticket?
################################################

ggplot(data = titanic, aes(x = Pclass, fill = Survived)) +
  geom_bar()+
  theme_dark()+
  labs(x = "Passenger Class", y = "Passenger Count", title = "Survival rate by ticket class")

#################################################
# What was the survival rate by class and gender?
#################################################
#Hint: we use facet_wrap

ggplot(data = titanic, aes(x = Pclass, fill = Survived))+
  geom_bar()+
  facet_wrap(~Sex)+
  labs(title = "Survival rates by gender and class")

###################################################
# What is the distribution of passenger ages? - survival rates by age and gender
###################################################
#Use Histogram

ggplot(data = titanic, aes(x = Age, fill = Survived))+
  geom_histogram(binwidth = 5)+
  facet_wrap(~Sex)
labs(title = "Age distribution", x = "Age (Binwidth = 5)", y = "Passenger count")

####################################################
# What is the distribution of passenger ages? - Use boxplot
####################################################

ggplot(data = titanic, aes(x = Survived, y = Age))+
  geom_boxplot() +
  facet_wrap(~Sex)+
  labs( title = "Gender and Age wise survival" )

#################################################################################
# What is the survival rate by age when segmented by gender and class of ticket?
#################################################################################

ggplot(data = titanic, aes(x = Age, fill = Survived))+
  geom_histogram(binwidth = 5)+
  facet_wrap(Sex~Pclass)

ggplot(data = titanic, aes(x = Age, fill = Survived))+
  geom_density(alpha = 0.5)+
  facet_wrap(Sex~Pclass)+
  labs(title = "Survival rates based on gender, class and age : ")

ggplot(data = titanic, aes(x = Age, fill = Survived))+
  geom_density(alpha = 0.6)+
  facet_wrap(~Sex)