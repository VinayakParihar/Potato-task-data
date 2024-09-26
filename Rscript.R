
##Open up the Tidyverrse package for its various features like manipulaton of data
library(tidyverse)

###### EXTRA:  using the n()function to get the total number of rows (tweets) 
###### EXTRA: XYZ <- DATA , is just making a new data frame after extraction from oroginal data  
###### EXTRA: %>% is pipe operator of tidyverse package which meeans and then . (ie: do this and then do this and then do this)


## Load the tweet data using the path of the downloaded file
tweet_data <- read_tsv("correct_twitter_201904.tsv")

##view command enables the user to view the data set just like a excel file
View(tweet_data)

## Str to check the characteristics of data to check if they are in correct format . eg: date ymd_hms
str(tweet_data)

# Check if there are any NA values in the dataset
any(is.na(tweet_data))

#### Result=False 


# Count the number of NA values per column
colSums(is.na(tweet_data))
# Show rows with NA values
tweet_data[!complete.cases(tweet_data), ]


summary(tweet_data)



## Number of tweets containing a term per day:


#### Here we are creating a data set containing dates(grouped) and number of tweets on that date 
tweets_per_day <- tweet_data %>%
  filter(grepl("music", text, ignore.case = TRUE)) %>%
  group_by(day = as.Date(created_at)) %>%
  summarise(count = n())

print(tweets_per_day)


#### Here we have filtered data to count the number of distinct author_id entries, which gives you the number of unique users who tweeted about music.
unique_users <- tweet_data %>%
  filter(grepl("music", text, ignore.case = TRUE)) %>%
  summarise(unique_users = n_distinct(author_id))

print(unique_users)


#### Average likes for tweets containing the term music
#### computes the average of the like_count column for the filtered tweets, using na.rm = TRUE to exclude any missing values.

avg_likes <- tweet_data %>%
  filter(grepl("music", text, ignore.case = TRUE)) %>%
  summarise(avg_likes = mean(like_count, na.rm = TRUE))

print(avg_likes)


####Where the tweets came from (place IDs)
#### Here i am grouping them by their respective place IDs, and summarizing the counts of these tweets
#### Note : if you want to just look at all tweets irrespective of if they contain term "music , just remove the line containing the command filter

tweets_by_place <- tweet_data %>%
  filter(grepl("music", text, ignore.case = TRUE)) %>%
  group_by(place_id) %>%
  summarise(count = n())

print(tweets_by_place)


#### Times of day tweets were posted:
#### creating a column named hour using mutate (extracting the hour from the created_at), grouping it by hour and then counting it shows how many tweets containing the specified term were posted during each hour of the day.

tweets_by_time <- tweet_data %>%
  filter(grepl("music", text, ignore.case = TRUE)) %>%
  mutate(hour = hour(created_at)) %>%
  group_by(hour) %>%
  summarise(count = n())

print(tweets_by_time)


####User who posted the most tweets containing the term:
####
temp_result <- tweet_data %>%
  filter(grepl("music", text, ignore.case = TRUE)) %>%
  group_by(author_id, author_handle) %>%
  summarise(tweet_count = n())

print(head(temp_result))  # Inspect the counts before sorting

top_user <- temp_result %>%
  arrange(desc(tweet_count)) %>%
  slice(1)

print(as.data.frame(top_user))  # Final output


######## if above doesnt' work


# Step 1: Check if the term is present in the dataset

count_of_tweets <- nrow(tweet_data %>% filter(grepl("music", text, ignore.case = TRUE)))
print(paste("Number of tweets containing the term:", count_of_tweets))

# Step 2: Summarize tweet counts by user
temp_result <- tweet_data %>%
  filter(grepl("music", text, ignore.case = TRUE)) %>%
  group_by(author_id, author_handle) %>%
  summarise(tweet_count = n(), .groups = 'drop')

# Step 3: Inspect the intermediate results
print(head(temp_result))

# Step 4: Check for no tweets found
if (nrow(temp_result) == 0) {
  print("No tweets found containing the specified term.")
} else {
  # Step 5: Identify the top user
  top_user <- temp_result %>%
    arrange(desc(tweet_count)) %>%
    slice(1)
  
  # Step 6: Print the top user
  print(as.data.frame(top_user))
}

