import java.util.*;

public class Road extends GridSquare {
  private boolean isStart; //Cars spawn here
  private boolean isEnd; //Cars get killed here
  private boolean isDrivable = true;
  private ArrayList<Car> carsHere = new ArrayList<Car>();
  private int heading;

  //for stopsign: 
  private boolean stopSignPotential = false; //has potential for stopSign
  private boolean stopSign = false;
  private int origStopTimer = 250;
  private int stopTimer = origStopTimer; 
  private int mode = -1;


  public Road(int r, int c, int angle, boolean start, boolean end) {
    super(r, c, 0); //set to black
    isStart = start;
    isEnd = end;
    heading = angle;
  }

  //for StopSigns: 'stop' always == true
  public Road(int r, int c, int angle, boolean start, boolean end, boolean stop, int mode) {
    super(r, c, 0); //set to black
    isStart = start;
    isEnd = end;
    heading = angle;
    if (mode == 0) {
      stopSignPotential = stop;
      stopSign = stop;
    }
    if (mode == 1) {
      stopSignPotential = stop;
      stopSign = !stop;
    }
  }

  //accessors:
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

  public int getHeading() {
    return heading;
  }

  public boolean hasStopSign() {
    return stopSign;
  }

  public int stopTimer() {
    return stopTimer;
  }

  public boolean hasStopSignPot() {
    return stopSignPotential;
  }

  //mutators:
  public void setHeading(int h) {
    heading = h % 360;
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

  public void setStopTimer(int t) {
    origStopTimer = t;
    stopTimer = t;
  }

  //THIS OCCURS IN DRAWMAP() FUNCTION OF MAP
  public boolean updateStopSign() {
    if (!stopSignPotential) return false;

    if (stopTimer <= 0) {
      reverseStopSign();
      stopTimer = origStopTimer + 50; //make it a little longer so cars can clear out
    } else {
      stopTimer--;
    }

    return stopSign;
  }

  public void reverseStopSign() {
    stopSign = !stopSign;
  }
}