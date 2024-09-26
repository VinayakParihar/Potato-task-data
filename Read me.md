# **Introduction**

#### The task at hand is an open-ended analysis of a dataset containing tweets, where the goal is to query and extract various insights based on specific search terms. Since the requirements allow for flexibility in the approach, I have chosen to use R for this analysis. R is well-suited for data manipulation, querying, and statistical analysis, making it ideal for handling the structure and querying of the tweet dataset.
#### By using R, I can effectively ingest the data, clean it, and build functionality that allows for querying based on search terms, while also performing various aggregations and analyses on the results. This approach enables efficient handling of large datasets and provides the flexibility needed to answer open-ended questions, such as finding trends over time, identifying user behaviors, and analyzing tweet engagement.

## install R
###### Installing R on Windows OS
###### Go to the CRAN website.
###### Click on "Download R for Windows".
###### Click on "install R for the first time" link to download the R executable (.exe) file.
###### Run the R executable file to start installation, and allow the app to make changes to your device.
###### Select the installation language.

## Part 1: Ingesting the Data
Load the Dataset: Begin by importing your dataset of tweets into R. TSV file that can be read by R using Tidyverse.

Data Structuring: Organize the data into a data frame or a suitable data structure that allows easy querying. Ensure that each column corresponds to the features you've listed (e.g., text, created_at, author_id, like_count, place_id, etc.).

Data Cleaning: Check for missing or inconsistent data and clean it as necessary. This may involve removing NA values, correcting data types, and ensuring that timestamps are in a consistent format.

## Part 2: Querying the Data
Search Functionality: Implement a function that allows you to input a search term (e.g., "music"). This function will filter the dataset to include only those tweets that contain the specified term.

Daily Tweet Counts: Within the search function, calculate the number of tweets that contain the term for each day. This involves grouping the data by date and counting the occurrences.

Unique Users: Determine how many unique users posted tweets containing the term by counting distinct author_ids in the filtered dataset.

Average Likes: Compute the average number of likes for the tweets that contain the term. This requires summing the like_count for the filtered tweets and dividing by the total number of tweets.

Location Analysis: Extract the place IDs from the filtered tweets to see where they originated. You can summarize this to get counts of tweets from each unique place ID.

Time of Day: Analyze the timestamps to extract the time of day when the tweets were posted. You can categorize these into different time intervals (e.g., morning, afternoon, evening) or simply list the times.

Most Active User: Identify which user posted the most tweets containing the term by counting the occurrences of each author_id in the filtered dataset and finding the maximum.
