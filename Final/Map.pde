import java.util.*;

public class Map {
  public GridSquare[][] data;
  private int maxX;
  private int maxY;

  //FOR SPAWNING/KILLING CARS
  private ArrayList<Road> spawnable = new ArrayList<Road>(); //isStart == true
  private ArrayList<Road> killable = new ArrayList<Road>(); //isEnd == true

  //maxX, maxY are the screen dimensions (size(x,y)) 
  public Map(int gridR, int gridC, int maxX, int maxY, int mapToggle) {
    this.maxX = maxX;
    this.maxY = maxY;

    data = new GridSquare[gridR][gridC];

    for (int r = 0; r < gridR; r++) {
      for (int c = 0; c < gridC; c++) {
        data[r][c] = new GridSquare(r, c, 130);
      }
    }

    //SETTING UP THE MA  P'S ROADS:
    if (mapToggle == 0) { //super basic 
      horizontalRoad(4, gridR, 0);
      horizontalRoad(8, gridR, 180);
      data[9][4] = new Road(2, 4, 0, false, false, true, 0);
      data[4][4] = new Road(2, 4, 0, false, false, true, 0);
      data[6][8] = new Road(2, 4, 0, false, false, true, 0);
      data[11][8] = new Road(2, 4, 0, false, false, true, 0);     
      verticalRoad(10, gridC, 90);
      verticalRoad(5, gridC, 270);
      data[5][3] = new Road(2, 4, 0, false, false, true, 1);
      data[5][7] = new Road(2, 4, 0, false, false, true, 1);
      data[10][5] = new Road(2, 4, 0, false, false, true, 1);
      data[10][9] = new Road(2, 4, 0, false, false, true, 1);
    }
    if (mapToggle == 1) { //medium level 
      horizontalRoad(2, gridR, 0);
      horizontalRoad(6, gridR, 180);
      horizontalRoad(9, gridR, 0);
      data[1][2] = new Road(2, 4, 0, false, false, true, 0);
      data[5][2] = new Road(2, 4, 0, false, false, true, 0);
      data[8][2] = new Road(2, 4, 0, false, false, true, 0);
      data[12][2] = new Road(2, 4, 0, false, false, true, 0);
      data[3][6] = new Road(2, 4, 0, false, false, true, 0);
      data[7][6] = new Road(2, 4, 0, false, false, true, 0);
      data[10][6] = new Road(2, 4, 0, false, false, true, 0);
      data[14][6] = new Road(2, 4, 0, false, false, true, 0);
      data[1][9] = new Road(2, 4, 0, false, false, true, 0);
      data[5][9] = new Road(2, 4, 0, false, false, true, 0);
      data[8][9] = new Road(2, 4, 0, false, false, true, 0);
      data[12][9] = new Road(2, 4, 0, false, false, true, 0);
      verticalRoad(2, gridC, 90);
      verticalRoad(6, gridC, 270);
      verticalRoad(9, gridC, 90);
      verticalRoad(13, gridC, 270);
      data[2][3] = new Road(2, 4, 0, false, false, true, 1);
      data[9][3] = new Road(2, 4, 0, false, false, true, 1);
      data[2][7] = new Road(2, 4, 0, false, false, true, 1);
      data[9][7] = new Road(2, 4, 0, false, false, true, 1);
      data[2][10] = new Road(2, 4, 0, false, false, true, 1);
      data[9][10] = new Road(2, 4, 0, false, false, true, 1);
      data[6][1] = new Road(2, 4, 0, false, false, true, 1);
      data[13][1] = new Road(2, 4, 0, false, false, true, 1);
      data[6][5] = new Road(2, 4, 0, false, false, true, 1);
      data[13][5] = new Road(2, 4, 0, false, false, true, 1);
      data[6][8] = new Road(2, 4, 0, false, false, true, 1);
      data[13][8] = new Road(2, 4, 0, false, false, true, 1);
    }
    if (mapToggle == 2) { //two way roads 
      horizontalRoad(4, gridR, 0);
      horizontalRoad(5, gridR, 180);
      horizontalRoad(8, gridR, 0);
      horizontalRoad(9, gridR, 180);
      data[2][4] = new Road(2, 4, 0, false, false, true, 0);
      data[4][5] = new Road(2, 4, 0, false, false, true, 0); 
      data[6][4] = new Road(2, 4, 0, false, false, true, 0);
      data[8][5] = new Road(2, 4, 0, false, false, true, 0);
      data[10][4] = new Road(2, 4, 0, false, false, true, 0);
      data[12][5] = new Road(2, 4, 0, false, false, true, 0);
      data[2][8] = new Road(2, 4, 0, false, false, true, 0);
      data[4][9] = new Road(2, 4, 0, false, false, true, 0); 
      data[6][8] = new Road(2, 4, 0, false, false, true, 0);
      data[8][9] = new Road(2, 4, 0, false, false, true, 0);
      data[10][8] = new Road(2, 4, 0, false, false, true, 0);
      data[12][9] = new Road(2, 4, 0, false, false, true, 0);
      /*
      data[10][6] = new Road(2, 4, 0, false, false, true,0);
       data[14][6] = new Road(2, 4, 0, false, false, true,0);
       data[1][10] = new Road(2, 4, 0, false, false, true,0);
       data[5][10] = new Road(2, 4, 0, false, false, true,0);
       data[8][10] = new Road(2, 4, 0, false, false, true,0);
       data[12][10] = new Road(2, 4, 0, false, false, true,0);
       */
      verticalRoad(3, gridC, 270);
      verticalRoad(7, gridC, 90);
      verticalRoad(11, gridC, 270);
      data[3][3] = new Road(2, 4, 0, false, false, true, 1);
      data[3][7] = new Road(2, 4, 0, false, false, true, 1);
      data[11][3] = new Road(2, 4, 0, false, false, true, 1);
      data[11][7] = new Road(2, 4, 0, false, false, true, 1);
      data[7][10] = new Road(2, 4, 0, false, false, true, 1);
      data[7][6] = new Road(2, 4, 0, false, false, true, 1);
      /*
      data[13][1] = new Road(2, 4, 0, false, false, true,1);
       data[6][5] = new Road(2, 4, 0, false, false, true,1);
       data[13][5] = new Road(2, 4, 0, false, false, true,1);
       data[6][9] = new Road(2, 4, 0, false, false, true,1);
       data[13][9] = new Road(2, 4, 0, false, false, true,1);
       */
    }
  }


