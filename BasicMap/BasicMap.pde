Map data;

void setup() { 
  size(800, 650);
  data = new Map(800/50, 650/50, 800, 650); 
  data.drawMap();
}

void draw() {
  data.drawMap();
}

void mouseClicked(){
  data.updateMap(mouseX, mouseY);
}