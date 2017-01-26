# Exercise 4: DPLYR and flights data

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# The data.frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# use `??flights` to search for documentation on the data set (for what cols are)
View(head(flights))
nrow(flights)
ncol(flights)
print(colnames(flights))
# Use `dplyr` to give the data frame a new column that is the amount of time gained in the air
#flights <- mutate(flights, gain = arr_delay - dep_delay)

# Use `dplyr` to sort your data.frame descending by the column you just created.
# Remember to save this as a variable (or in the same one!)
#flights <- arrange(flights, -gain)

# For practice, repeat the last 2 steps in a single statement using the pipe operator
flights <- flights %>% 
          mutate(gain = arr_delay - dep_delay) %>% 
            arrange(-gain)

# Make a histogram of the amount of gain using the `hist()` function
histogram.gain <- hist(flights$gain)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
mean(flights$gain, na.rm = TRUE)

# Create a data.frame of flights headed to seatac ('SEA'), only including the
# origin, destination, and the "gain" column you just created
flights.seatac <- flights %>% 
                    filter(dest == "SEA") %>% 
                      select(origin, dest, gain)

# On average, did flights to seatac gain or loose time?
mean(flights.seatac$gain, na.rm = TRUE)

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement!
# (and don't show any other data)
flights.jfk.sea <- flights %>% 
                    filter(origin == "JFK", dest == "SEA") %>%
                      summarize(mean = mean(air_time, na.rm = TRUE), 
                                minimum = min(air_time, na.rm = TRUE), 
                                   maximum = max(air_time, na.rm = TRUE))
