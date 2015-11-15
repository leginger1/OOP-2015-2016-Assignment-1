ArrayList<Element> elements = new ArrayList<Element>();

Graph graph;

String[] lines;

Data data = new Data("perodictabledata.csv");

void setup(){
  
  size(700,700);
  
  
  //Loading in the data and putting it all in a string array
  lines = data.loadData();
  
  //Adding elements to the arraylist
  for(int i=0; i<lines.length; i++){
    elements.add(new Element(lines[i]));
  }
  
  //Initilising and sending data to graph class
  graph = new Graph(elements);
}


void draw(){
  
}
