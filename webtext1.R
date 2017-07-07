
# Set up the environment --------------------------------------------------

library(rvest)
library(magrittr)
library(selectr)

# Read in the page --------------------------------------------------------

webtext1 <- read_html("1_Data/webtext1.html")
webtext1

head <- webtext1 %>% html_nodes("head")
head
head[[1]]

body <- webtext1 %>% html_nodes("body")
body
body[[1]]

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

str(wt1nodes)

wt1nodes[[1]]
wt1nodes[1]

wt1nodes[1:3]
wt1nodes[c(1, 4)]

# Exercise ----------------------------------------------------------------

                          # Isolate the paragraphs

# Extract text ------------------------------------------------------------

wt1nodes <- webtext1 %>% html_nodes("h2")
wt1nodes

html_text(wt1nodes)

html_text(wt1nodes[[1]])
html_text(wt1nodes[1])

# Exercise ----------------------------------------------------------------

                  # Extract the text from the paragraphs


# Extracting from tables --------------------------------------------------

wt1nodes <- webtext1 %>% html_nodes("table")
wt1nodes

wt1nodes[[1]]
wt1nodes[1]

wt1nodes[[2]]
wt1nodes[2]

wt1nodes <- webtext1 %>% html_nodes("table tr")

html_text(wt1nodes[21:24])
html_text(wt1nodes)

wt1nodes <- webtext1 %>% html_nodes("table tr td")


# Extracting from tables into data frames

wt1nodes <- webtext1 %>% html_nodes("table")
table2_df <- wt1nodes[[2]] %>% html_table(header = NA)
table2_df




