pollutantmean <- function(directory, pollutant, id = 1:332){
  #   Read the files in directory
  files_list <- list.files(directory, full.names=TRUE)
  
  #   Collect the files into readable dataframe
  observation <- data.frame()
  for(i in id){
      # Loop the files on id and bind them together
      observation <- rbind(observation, read.csv(files_list[i]))
  }
    
  pollutant_observation <- observation[,pollutant]
  
  mean(pollutant_observation, na.rm=TRUE)
  

}