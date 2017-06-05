Map data;

void setup() { 
  size(800, 650);
  background(12, 83, 124); //nice blue 
  data = new Map(800/50, 650/50, 800, 650); //50x50 squares for now, although I think
  //that it's a good size

  data.drawMap();
}


void draw() {
 data.drawMap();  
}

void keyPressed(){  
  if (keyCode == 66) {
    print(keyCode);
    data.toggleBuild = !data.toggleBuild;
    data.toggleBuild();
  }
}


void mouseClicked() {
  data.updateMap(mouseX, mouseY);
}