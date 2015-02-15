library(plyr)


# Niet nodig! Wel leerzaam.
extract_source <- function(file_name) {
  md <- regexpr("[[:digit:]]{3}", file_name)
  as.numeric(regmatches(file_name, md))
}


# Niet nodig! Wel leerzaam.
read_file <- function(file_name) {
  result <- read.csv(file_name)
  result$monitor_id = extract_source(file_name)
  result
}

read_files <- function() {
  files <- list.files("datasciencecoursera//R programming/specdata/", pattern="*.csv", full=TRUE)
  result <- ldply(files, read.csv)
  
  # na.omit(result)
  result
}

rows_by_monitors <- function(monitor_ids) {
  data[data$ID %in% monitor_ids, ]
}


