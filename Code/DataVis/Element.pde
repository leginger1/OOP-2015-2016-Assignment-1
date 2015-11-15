class Element{
  
  /*
    Element variables
  */
  private int atomNum;
  private int isotopes;
  private int yearDisc;
  
  private String elemName;
  private String elemSymb;
  private String phase;
  private String mSCrys;
  private String type;
  private String discover;
  
  private float atomWeig;
  private float ionicRad;
  private float atomRad;
  private float electroneg;
  private float fIonPot;
  private float density;
  private float meltPoint;
  private float boilPoint;
  private float heatCap;
  
  
  /*
    CONSTRUCTOR
  */
  Element(String line){
      String[] prop = split(line, ",");
      
      //Turning the strings into usable data
      for(int j=0; j<prop.length; j++){
        //Using switch statment to go tell which property is which
        switch(j){
          case 0:{ atomNum = parseInt(prop[j]); break;}
          case 1:{ elemName = prop[j]; break;}
          case 2:{ elemSymb = prop[j]; break;}
          case 3:{ atomWeig = parseFloat(prop[j]); break;}
          case 4:{ phase = prop[j]; break;}
          case 5:{ mSCrys = prop[j]; break;}
          case 6:{ type = prop[j]; break;}
          case 7:{ ionicRad = parseFloat(prop[j]); break;}
          case 8:{ atomRad = parseFloat(prop[j]); break;}
          case 9:{ electroneg = parseFloat(prop[j]); break;}
          case 10:{ fIonPot = parseFloat(prop[j]); break;}
          case 11:{ density = parseFloat(prop[j]); break;}
          case 12:{ meltPoint = parseFloat(prop[j]); break;}
          case 13:{ boilPoint = parseFloat(prop[j]); break;}
          case 14:{ isotopes = parseInt(prop[j]); break;}
          case 15:{ discover = prop[j]; break;}
          case 16:{ yearDisc = parseInt(prop[j]); break;}
          case 17:{ heatCap = parseFloat(prop[j]); break;}
          default:{ println("There was an error inserting data with property " + (j+1)); break;}
        }
      }
  } 
  
  /*
    Functions for returning element variables
  */
  
  //Returning the atomic number
  public int getAtomNum(){
     return atomNum; 
  }
  
  //Returning the number of isotopes
  public int getIsotopes(){
     return isotopes; 
  }
  
  //Returning the year of discovery
  public int getYearDisc(){
     return yearDisc; 
  }
  
  //Returning the element name
  public String getElemName(){
     return elemName; 
  }
  
  //Returning the element symbol
  public String getElemSymb(){
     return elemSymb; 
  }
  
  //Returning the element phase
  public String getPhase(){
     return phase; 
  }
  
  //Returning the most stable crystal
  public String getMSCrys(){
     return mSCrys; 
  }
  
  //Returning the type
  public String getType(){
     return type; 
  }
  
  //Returning the discoverer
  public String getDiscover(){
     return discover; 
  }
  
  //Retrurning the atomic weight
  public float getAtomWeig(){
     return atomWeig; 
  }
  
  //Returning the ionic radius
  public float getIonicRad(){
     return ionicRad; 
  }
  
  //Returning the atomic radius
  public float getAtomRad(){
     return atomRad; 
  }
  
  //Returning the electronegativity
  public float getElectroneg(){
     return electroneg; 
  }
  
  //returning the first ionization potential
  public float getFIonPot(){
     return fIonPot; 
  }
  
  //Returning the density
  public float getDensity(){
     return density; 
  }
  
  //Returning the melting point
  public float getMeltPoint(){
     return meltPoint; 
  }
  
  //Returning the boiling point
  public float getBoilPoint(){
     return boilPoint; 
  }
  
  //Returning the specific heat capacity
  public float getHeatCap(){
     return heatCap; 
  }
}
