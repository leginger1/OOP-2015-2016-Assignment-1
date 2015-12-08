//importing libraries
import controlP5.*;//ControlP5 if for the interface
import java.util.*;

ArrayList<Element> elements = new ArrayList<Element>();//Arraylist to hold all of the elements
String[] lines;//Holds the lines of data to be put into the element class

boolean[] selectedElem;//Aray to be passed to graph to tell which elements to display

int gType;//Variable for deciding which graph to show

//Enum for element attributes
enum att { 
    ATOMNUM, //Atomic number
    ISOTOPES, //Isotopes
    YEARDISC, //Year of Discovery
    ATOMWEIG, //Atomic Weight
    IONICRAD, //Ionic Radius
    ATOMRAD, //Atomic Radius
    ELECTRONEG, //Electronegativity
    FIONPOT, //First Ionization Potential
    DENSITY, //Density
    MELTPOINT, //Melting Point
    BOILPOINT, //Boiling Point
    HEATCAP //Heat Capacity
};

//cp5 and inter for the interface
ControlP5 cp5;
Interface inter;

Graph graph;//graph object for drawing graphs

Data data;//data for reading in data

att attr;//Attribute variable for holding which atribute to be displayed

void setup() {
  size(900, 500);//setting size of screen
  int x = 200;//X for drawing graph
  int y = 0;//Y for drawing graph
  int gType = 0;//variable for which graph to display
  
  attr = att.ATOMNUM;//Setting atomic number as default attribute to graph
  
  selectedElem = new boolean[118];//boolean arry of which selected
  resetElem();//Setting all selected elemenets

  cp5 = new ControlP5(this);//Doing controlp5 thing not sure why

  data = new Data("perodictabledata.csv");//Setting data load file
  lines = data.loadData();//Loading in data

  //Adding elements to the arraylist
  for (int i=0; i<lines.length; i++) {
    elements.add(new Element(lines[i]));
  }

  inter = new Interface(0, 0, 200, height);//Initilising interface
  inter.display();//Displaying interface
  
  graph = new Graph(elements, x, y, height - y, width - x, 20);//Initlilising graph  
}

void draw() {
  
  background(0);//Setting background
  
  //Deciding which graph to display
  if(gType == 0){
    
    //Drawig histogram
    graph.drawHist(attr);
    textAlign(CENTER);
    textSize(10);
    //Text to say which graph
    text("The Periodic Table - Histogram", 550, 15);
    
  }else if(gType == 1){
    
    //Drawing bubble graph
    graph.drawBubble(attr);
    textAlign(CENTER);
    textSize(10);
    //Text to say which graph
    text("The Periodic Table - Bubble Graph", 550, 15);
    
  }
  
  //Sending which elements to display on graph 
  graph.selectElems(selectedElem);
  
}


//Setting all the selected elements to false
void resetElem(){
  for (int i = 0; i < 118; i++) {
    selectedElem[i] = false;
  }
}

//Control thing for controlp5 dont understand it works though
void controlEvent(ControlEvent theEvent) {
  
  //Checking which button was pressed
  switch(theEvent.getController().getId()) {
    case (0): {
      //Setting histogram
      gType = 0;
      break;
    }
    case (1): {
      //Setting bubblegraph
      gType = 1;
      break;
    } 
    case (2): {
      //Reseting selected elem
      resetElem();
      for(int i=0; i < selectedElem.length; i++){
        CColor c = new CColor();
        cp5.get(ScrollableList.class, "Elements").getItem(i).put("color", c);
      }
      break;
    }
  default: {
      break;
    }
  }
}

//Thing for ELements dropdown dont understand it
public void Elements(int n) {
  CColor c = new CColor();
  cp5.get(ScrollableList.class, "Elements").getItem(n);
  if (selectedElem[n]) {
    selectedElem[n] = false;
    cp5.get(ScrollableList.class, "Elements").getItem(n).put("color", c);
  } else {
    selectedElem[n] = true;
    c.setBackground(color(255,0,0));
    cp5.get(ScrollableList.class, "Elements").getItem(n).put("color", c);
  }
  cp5.get(ScrollableList.class, "Elements").getItem(n);
}

//Thing for attributes drop down dont understand it
public void Attributes(int n){
  CColor c = new CColor();
  cp5.get(ScrollableList.class, "Attributes").getItem(n);
  
  switch(n){
    case 0:{
      attr = att.ATOMNUM;
      break;
    }
    case 1:{
      attr = att.ISOTOPES;
      break;
    }
    case 2:{
      attr = att.YEARDISC;
      break;
    }
    case 3:{
      attr = att.ATOMWEIG;
      break;
    }
    case 4:{
      attr = att.ATOMRAD;
      break;
    }
    case 5:{
      attr = att.IONICRAD;
      break;
    }
    case 6:{
      attr = att.ELECTRONEG;
      break;
    }
    case 7:{
      attr = att.FIONPOT;
      break;
    }
    case 8:{
      attr = att.DENSITY;
      break;
    }
    case 9:{
      attr = att.MELTPOINT;
      break;
    }
    case 10:{
      attr = att.BOILPOINT;
      break;
    }
    case 11:{
      attr = att.HEATCAP;
      break;
    }
    default:{
       break; 
    }
  }
}