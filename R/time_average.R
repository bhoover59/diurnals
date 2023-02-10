time_average <- function(df, interval, time_column){
  # Convert time_column to POSIXct
  df[, time_column] <- diurnals::char_to_time(df[, time_column])
  
  # Create a label for the time interval
  label <- "min"
  
  # Create the time break
  TimeBreak <- paste(interval, label)
  
  # Cut the time into intervals
  df$TimeBreak <- cut.POSIXt(df[, time_column], breaks = TimeBreak)
  
  # Calculate the mean of each interval
  df_agg <- aggregate(df, by = list(df$TimeBreak), FUN = mean, na.rm = TRUE)
  
  # Convert the group back to POSIXct format
  df_agg$Time <- as.POSIXct(as.character(df_agg$Group.1), format = "%m/%d/%Y %H:%M")
  
  df_agg <- df_agg[,!names(df_agg) %in% c(TimeColumn)]
  colnames(df_agg)[1] <- "Time"
  
  # Return the aggregated data frame
  return(df_agg)
}
