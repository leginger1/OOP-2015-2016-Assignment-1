class Graph{
  
   ArrayList<Element> elements;//Array list for storing elements
   int x, y, w, h, border;//X,Y Width and Border for graph
   int graphW, graphH;
   boolean[] selectedElems;
   int numElem;
  
  
  //Constructor
  Graph(ArrayList<Element> elements, int x, int y, int w, int h, int border){
    //Putting inserted elements into  variables
    this.elements = elements;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.border = border;
    
    //Ca;lculating width and height of graph
    graphW = width - x - (border*2);
    graphH = height - y - (border*2);
    
    //array to hold selected elements
    selectedElems = new boolean[118];
    
    //Number of elements selected
    numElem = 0;
  }
  
  //Drawing axis
  void drawAxis(int x, int y, int h, int w, int border, float biggest){ 
    textAlign(CENTER);
    line(x + border, height - border, width - border, height - border);
    line(x + border, height - border, x + border, border);
    
    line(x + border, border, x + border - 5, border);
    text(biggest, x + border - 25, border + 5);
    line(x + border, border + (graphH/2), x + border - 5, border + (graphH/2));
    text(biggest/2, x + border - 25, border + (graphH/2) + 5);
  }
  
  //Drawing histogram
  public void drawHist(att attribute){
    //Setting line color
    stroke(255);
    
    //Getting biggest value
    float biggest = getBiggest(attribute, selectedElems);
    //Drawing axis
    drawAxis(x,y,h,w,border,biggest);
    
    noStroke();
    
    numElem = 0;//Setting number of elements to one
    
    //Getting number of selected elements
    for(int i = 0; i < selectedElems.length; i++){
      if(selectedElems[i] == true){
        numElem++;
      }
    }
    
    int curElem = 0;//setting cur element to 0
    
    //Calculating bar widths and heights
    for(int i = 0; i < selectedElems.length; i++){
      if(selectedElems[i]){  
        //Bar width
         float barW = round((float)(graphW - ((numElem+1)*5)) / numElem);
         float barH = 0;
         
         //Checking if element has value in category
         if(map(getCurrent(attribute,i), 0, biggest, 0, graphH) > -1){
           //Setting bars appropiate height
           barH = round(map(getCurrent(attribute,i), 0, biggest, 0, graphH));
         }else{
            fill(255,0,0);
            //Setting full red bar if no value is given
            barH =  round(map(biggest, 0, biggest, 0, graphH));
         }
         
         //X and Y loacations of bars
         float xLoc = x + border + (barW*curElem) + (5*(curElem+1));
         float yLoc = height - barH - border;
         
         textAlign(CENTER);
         textSize(6);
         fill(255);
         //Numbers along bottom
         text(curElem+1, xLoc + (barW/2), height - (border/4));
         
         //Highlighting bar with hover
         if(mouseX > xLoc && mouseX < xLoc+barW && mouseY > yLoc && mouseY < yLoc + barH){
           fill(255,0,0);
           //Showing box with highlighted elements data
           rect(xLoc, yLoc , barW, barH);
           showData(i);
         }else{
           fill(255);
           rect(xLoc, yLoc , barW, barH);
         }
         //Incrementing current element
         curElem++;
      }
    }
  }
  
  //Bubble graph
  public void drawBubble(att attribute){
    stroke(255);
    fill(255);
    //Getting the biggest
    float biggest = getBiggest(attribute, selectedElems);
    //Drawing axis
    drawAxis(x,y,h,w,border,biggest);
    
    //Setting numelem to 0
    numElem = 0;
    
    //getting number of selected elements
    for(int i = 0; i < selectedElems.length; i++){
      if(selectedElems[i] == true){
        numElem++;
      }
    }
    
    int curElem = 0;//Setting current elem to 0
    
    //Drawing bubbles
    for(int i = 0; i < selectedElems.length; i++){
      if(selectedElems[i]){  
         float barW = round((float)(graphW - ((numElem+1)*5)) / numElem);
         float barH = 0;
         
         if(map(getCurrent(attribute,i), 0, biggest, 0, graphH) > -1){
           fill(255);
           barH = round(map(getCurrent(attribute,i), 0, biggest, 0, graphH));
         }else{
            fill(255,0,0);
            barH =  round(map(biggest, 0, biggest, 0, graphH));
         }
         
         float rad = 0.5*barH;
         float xLoc = (x + border + (barW*curElem) + (5*(curElem+1))) + (barW/2);
         float yLoc = height - barH - border;
         
         stroke(0);
         fill(255,255,255,125);
         ellipseMode(CENTER);
         ellipse(xLoc, yLoc, rad*2, rad*2);
         textAlign(CENTER);
         textSize(6);
         text(curElem+1, x + border + (barW*curElem) + (5*(curElem+1)) + (barW/2), height - (border/4));
         curElem++;
      }
    }
  }
  
  
  public void selectElems(boolean[] elem){
    selectedElems = elem;
  }
  
   void showData(int n){
     float w = -300, h = -250;
     int atomNum = elements.get(n).getAtomNum();
     int isotopes = elements.get(n).getIsotopes();
     int yearDisc = elements.get(n).getYearDisc();
    
     String elemName = elements.get(n).getElemName();
     String elemSymb = elements.get(n).getElemSymb();
     String phase = elements.get(n).getPhase();
     String mSCrys = elements.get(n).getMSCrys();
     String type = elements.get(n).getType();
     String discover = elements.get(n).getDiscover();
    
     float atomWeig = elements.get(n).getAtomWeig();
     float ionicRad = elements.get(n).getIonicRad();
     float atomRad = elements.get(n).getAtomRad();
     float electroneg = elements.get(n).getElectroneg();
     float fIonPot = elements.get(n).getFIonPot();
     float density = elements.get(n).getDensity();
     float meltPoint = elements.get(n).getMeltPoint();
     float boilPoint = elements.get(n).getBoilPoint();
     float heatCap = elements.get(n).getHeatCap();
     
     stroke(255);
     fill(0);
     rect(mouseX, mouseY, w, h);
     fill(255);
     textSize(10);
     textAlign(LEFT);
     text(elemName + " (" + elemSymb + ")", (mouseX + w) + 100,(mouseY + h) + 15);
     text("Atomic Number: " + atomNum, (mouseX + w) + 10,(mouseY + h) + 30);
     text("Atomic Weight: " + atomWeig + " u/Da", (mouseX + w) + 10,( mouseY + h) + 45);
     text("Atomic Radius: " + atomRad + " Å", (mouseX + w) + 10,( mouseY + h) + 60);
     text("Ionic Radius: " + ionicRad + " Å", (mouseX + w) + 10,( mouseY + h) + 75);
     text("Phase: " + phase, (mouseX + w) + 10,( mouseY + h) + 90);
     text("Most Stable Crystal: " + mSCrys, (mouseX + w) + 10,( mouseY + h) + 105);
     text("First Ionization Potential: " + fIonPot + " e/V", (mouseX + w) + 10,( mouseY + h) + 120);
     text("Type: " + type, (mouseX + w) + 10,( mouseY + h) + 135);
     text("Electronegativity: " + electroneg, (mouseX + w) + 10,( mouseY + h) + 150);
     text("Density: " + density + " Kg/m^3", (mouseX + w) + 10,( mouseY + h) + 165);
     text("Melting Point: " + meltPoint + " K", (mouseX + w) + 10,( mouseY + h) + 180);
     text("Boiling Point: " + boilPoint + " K", (mouseX + w) + 10,( mouseY + h) + 195);
     text("Isotopes: " + isotopes, (mouseX + w) + 10,( mouseY + h) + 210);
     text("Heat Capacity: " + heatCap + " J/K", (mouseX + w) + 10,( mouseY + h) + 225);
     text("Discoverer: " + discover + " in " + yearDisc, (mouseX + w) + 10,(mouseY + h) + 240);
  }
  
  
  //Getting the biggest value of selected elements in a category
  public float getBiggest(att attribute, boolean[] selectedElems){
    
    float biggest = 0;
    float current = 0;
    
    for(int i = 0; i < selectedElems.length; i++){
      if(selectedElems[i] == true){
        switch(attribute){
          
          case ATOMNUM:{
            current = elements.get(i).getAtomNum();
            if(current > biggest){
              biggest = current; 
            }
            break;
          }
          
          case ISOTOPES:{
            current = elements.get(i).getIsotopes();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          case YEARDISC:{
            current = elements.get(i).getYearDisc();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          case ATOMWEIG:{
            current = elements.get(i).getAtomWeig();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          case IONICRAD:{
            current = elements.get(i).getIonicRad();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          case ATOMRAD:{
            current = elements.get(i).getAtomRad();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          case ELECTRONEG:{
            current = elements.get(i).getElectroneg();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          case FIONPOT:{
            current = elements.get(i).getFIonPot();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          case DENSITY:{
            current = elements.get(i).getDensity();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          case MELTPOINT:{
            current = elements.get(i).getMeltPoint();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          case BOILPOINT:{
            current = elements.get(i).getBoilPoint();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          case HEATCAP:{
            current = elements.get(i).getHeatCap();
            if(current > biggest){
              biggest = current; 
            }
            break;  
          }
          default:{
            break; 
          }
        };
      }
    }
    return biggest;
  }



  //Getting the value of the currently selected element in a given category
  public float getCurrent(att attribute, int i){
    switch(attribute){
      case ATOMNUM:{
        return elements.get(i).getAtomNum();
      }   
      case ISOTOPES:{
        return elements.get(i).getIsotopes();
      }
      case YEARDISC:{
        return elements.get(i).getYearDisc();
      }
      case ATOMWEIG:{
        return elements.get(i).getAtomWeig();
      }
      case IONICRAD:{
        return elements.get(i).getIonicRad();
      }
      case ATOMRAD:{
        return elements.get(i).getAtomRad();
      }
      case ELECTRONEG:{
        return elements.get(i).getElectroneg();
      }
      case FIONPOT:{
        return elements.get(i).getFIonPot(); 
      }
      case DENSITY:{
        return elements.get(i).getDensity();
      }
      case MELTPOINT:{
        return elements.get(i).getMeltPoint();
      }
      case BOILPOINT:{
        return elements.get(i).getBoilPoint();  
      }
      case HEATCAP:{
        return elements.get(i).getHeatCap();
      }
      default:{
        break;
      }
    };
    return 0;
  }
}