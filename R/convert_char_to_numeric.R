convert_char_to_numeric <- function(df) {
  char_cols <- sapply(df, is.character)
  df[char_cols] <- lapply(df[char_cols], as.numeric)
  return(df)
}
