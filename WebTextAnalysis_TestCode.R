library(rvest)
library(magrittr)
library(selectr)

# Text scraping web site
# http://bradleyboehmke.github.io/2015/12/scraping-html-text.html


# CSS selectors ----------------------------------------------

ateam <- read_html("http://www.boxofficemojo.com/movies/?id=ateam.htm")

html_nodes(ateam, "center")
html_nodes(ateam, "center font")
html_nodes(ateam, "center font b")

# Read in the page
test1 <- read_html("1_Data/webtext1.html")
test1

# Simple node extraction --------------------------------------------------

# In the absence of anything else, this looks for a tag <bookstore>, and then
# drills down from there

books <- test1 %>% html_nodes("bookstore")
books          
books <- test1 %>% html_nodes("bookstore book")
books
books <- test1 %>% html_nodes("bookstore book title")
books

books[1]


# Text extraction ---------------------------------------------------------

html_text(books)
html_text(books[3])

test1 %>% html_nodes("h2") %>%
  html_text()

# Identifying distinct nodes ----------------------------------------------

# Identify with "id="; this finds the table <table id="music"...>
music <- test1 %>% html_nodes("#music")
music

music <- test1 %>% html_nodes("#music tr")
music

music <- test1 %>% html_nodes("#music tr td")
music

html_text(music)
html_text(music)[1:5]

# Finds the div <div id="music_table> and then the element under it with tr and td
music <- test1 %>% html_nodes("#music_table")
music

music <- test1 %>% html_nodes("#music_table tr")
music

music <- test1 %>% html_nodes("#music_table tr td")
music

html_text(music)
html_text(music)[1:5]


# Extracting tables into data frames --------------------------------------

# With a table
test1 %>%
  html_node("#music") %>%
  html_table(header = NA)

# With xml - does not work; "table" is not true
test1 %>%
  html_node("bookstore") %>%
  html_table(header = NA)


