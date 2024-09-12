DiurnalMed <- function(df, TimeColumn){
  # Convert time & create hourly bins
  df[,TimeColumn] <- diurnals::char_to_time(df[,TimeColumn])
  df$Hour <- substr(df[,TimeColumn], 12, 13)

  # Delete time column
  df <- df[,!names(df) %in% c(TimeColumn)]
  
  # Convert character columns to numeric
  df <- convert_char_to_numeric(df)
  
  # Median of each bin
  df_med <- aggregate(df, by = list(df$Hour), FUN = median, na.rm = TRUE)
  df_med <- df_med[,!names(df_med) %in% c("Hour")] # Delete Hour column filled with NA
  colnames(df_med)[1] <- "Hour"

  # Standard deviation of each bin
  df_med_sd <- aggregate(df, by = list(df$Hour), FUN = sd, na.rm = TRUE)
  df_med_sd <- df_med_sd[,!names(df_med_sd) %in% c("Hour")] # Delete Hour column filled with NA
  columns <- colnames(df_med) # need to change names for merge
  new_columns <- paste(columns, "_sd", sep = "")
  colnames(df_med_sd) <- new_columns
  colnames(df_med_sd)[1] <- "Hour"

  # Count number of points in each bin
  df_med_count <- aggregate(df, by = list(df$Hour), FUN = length)
  df_med_count <- df_med_count[,!names(df_med_count) %in% c("Hour")] # Delete Hour column filled with NA
  columns_count <- colnames(df_med) # need to change names for merge
  new_columns_count <- paste(columns_count, "_count", sep = "")
  colnames(df_med_count) <- new_columns_count
  colnames(df_med_count)[1] <- "Hour"

  # Merge data frames
  df_list <- list(df_med, df_med_sd, df_med_count)
  df_tot <- Reduce(function(x, y) merge(x, y, all = TRUE), df_list)
  for (i in 0:23){
    df_tot$Hour[i] <- i # Change 00, 01, 02 etc to 0, 1, 2 etc
  }
  df_tot
}
