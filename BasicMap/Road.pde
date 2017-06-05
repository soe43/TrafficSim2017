public class Road extends GridSquare {
  
  public Road() {
    super(0); //set to black
    drivable = true;
  }

  public Road(int colour){
    super(colour);
    drivable = true;
  }
  
}