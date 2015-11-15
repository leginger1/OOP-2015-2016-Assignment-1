class Data{
  //Filepath for the csv file
  private String filepath;
  
  /*
    Constructor
  */
  Data(String filepath){
    this.filepath = filepath;
  }
  
  /*
    Loading data into strings and returning it
  */
  private String[] loadData(){
    //Loading data in from the csv file
    String[] lines = loadStrings(filepath);
    
    //Returning the arraylist
    return lines;
  } 
}
