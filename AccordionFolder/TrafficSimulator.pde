import java.util.*;

public class TrafficSimulator {
  ArrayList<Car> cars = new ArrayList<Car>();
  //ArrayList<StopLight> lights = new ArrayList<StopLight>();

  private Map data;
  private int timer = 120;
  private boolean isPaused = false;
  private int carSpeed;

  public TrafficSimulator() {
    data = new Map(800/50, 650/50, 800, 650);
    data.drawMap();
  }

  void run() {
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

    if (timer == 0) {
      timer = 120; 
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

  /*
void mouseClicked() {
   Car newCar = new Car(mouseX, mouseY, 0);
   newCar.drawMe();
   cars.add(newCar);
   }
   */
}   