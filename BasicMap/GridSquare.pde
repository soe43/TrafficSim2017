public class GridSquare {
  //NEEDS TO BE NAMED THE BRITISH VERSION 
<<<<<<< HEAD
  int colour; //single, 0-256 for now (could change later to trio)
  boolean drivable = false;
  
  public GridSquare(){
    colour = 0;
  }
=======
  int colour = 0; //single, 0-256 for now (could change later to trio)
>>>>>>> ben

  public GridSquare(int colour) {
    this.colour = colour;
  }

  public int getColor() {
    return colour;
  }

<<<<<<< HEAD
  public boolean canDrive(){
    return drivable;
  }
  
=======
>>>>>>> ben
  public void setColor(int c) {
    colour = c;
  }
}