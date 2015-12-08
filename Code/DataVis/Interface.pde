class Interface {
  private int x, y, w, h;
  //Array to hold the element names
  private String[] elemNames;
  //Array to hold names of attributes
  private String[] attributes = { "Atomic Number",
                                  "Isotopes",
                                  "Year of Discovery",
                                  "Atomic Weight",
                                  "Atomic Radius",
                                  "Ionic Radius",
                                  "Electronegativity",
                                  "First Ionization Potential",
                                  "Density","Melting Point",
                                  "Boiling Point",
                                  "Heat Capacity"};

  Interface(int x, int y, int w, int h) {

    //Initilising global variables
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    //Title text
    fill(0);
    textAlign(CENTER);
    textSize(10);
    text("Periodic Table of Elements", 100, 20);
    
    elemNames = new String[elements.size()];//Array to hold names of elements
    getElemNames();
  }

  public void display() {
    //Blue background
    //fill(0,0,255);
    //stroke(0,0,255);
    //rect(x, y, w, h);

    newButton("Histogram", 0, 0, 50, 100, 40);
    newButton("Bubble Graph", 1, 100, 50, 100, 40);
    newButton("Reset Graph", 2, 0, height-20, 200, 20);
    newDropdown("Attributes", attributes, 0, 130, 200, 400, 20, 20);
    newDropdown("Elements", elemNames, 0, 100, 200, 400, 20, 20);
  }

  public void newButton(String text, int id, int x, int y, int w, int h) {
    cp5.addButton(text).setValue(0).setPosition(x, y).setSize(w, h).setId(id);
  }

  public void newDropdown(String text, String[] l, int x, int y, int w, int h, int bH, int iH) {
    cp5.addScrollableList(text)
      .setPosition(x, y)
      .setSize(w, h)
      .setBarHeight(bH)
      .setItemHeight(iH)
      .addItems(l)
      .setType(ScrollableList.DROPDOWN)
      .setOpen(false);
  }
  
  private void getElemNames(){
    //Putting number before element names
    for (int i = 0; i < elements.size(); i++) {
      elemNames[i] = elements.get(i).getElemName();
      elemNames[i] = (i+1) + " - " + elemNames[i];
    }
  }
}