  //FOR MAKING TESTING (AND MAP GENERATION) A WHOLE LOT EASIER:

  //heading for horizontal roads: either 0 (right) or 180 (left)
  public void horizontalRoad(int r, int gridR, int heading) {
    int i = 1;
    while (i < gridR - 1) {
      data[i][r] = new Road(i, r, heading, false, false);
      i++;
    }

    //setting the start and end Roads:
    if (heading == 0) {
      //start:
      Road k1 = new Road(0, r, 0, true, false);
      spawnable.add(k1);
      data[0][r] = k1;

      //end:
      Road k2 = new Road(gridR - 1, r, 0, false, true);
      killable.add(k2);
      data[gridR - 1][r] = k2;
    }
    if (heading == 180) {
      //start:
      Road k1 = new Road(gridR - 1, r, 180, false, true);
      spawnable.add(k1);
      data[gridR - 1][r] = k1;

      //end:
      Road k2 = new Road(0, r, 180, true, false);
      killable.add(k2);
      data[0][r] = k2;
    }
    drawMap();
  }

  //heading for vertical roads: either 90 (up) or 270 (down)
  public void verticalRoad(int c, int gridC, int heading) {
    int i = 1;
    while (i < gridC - 1) {  
      data[c][i] = new Road(c, i, heading, false, false);
      i++;
    }

    //start and end Roads:
    if (heading == 90) {
      //start:
      Road k1 = new Road(c, gridC - 1, 90, true, false);
      spawnable.add(k1);
      data[c][gridC - 1] = k1;

      //end:
      Road k2 = new Road(c, 0, 90, false, true);
      killable.add(k2);
      data[c][0] = k2;
    }
    if (heading == 270) {
      //start:
      Road k1 = new Road(c, 0, 270, true, false);
      spawnable.add(k1);
      data[c][0] = k1;

      //end:
      Road k2 = new Road(c, gridC - 1, 270, false, true);
      killable.add(k2);
      data[c][gridC - 1] = k2;
    }
  }







