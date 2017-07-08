# Set up the environment --------------------------------------------------

library(rvest)
library(magrittr)
library(selectr)

# Read in the page --------------------------------------------------------

webtext3 <- read_html("1_Data/webtext3.html")
webtext3

# Select by "class" ----------------------------------------------------

wt3nodes <- webtext3 %>% html_nodes("#music_table")
wt3nodes[[1]]

wt3nodes <- webtext3 %>% html_nodes("#music_table .american")
wt3nodes
wt3nodes[[1]]

wt3nodes <- webtext3 %>% html_nodes("#music_table .british")
wt3nodes
wt3nodes[[2]]

wt3nodes <- webtext3 %>% html_nodes("#music_table .american td")
wt3nodes

html_text(wt3nodes[c(1:5)])
html_text(wt3nodes[c(1, 6)])

# Exercise ----------------------------------------------------------------

# Extract all the titles from the book table
# Extract all the information about "Everyday Italian