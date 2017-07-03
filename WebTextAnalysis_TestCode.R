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
test1 <- read_html("1_Data/test1.html")
test1

# Simple node extraction --------------------------------------------------

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


music <- test1 %>% html_nodes("table#music")
music
music <- test1 %>% html_nodes("table#music tr")
music
music <- test1 %>% html_nodes("table#music tr td")
music

# Extracting tables into data frames --------------------------------------

test1 %>%
  html_node("table#music") %>%
  html_table(header = NA)


