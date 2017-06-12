Map data;

void setup() { 
  size(800, 650);
  background(12, 83, 124); //nice blue 
  data = new Map(800/50, 650/50, 800, 650); //50x50 squares for now, although I think
  //that it's a good size

  data.drawMap();
  
  
 TrafficTriangle a = new TrafficTriangle(80,60,90);
 a.drawMe();
}


void draw() {
 data.drawMap();
 TrafficTriangle f = new TrafficTriangle(50,60,0);
 f.drawMe();
 TrafficTriangle a = new TrafficTriangle(100,60,90);
 a.drawMe();
 TrafficTriangle b = new TrafficTriangle(150,60,180);
 b.drawMe();
 TrafficTriangle c = new TrafficTriangle(200,60,270);
 c.drawMe();
 TrafficTriangle d = new TrafficTriangle(250,60,360);
 d.drawMe();
 TrafficTriangle e = new TrafficTriangle(300,60,47);
 e.drawMe();
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