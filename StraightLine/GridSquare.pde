public class GridSquare {
  //NEEDS TO BE NAMED THE BRITISH VERSION 
<<<<<<< HEAD
  int colour = 0; //single, 0-256 for now (could change later to trio)
  int row, col; 
=======
  private int colour = 0; //single, 0-256 for now (could change later to trio)
  private int row, col;
  private boolean isDrivable = false;
>>>>>>> ben

  public GridSquare(int r, int c, int colour) {
    this.colour = colour;
    row = r;
    col = c;
  }

  public int getColor() {
    return colour;
  }

  public void setColor(int c) {
    colour = c;
  }

  public int getRow() {
    return row;
  }

  public int getCol() {
    return col;
  }
<<<<<<< HEAD
=======

  //always false;
  public boolean canDrive() {
    return isDrivable;
  }
>>>>>>> ben
}