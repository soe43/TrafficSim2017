import java.util.*;

public class Road extends GridSquare {
  private boolean isStart; //Cars spawn here
  private boolean isEnd; //Cars get killed here
  private boolean isDrivable = true;
  private ArrayList<Car> carsHere;

  public Road(int r, int c, boolean start, boolean end) {
    super(r, c, 0); //set to black
    isStart = start;
    isEnd = end;
    carsHere = new ArrayList<Car>();
  }

  public boolean isStart() {
    return isStart;
  }

  public boolean isEnd() {
    return isEnd;
  }

  //always true
  public boolean canDrive() {
    return isDrivable;
  }

  public ArrayList<Car> carsHere() {
    return carsHere;
  }

  //mutating the ArrayList:
  public void addCar(Car c) {
    //only adds the car if not already on it!
    if (carsHere.indexOf(c) != 1) {
      carsHere.add(c);
    }
  }

  //need to know how to do this! Like, how and when to update it. 
  //IDEA: GO THROUGH ARRAYLIST, IF CAR ON IT IS NO LONGER WITHIN BOUNDS OF THE ROAD,
  //DELETE THE CAR!!! 
  //Where does this go--needs to be called when drawing the roads..?
  public void removeCar() {
    //bounds of the road are ro * 50 to ro * 50 + 50, same w/ col
    int ro = getRow();
    int co = getCol();

    for (int i = 0; i < carsHere.size(); i++) {
      Car c = carsHere.get(i);
      if (c.getX() < ro * 50  ||
        c.getX() > ro * 50 + 50 ||
        c.getY() < co * 50 ||
        c.getY() < co * 50 + 50) {
        carsHere.remove(c);
        i--;
      }
    }
  }
}