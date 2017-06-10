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

int tickFrequency = 120; //number of ticks for a round of Cars to spawn

void draw() {
  sim.updateTickFrequency(tickFrequency);
  sim.run();
}

void gui() {
  cp5 = new ControlP5(this);

  // group number 1, 
  Group g1 = cp5.addGroup("controls")
    .setBackgroundColor(color(0, 64))
    .setBackgroundHeight(150);

  accordion = cp5.addAccordion("acc")
    .setPosition(610, 10)
    .setWidth(180)
    .addItem(g1);

  cp5.addButton("pause")
    .setPosition(10, 20)
    .setSize(50, 30)
    .moveTo(g1);
  
  cp5.addButton("clear")
    .setPosition(70, 20)
    .setSize(50, 30)
    .moveTo(g1);
    
  cp5.addSlider("tickFrequency")
    .setPosition(10, 60)
    .setSize(100, 30)
    .setRange(30, 200)
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