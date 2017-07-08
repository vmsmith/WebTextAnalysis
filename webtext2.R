# Set up the environment --------------------------------------------------

library(rvest)
library(magrittr)
library(selectr)

# Read in the page --------------------------------------------------------

webtext2 <- read_html("1_Data/webtext2.html")
webtext2

# Select by "id" ----------------------------------------------------

wt2nodes <- webtext2 %>% html_nodes("#music_table")
wt2nodes[[1]]

wt2nodes <- webtext2 %>% html_nodes("#music_table tr")
wt2nodes
wt2nodes[[1]]

wt2nodes <- webtext2 %>% html_nodes("#music_table tr")
wt2nodes
wt2nodes[[2]]

wt2nodes <- webtext2 %>% html_nodes("#music_table .american td")
wt2nodes

html_text(wt2nodes[c(1:5)])
html_text(wt2nodes[c(1, 6)])

# Exercise ----------------------------------------------------------------

                # Extract all the titles from the book table
                # Extract all the information about "Everyday Italian