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

books <- test1 %>% html_nodes("bookstore book title")
          
test1 %>% html_nodes(xpath = "//bookstore//book//title")

html_text(books)
