Diurnal <- function(df, time_column) {
  # Ensure the time column is in the correct datetime format
  df[[time_column]] <- mdy_hm(df[[time_column]])
  
  # Extract the hour from the datetime
  df$hour <- hour(df[[time_column]])
  
  # Remove the time column from the dataframe to focus on numeric columns
  df_numeric <- df %>% select(-all_of(time_column))
  
  # Group by hour and calculate mean, median, std deviation, and count for each hour for all columns
  diurnal_stats <- df_numeric %>%
    group_by(hour) %>%
    summarise(
      across(everything(), list(
        mean = ~ mean(.x, na.rm = TRUE),
        median = ~ median(.x, na.rm = TRUE),
        sd = ~ sd(.x, na.rm = TRUE)
      ), .names = "{col}_{fn}"),
      count = n()
    )
  
  return(diurnal_stats)
}
