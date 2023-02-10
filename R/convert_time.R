convert_time <- function(TimeX){
  if(inherits(TimeX, "POSIXct")){
    TimeX <- TimeX
  } else {
    formats = c("%m/%d/%Y %H:%M:%S", "%m/%d/%Y %I:%M:%S %p", "%Y-%m-%d %H:%M:%S", "%m/%d/%Y %H:%M", "%m/%d/%Y", "%Y-%m-%d", "%H:%M:%S")
    for (i in 1:length(formats)){
      test = as.POSIXct(TimeX, format = formats[i])
      if (length(na.omit(test)) == length(test)) {
        TimeX = as.POSIXct(TimeX, format = formats[i])
        break
      } else if (i == length(formats)){
        stop("Could not find adequate format")
      }
    }
  }
  return(TimeX)
}
