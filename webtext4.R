# Set up the environment --------------------------------------------------

library(rvest)
library(magrittr)
library(selectr)

# Read in the page --------------------------------------------------------

webtext4 <- read_html("1_Data/webtext4.html")
webtext4

# Select by <div class=" "> ----------------------------------------------------

wt4nodes <- webtext4 %>% html_nodes(".music")
wt4nodes[[1]]

wt4nodes <- webtext4 %>% html_nodes(".music #music_table")
wt4nodes
wt4nodes[[1]]

wt4nodes <- webtext4 %>% html_nodes(".music #music_table .british")
wt4nodes
wt4nodes[[2]]

wt4nodes <- webtext4 %>% html_nodes(".music #music_table .american td")
wt4nodes

html_text(wt4nodes[c(1:5)])
html_text(wt4nodes[c(1, 6)])

# Select by <span class=" "> ----------------------------------------------------

wt4nodes <- webtext4 %>% html_nodes("h2 p .concepts")
wt4nodes

wt4nodes <- webtext4 %>% html_nodes(".music #music_table")
wt4nodes
wt4nodes[[1]]

wt4nodes <- webtext4 %>% html_nodes(".music #music_table .british")
wt4nodes
wt4nodes[[2]]

wt4nodes <- webtext4 %>% html_nodes(".music #music_table .american td")
wt4nodes

html_text(wt4nodes[c(1:5)])
html_text(wt4nodes[c(1, 6)])

# Exercise ----------------------------------------------------------------

# Extract all the titles from the book table
# Extract all the information about "Everyday Italian