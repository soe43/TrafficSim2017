import java.util.*;

ArrayList<Car> cars = new ArrayList<Car>();

Map data;
int timer;

void setup() {
  size(800, 650);
  background(12, 83, 124);

  timer = 120;

  data = new Map(800/50, 650/50, 800, 650);
  data.drawMap();
}

void draw() {
  background(12, 83, 124);

  stroke(0); //set to black again
  data.drawMap();

  noStroke(); //so there's no outline on the cars
  for (Car c : cars) {
    c.move();
    c.drawMe();
  }

  timer--; 

  if (timer == 0) {
    timer = 120; 
    ArrayList<Road> rdAry= data.getSpawnable();
    for (Road rd : rdAry) {
      int adjustment = (50 - 15) / 2; //to center the car within the box
      //THIS WILL NEED TO CHANGE AS WE MESS WITH LANES // CARS OF DIFFERENT SIZES // ROAD
      //BIDIRECTIONALITY 
      //right now, it's just (widthRoad - widthCar) / 2, fairly simple to calculate.
      //most likely will stick to that formula
      
      Car c = new Car(rd.getRow() * 50, rd.getCol() * 50 + adjustment, 0);
      cars.add(c);
      c.drawMe();
    }
  }
}

void mouseClicked() {
  Car newCar = new Car(mouseX, mouseY, 0);
  newCar.drawMe();
  cars.add(newCar);
}