class Data{
  //Filepath for the csv file
  private String filepath;
  
  //Arraylist for storing the data in string form
  private ArrayList<ELement> elements = new ArrayList<Element>();
  
  /*
    Constructor
  */
  Data(String filepath){
    this.filepath = filepath;
  }
  
  /*
    Function for putting each element of the string array into the arraylist
  */
  private ArrayList<ELement> loadData(){
    //Loading data in from the csv file
    String[] lines = loadStrings(filepath);
    
    //Adding elements to the arraylist
    for(int i=0; i<lines.length; i++){
      elements.add(new Element(lines[i]));
    }
    
    //Returning the arraylist
    return elements;
  }
  
}
