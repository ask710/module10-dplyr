# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# install and load dplyr

library("dplyr")

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the vehicles data.frame
View(vehicles)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
acura.2015 <- filter(vehicles, make == "Acura", year == 2015)
best.acura <- filter(acura.2015, hwy == max(hwy))
model <- select(best.acura, model)
print(model)
# Which Accura model has the best hwy MPG in 2015? (nesting functions)
best.acura.model <- select(
                      filter(
                          filter(
                            vehicles, 
                            make == "Acura", 
                            year == 2015
                            ), 
                          hwy == max(hwy)
                         ), 
                      model
                      )
print(best.acura.model)

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
best.acura.pipe <- filter(vehicles, make == "Acura", year == 2015) %>% 

### Bonus ###

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times

# Without chaining


# Nested functions


# Pipe operator


# Pretty similar...
