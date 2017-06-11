import java.util.*;

public class GridSquare {
  //NEEDS TO BE NAMED THE BRITISH VERSION 
  private int colour = 0; //single, 0-256 for now (could change later to trio)
  private int row, col;
  private boolean isDrivable = false;

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
  
  //adding neighbors to each road
  public void addNeighbor(String s) {
    neighbors.add(s);
  }

  //always false;
  public boolean canDrive() {
    return isDrivable;
  }

  
  
  //IN ORDER TO MAKE FUNCTIONS IN ROAD CLASS WORK:
  
  public void addCar(Car c) {
    System.out.println("Can't add Car to a GridSquare! Needs to be a Road!");
  }

  public void removeCar() {
    //do nothing 
    return;
  }
  
  public ArrayList<Car> carsHere(){
    throw new UnsupportedOperationException();
  }
  
  public int getHeading(){
    throw new UnsupportedOperationException();
  }
  
  public void setHeading(int h){
    throw new UnsupportedOperationException();
  }
}