public class GridSquare {
  //NEEDS TO BE NAMED THE BRITISH VERSION 
  int colour; //single, 0-256 for now (could change later to trio)
  boolean drivable = false;
  
  public GridSquare(){
    colour = 0;
  }

  public GridSquare(int colour) {
    this.colour = colour;
  }

  public int getColor() {
    return colour;
  }

  public boolean getDrivable(){
    return drivable;
  }
  
  public void setColor(int c) {
    colour = c;
  }
}