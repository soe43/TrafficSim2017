TrafficSimulator sim;

void setup() {
  size(800, 650);
  background(12, 83, 124);
  sim = new TrafficSimulator();
}

void draw() {
  sim.run();
}

/*
void mouseClicked() {
 Car newCar = new Car(mouseX, mouseY, 0);
 newCar.drawMe();
 cars.add(newCar);
 }
 */