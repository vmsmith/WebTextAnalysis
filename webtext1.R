
# Set up the environment --------------------------------------------------

library(rvest)
library(magrittr)
library(selectr)

# Read in the page --------------------------------------------------------

webtext1 <- read_html("1_Data/webtext1.html")
webtext1

# Examine the nodes

wt1nodes <- webtext1 %>% html_nodes("h1")
wt1nodes

wt1nodes <- webtext1 %>% html_nodes("h2")
wt1nodes

wt1nodes <- webtext1 %>% html_nodes("p")
wt1nodes

wt1nodes <- webtext1 %>% html_nodes("table")
wt1nodes

# Isolate level 1 nodes ---------------------------------------------------

wt1nodes <- webtext1 %>% html_nodes("h2")
wt1nodes

wt1nodes[1]
wt1nodes[1:3]
wt1nodes[c(1, 4)]

# Extract text ------------------------------------------------------------

wt1nodes <- webtext1 %>% html_nodes("p")
wt1nodes

html_text(wt1nodes[1])

# Extracting from tables --------------------------------------------------

wt1nodes <- webtext1 %>% html_nodes("table")
wt1nodes

wt1nodes[[1]]
wt1nodes[[2]]


# Extracting from tables into data frames

wt1nodes[[2]] %>% html_table(header = NA)





