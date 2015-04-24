corr <- function(directory, threshold = 0){
  files_list <- list.files(directory, full.names=TRUE)
  
  #   Collect the files into readable dataframe
  output <- data.frame(id = numeric(0), nobs= numeric(0))

  
  for(i in 1:332){
    # read the file
    observation <- read.csv(files_list[i])
    
    complete <- observation[complete.cases(observation$nitrate, observation$sulfate),]
#     print(complete)
    if(nrow(complete) < threshold){
      next
    }
    
    new_row <- c(i,nrow(complete))
    df <- data.frame(id = i, nobs=nrow(complete))
    
    output <- rbind(output,df)
  
  
  }
  
#   print(output)
  correlations <- numeric(0)  

  for(i in output$"id"){
    observation <- read.csv(files_list[i])
    complete <- observation[complete.cases(observation$nitrate, observation$sulfate),]
    
    x <- complete$"sulfate"
    y <- complete$"nitrate"
    
    result <- cor(x,y)
    correlations <- c(correlations,result)

  }
  return (correlations)
    
  
}