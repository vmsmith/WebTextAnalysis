# https://stackoverflow.com/questions/36683510/r-web-scraping-across-multiple-pages

library(rvest)
       
homes <- lapply(paste0("https://www.zillow.com/homes/for_sale/Norfolk-VA/fsba,fsbo,fore,cmsn_lt/pmf,pf_pt/6210_rid/globalrelevanceex_sort/37.033391,-76.086846,36.756627,-76.435318_rect/11_zm/", 1:10, "_p/"),
            function(url){
              url %>% read_html() %>% 
                html_nodes(".photo-cards li article") %>% 
                html_text()
            })

homes
