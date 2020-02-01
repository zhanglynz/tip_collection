# created date: 24 sept. 2018
# another solution to the problem "Using a Column as a Column Index"
# https://www.r-bloggers.com/using-a-column-as-a-column-index/

library(dplyr)

df <- data.frame(x = c(1, 2, 3, 4),
                 y = c(5, 6, 7, 8),
                 choice = c("x", "y", "x", "z"),
                 stringsAsFactors = FALSE)

derived_df <-
  df %>% 
  mutate(c_no = case_when(choice == "x" ~ 1,
                          choice == "y" ~ 2,
                          TRUE ~ 0)) %>% 
  mutate(row_no = row_number()) %>% 
  mutate(derived = ifelse(c_no != 0, 
                     df[, 1:2][matrix(c(temp_df$row_no, temp_df$c_no), ncol = 2)], 
                     NA)) %>% 
  select(-c(c_no, row_no))
  
  
