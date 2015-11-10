class Data{
  //Total number of elements
  final private int elements = 118;
  
  /*
    Not sure of this is the best way to store the data
  */
  private int[] atomNum = new int[elements];
  private int[] isotopes = new int[elements];
  private int[] yearDisc = new String[elements];
  
  private String[] elemName = new String[elements];
  private String[] elemSymb = new String[elements];
  private String[] phase = new String[elemeents];
  private String[] mSCrys = new String[elements];
  private String[] type = new String[elements];
  private String[] discover = new String[elements];
  
  private float[] atomWeig = new float[elements];
  private float[] ionicRad = new float[elements];
  private float[] atomRad = new float[elements];
  private float[] electroneg = new float[elements];
  private float[] fIonPot = new float[elements];
  private float[] density = new float[elements];
  private float[] meltPoint = new float[elements];
  private float[] boilPoint = new float[elements];
  private float[] heatCap = new float[elements];
  
  
  void Data(String filepath){
    this.filepath = filepath;
  }
  
  void loadData(String filepath){
    String[] lines;
    String[] line;
    lines = loadStrings(filepath);
    
    for(int i=0; i<lines.length; i++){
      line = split(lines[i], ",");
      
      for(int j=0; i<line; i++){
        
        switch(j){
          case 1:{ atomNum[i] = parseInt(line[j]); break;}
          case 2:{ elemName[i] = line[j]; break;}
          case 3:{ elemSymb[i] = line[j]; break;}
          case 4:{ atomWeig[i] = line[j]; break;}
          case 5:{ phase[i] = line[j]; break;}
          case 6:{ mSCrys[i] = line[j]; break;}
          case 7:{ type[i] = line[j]; break;}
          case 8:{ ionicRad[i] = line[j]; break;}
          case 9:{ atomRad[i] = line[j]; break;}
          case 10:{ electroNeg[i] = line[j]; break;}
          case 11:{ atomNum[i] = line[j]; break;}
          case 12:{ atomNum[i] = line[j]; break;}
          case 13:{ atomNum[i] = line[j]; break;}
          case 14:{ atomNum[i] = line[j]; break;}
          case 15:{ atomNum[i] = line[j]; break;}
          case 16:{ atomNum[i] = line[j]; break;}
          case 17:{ atomNum[i] = line[j]; break;}
          case 18:{ atomNum[i] = line[j]; break;}
          default:{ 
          
        }
      }
    }
  
}
