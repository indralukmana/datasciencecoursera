complete <- function(directory, id = 1:332){
  #   Read the files in directory
  files_list <- list.files(directory, full.names=TRUE)
  
  #   Collect the files into readable dataframe
#   observation <- data.frame()
   output <- data.frame(id = numeric(0), nobs= numeric(0))

  
  for(i in id){
    # read the file
    observation <- read.csv(files_list[i])
    
    complete <- observation[complete.cases(observation$nitrate, observation$sulfate),]
    
#     print(i)
#     print(nrow(complete))
    new_row <- c(i,nrow(complete))
#     rbind(output,new_row)      
#       nobs = nrow(complete)
#       print(data.frame(id,nobs))
#          print(output)
    df <- data.frame(id = i, nobs=nrow(complete))

output <- rbind(output,df)
  
  }


# col_headings <- c("id","nobs")
# names(output) <- col_headings
  print(output)
  print(sum(output$"nobs"))
#   
  

#   not_complete <- is.na(observation)
#   not_complete
  
#   pollutant_observation <- observation[,pollutant]
#   
#   mean(pollutant_observation, na.rm=TRUE)
  
  
}