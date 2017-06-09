//up next: 
//road directionality
//seeing how the acceleration works when turning is in the picture
//^^ done by building a bigger test model with more roads and turns and stuff
//further down the road (ha! pun): implementing intersections

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