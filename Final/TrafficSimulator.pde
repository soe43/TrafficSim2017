import java.util.*;

public class TrafficSimulator {
  ArrayList<Car> cars = new ArrayList<Car>();
  
  private Map data;
  private float tickFrequency = 120;
  private float timer = tickFrequency;
  private boolean isPaused = false;
  private boolean hasMapToggleChanged = false;
  private int mapToggle = 0;
  private int carSpeed;

  //oh, you'll see what this is... :P
  private boolean explosionMode = false; 


  public TrafficSimulator() {
    data = new Map(800/50, 650/50, 800, 650, 0);
    data.drawMap();
  }

  void run() {
    if (hasMapToggleChanged == true) {
      clear();
      data = new Map(800/50, 650/50, 800, 650, mapToggle);
      data.drawMap();
      hasMapToggleChanged = false;
    }

    if (isPaused) return;

    background(12, 83, 124);

    stroke(0); //set to black again
    data.drawMap();

    noStroke(); //so there's no outline on the cars
    for (int i = 0; i < cars.size(); i++) {
      Car c = cars.get(i);
      data.updateCar(c);

      //NEED TO CHECK IF AT A SPOT IN KILLABLE, THEN KILL
      if (data.toBeKilled(c)) { 
        cars.remove(c);
        i--;
      }
    }

    timer--; 

    if (timer <= 0) {
      timer = tickFrequency; 
      ArrayList<Road> rdAry= data.getSpawnable();
      for (Road rd : rdAry) {
        int adjustment = (50 - 15) / 2; //to center the car within the box
        //THIS WILL NEED TO CHANGE AS WE MESS WITH LANES // CARS OF DIFFERENT SIZES // ROAD
        //BIDIRECTIONALITY 
        //right now, it's just ((widthRoad / lanesRoad) - widthCar) / 2, fairly simple to calculate.
        //most likely will stick to that formula

        Car c;
        if (rd.getHeading() == 0) {       
          c = new Car(rd.getRow() * 50, rd.getCol() * 50 + adjustment, 0, carSpeed);
        } else if (rd.getHeading() == 180) {
          c = new Car(rd.getRow() * 50, rd.getCol() * 50 + adjustment, 180, carSpeed);
        } else if (rd.getHeading() == 90) {
          c = new Car(rd.getRow() * 50 + adjustment, rd.getCol() * 50, 90, carSpeed);
        } else {
          c = new Car(rd.getRow() * 50 + adjustment, rd.getCol() * 50, 270, carSpeed);
        }

        carSpeed++;
        cars.add(c);
        c.drawMe();
      }
    }
  }


  //mutator: just sets pause to the opposite
  public void pause() {
    isPaused = !isPaused;
  }

  public void clear() {
    cars = new ArrayList<Car>();
  }

  public void updateTickFrequency(float t) {
    tickFrequency = t;
  }

  //will need to change the remainder (right now, 3) if number of pre-set maps changes
  public void incMapToggle() {
    mapToggle = (mapToggle + 1) % 3;
    hasMapToggleChanged = true;
  }

  public void toggleExplosions() {
    explosionMode = !explosionMode;
  }

  public boolean explosions() {
    return explosionMode;
  }


  //only called when explosionMode == true
  public void explodeCars() {
    data.explodeCars(cars);
  }
}   