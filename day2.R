library(tidyverse)
mdata <- read.csv('data/pfpr_intvn.csv')

pfpr_data <- select(mdata, -itn_coverage, -county)
                    
pfpr_data_first <- mdata |> select(-itn_coverage, -county)

filtered_data <- mdata |> filter(county %in% c('Baringo', 'Bomet'))


# Assignment

new_filtered_data <- mdata |> filter(county == 'Nairobi' | county == 'Kisumu')


# mutate function

transformed_data <- mdata |> mutate(pfpr_percent = pfpr*100, itn_percent = itn_coverage*100)

# mutate function to modifiy a columns
modified_data <- mdata |> mutate(pfpr = round(pfpr, 3))

# group by functiob 

grouped_average <- mdata |> group_by(county) |>
  summarise(average_pfpr = mean(pfpr))

