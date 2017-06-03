import java.util.*;
ArrayList<Car> cars = new ArrayList<Car>();


void setup() {
  size(800, 650);
  background(12, 83, 124);
  noStroke();
}

void draw() {
  background(12, 83, 124);
  
  for (Car c : cars) {
    c.move();
    c.drawMe();
  }
}

void mouseClicked() {
  Car newCar = new Car(mouseX, mouseY, random(-5, 5));
  newCar.drawMe();
  cars.add(newCar);
}