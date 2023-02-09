Diurnal <- function(df, TimeColumn){
  # Convert time & create hourly bins
  df[,TimeColumn] <- diurnals::char_to_time(df[,TimeColumn])
  df$Hour <- substr(df[,TimeColumn], 12, 13) # specific to this time format
  
  # Delete time column
  df <- df[,!names(df) %in% c(TimeColumn)]
  
  # Mean of each bin
  df_avg <- aggregate(df, by = list(df$Hour), FUN = mean, na.rm = TRUE)
  df_avg <- df_avg[,!names(df_avg) %in% c("Hour")] # Delete Hour column filled with NA
  colnames(df_avg)[1] <- "Hour" # rename Group.1 to Hour
  
  # Standard deviation of each bin
  df_sd <- aggregate(df, by = list(df$Hour), FUN = sd, na.rm = TRUE)
  df_sd <- df_sd[,!names(df_sd) %in% c("Hour")] # Delete Hour column filled with NA
  columns <- colnames(df_avg) # need to change names for merge
  new_columns <- paste(columns, "_sd", sep = "")
  colnames(df_sd) <- new_columns
  colnames(df_sd)[1] <- "Hour"
  
  # Count number of points in each bin
  df_count <- aggregate(df, by = list(df$Hour), FUN = length)
  df_count <- df_count[,!names(df_count) %in% c("Hour")] # Delete Hour column filled with NA
  columns_count <- colnames(df_avg) # need to change names for merge
  new_columns_count <- paste(columns_count, "_count", sep = "")
  colnames(df_count) <- new_columns_count
  colnames(df_count)[1] <- "Hour"
  
  # Median of each bin
  df_med <- aggregate(df, by = list(df$Hour), FUN = median, na.rm = TRUE)
  df_med <- df_med[,!names(df_med) %in% c("Hour")] # Delete Hour column filled with NA
  columns_med <- colnames(df_avg) # need to change names for merge
  new_columns_med <- paste(columns_med, "_med", sep = "")
  colnames(df_med) <- new_columns_med
  colnames(df_med)[1] <- "Hour"
  
  # Merge data frames
  df_list <- list(df_avg, df_sd, df_count, df_med)
  df_tot <- Reduce(function(x, y) merge(x, y, all = TRUE), df_list)

    for (i in 0:9){
    df_tot$Hour[i + 1] <- i # Change 00, 01, 02 etc to 0, 1, 2 etc
  }
  df_tot
}
