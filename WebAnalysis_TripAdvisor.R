# ^\s*# TODO:

# Prepare the R environment -----------------------------------------------

rm(list = ls())

#install.packages("dplyr")
#install.packages("foreign")
#install.packages("ggplot2")
#install.packages("httr")
#install.packages("stringr")

library(dplyr)
library(foreign)
library(ggplot2)
library(httr)
library(rvest)
library(stringr)

# Hadley Wickham's code ---------------------------------------------------

# Inspired by
# http://notesofdabbler.github.io/201408_hotelReview/scrapeTripAdvisor.html

url <- "http://www.tripadvisor.com/Hotel_Review-g37209-d1762915-Reviews-JW_Marriott_Indianapolis-Indianapolis_Indiana.html"

reviews <- url %>%
  read_html() %>%
  html_nodes("#REVIEWS .innerBubble")

reviews[1]

id <- reviews %>%
  html_node(".quote a") %>%
  html_attr("id")

id

quote <- reviews %>%
  html_node(".quote span") %>%
  html_text()

quote

rating <- reviews %>%
  html_node(".rating .rating_s_fill") %>%
  html_attr("alt") %>%
  gsub(" of 5 stars", "", .) %>%
  as.integer()

rating 

date <- reviews %>%
  html_node(".rating .ratingDate") %>%
  html_attr("title") %>%
  strptime("%b %d, %Y") %>%
  as.POSIXct()

date

review <- reviews %>%
  html_node(".entry .partial_entry") %>%
  html_text()

review

data.frame(id, quote, rating, date, review, stringsAsFactors = FALSE) %>% View()
