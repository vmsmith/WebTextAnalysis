# Set up the environment --------------------------------------------------

library(rvest)
library(magrittr)
library(selectr)

# Read in the page --------------------------------------------------------

webtext5 <- read_html("1_Data/webtext5.html")
webtext5

# Create a data frame with html_table> ----------------------------------------------------

wt5nodes_df <- webtext5 %>% html_nodes(".music #music_table") %>% html_table(header = NA)
wt5nodes_df

# Create a data frame from disparate elements

url <- "1_Data/webtext5.html"

reviews <- read_html(url) %>% html_nodes("#reviews .innerDiv")

quote <- reviews %>%
  html_node(".summary") %>%
  html_text()

rating <- reviews %>%
  html_node(".rating") %>%
  html_text() %>%
  gsub(" stars", "", .) %>%
  as.integer()

date <- reviews %>%
  html_node(".reviewDate") %>%
  html_text() %>%
  strptime("%b %d, %Y") %>%
  as.POSIXct()

review <- reviews %>%
  html_node(".text") %>%
  html_text()

data.frame(quote, rating, date, review, stringsAsFactors = FALSE) %>% View()



# Exercise ----------------------------------------------------------------

# Extract all the titles from the book table
# Extract all the information about "Everyday Italian