  //called as the update function in the Map class
  public void updateCar(Car c) {



    //changing current, nextUp, nextLeft, nextRight FOR EACH DIFFERENT ORIENTATION
    //draw diagrams for this (will be easier to understand, trust me...
    if (c.getAngle() == 0) { // to the right is front
      c.setCurrent(getSquare(int(c.getX() / 50), int(c.getY() / 50)));
      try {
        c.setNextUp(getSquare(int(c.getX() / 50 + 1), int(c.getY() / 50)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setNextUp(null);
      }
      try {
        c.setLeft(getSquare(int(c.getX() / 50), int(c.getY() / 50 + 1)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setLeft(null);
      }
      try {
        c.setRight(getSquare(int(c.getX() / 50), int(c.getY() / 50 - 1)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setRight(null);
      }
      try {
        c.setPrevious(getSquare(int(c.getX() / 50 - 1), int(c.getY() / 50)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setPrevious(null);
      }
    } else if (c.getAngle() == 90 ) { // upwards is front
      c.setCurrent(getSquare(int(c.getX() / 50), int(c.getY() / 50)));
      try {
        c.setNextUp(getSquare(int(c.getX() / 50), int(c.getY() / 50 - 1)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setNextUp(null);
      }
      try {
        c.setLeft(getSquare(int(c.getX() / 50 - 1), int(c.getY() / 50)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setLeft(null);
      }
      try {
        c.setRight(getSquare(int(c.getX() / 50 + 1), int(c.getY() / 50)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setRight(null);
      }
      try {
        c.setPrevious(getSquare(int(c.getX() / 50), int(c.getY() / 50 + 1)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setPrevious(null);
      }
    } else if (c.getAngle() == 180) { // to the left is front
      c.setCurrent(getSquare(int(c.getX() / 50), int(c.getY() / 50)));
      try {
        c.setNextUp(getSquare(int(c.getX() / 50 - 1), int(c.getY() / 50)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setNextUp(null);
      }
      try {
        c.setLeft(getSquare(int(c.getX() / 50), int(c.getY() / 50 - 1)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setLeft(null);
      }
      try {
        c.setRight(getSquare(int(c.getX() / 50), int(c.getY() / 50 + 1)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setRight(null);
      }
      try {
        c.setPrevious(getSquare(int(c.getX() / 50 + 1), int(c.getY() / 50)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setPrevious(null);
      }
    } else { // downwards is front
      c.setCurrent(getSquare(int(c.getX() / 50), int(c.getY() / 50)));
      try {
        c.setNextUp(getSquare(int(c.getX() / 50), int(c.getY() / 50 + 1)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setNextUp(null);
      }
      try {
        c.setLeft(getSquare(int(c.getX() / 50 + 1), int(c.getY() / 50)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setLeft(null);
      }
      try {
        c.setRight(getSquare(int(c.getX() / 50 - 1), int(c.getY() / 50)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setRight(null);
      }
      try {
        c.setPrevious(getSquare(int(c.getX() / 50), int(c.getY() / 50 - 1)));
      }
      catch(ArrayIndexOutOfBoundsException e) {
        c.setPrevious(null);
      }
    }

    //adjusting speed (should come first, I think?)
    //BUT NOT BEFORE SETTING THE STUFF!
    c.adjustSpeed();


    c.turn();

    c.move();

    GridSquare gs = c.previous();
    if (gs != null) {   
      gs.removeCar();
    }

    c.updateRoadList();

    c.drawMe();
  }

  //accessor methods:
  public GridSquare getSquare(int r, int c) {
    return data[r][c];
  }

  public ArrayList<Road> getSpawnable() {
    return spawnable;
  }

  public ArrayList<Road> getKillable() {
    return killable;
  }    

  public boolean toBeKilled(Car c) {
    GridSquare gs = data[int(c.getX() / 50)][int(c.getY() / 50)];
    return killable.indexOf(gs) != -1;
  }

  public void drawMap() {
    for (int r = 0; r < data.length; r++) {
      for (int c = 0; c < data[r].length; c++) {
        fill(data[r][c].getColor());
        rect(r * 50, c * 50, 50, 50, 7);

        if (data[r][c] instanceof Road && data[r][c].updateStopSign()) {
          fill(255, 30, 41); //red!
          rectMode(CENTER); //easier to draw
          rect(r * 50 + 25, c * 50 + 25, 10, 10);
          rectMode(CORNER); //changing it back
        }
      }
    }
  }
  
  public void explodeCars(ArrayList<Car> cars){
    for(int r = 0; r < data.length; r++){
      for(int c = 0; c < data[r].length; c++){
        if(data[r][c] instanceof Road){
          data[r][c].explode(cars);
        }
      }
    }
  }
  
  
}
