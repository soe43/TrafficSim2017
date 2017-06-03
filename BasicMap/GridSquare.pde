public class GridSquare {
  //NEEDS TO BE NAMED THE BRITISH VERSION 
  int colour = 0; //single, 0-256 for now (could change later to trio)

  public GridSquare(int colour) {
    this.colour = colour;
  }

  public int getColor() {
    return colour;
  }

  public void setColor(int c) {
    colour = c;
  }
}