class Data{
  
  private String filepath;
  private ArrayList<String> elements = new ArrayList<String>();
  
  
  void Data(String filepath){
    this.filepath = filepath;
  }
  
  void loadData(){
    String[] lines;
    String[] line;
    lines = loadStrings(filepath);
    
    for(int i=0; i<lines.length; i++){
      line = split(lines[i], ",");
      elements.add(line);
    }
  
}
