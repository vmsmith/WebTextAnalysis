# Inspired by https://github.com/notesofdabbler
library(rvest)
library(tidyr)

page <- read_html("http://www.zillow.com/homes/for_sale/norfolk-va/")
page

houses <- page %>%
  html_nodes(".photo-cards li article")

houses

z_id <- houses %>% html_attr("id")
z_id

address <- houses %>%
  html_node(".zsg-photo-card-address") %>%
  html_text()
address


price <- houses %>%
  html_node(".zsg-photo-card-price") %>%
  html_text() %>%
  readr::parse_number()
price

params <- houses %>%
  html_node(".zsg-photo-card-info") %>%
  html_text() %>%
  strsplit("\u00b7")
params

beds <- params %>% purrr::map_chr(1) %>% readr::parse_number()
baths <- params %>% purrr::map_chr(2) %>% readr::parse_number()
house_area <- params %>% purrr::map_chr(3) %>% readr::parse_number()

beds
params
price
