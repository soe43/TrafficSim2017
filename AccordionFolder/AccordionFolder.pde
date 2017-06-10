import controlP5.*;

ControlP5 cp5;

Accordion accordion;

color c = color(0, 160, 100);

TrafficSimulator sim;

void setup() {
  size(800, 650);
  background(12, 83, 124);
  sim = new TrafficSimulator();
  gui();
}

void draw() {
  sim.run();
}

void gui() {
  cp5 = new ControlP5(this);

  // group number 1, 
  Group g1 = cp5.addGroup("Pause")
    .setBackgroundColor(color(0, 64))
    .setBackgroundHeight(150);

  accordion = cp5.addAccordion("acc")
    .setPosition(600, 25)
    .setWidth(150)
    .addItem(g1);

  cp5.addButton("pause")
    .setPosition(10, 20)
    .setSize(50, 30)
    .moveTo(g1);
  
  cp5.addButton("clear")
    .setPosition(70, 20)
    .setSize(50, 30)
    .moveTo(g1);

  //multiple can be open at the same time
  accordion.setCollapseMode(Accordion.MULTI);
}

//the commands:

public void pause() {
  sim.pause();
}

public void clear() {
  sim.clear();
}