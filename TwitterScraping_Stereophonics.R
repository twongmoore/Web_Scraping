library(tidyverse)
library(rtweet)

tweets <- search_tweets(q = "Stereophonics", n = 2000, 
                        include_rts = FALSE, 
                        retryonratelimit = TRUE)

small_tweets <- tweets %>% 
  separate(col = created_at, into = c("date", "time"), 
           sep = " ") %>%
  select(screen_name, date, time, text, 
         coords_coords, bbox_coords, geo_coords)

ggplot(small_tweets, aes (x = date)) + 
  geom_bar(fill = "black") + 
  labs(x = "Date", y = "Number of Tweets") + 
  theme(axis.text.x = element_text(angle = 30, hjust = 1)) +
  labs(title = paste("Tweets Mentioning Stereophonics Scraped On", Sys.Date()),
       subtitle = "Using Mike Kearney's rtweet package") 