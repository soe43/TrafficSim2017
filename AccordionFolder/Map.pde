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

    //SETTING UP THE MAP'S ROADS:
    if(mapToggle == 0){ //super basic 
      horizontalRoad(4, gridR, 0);
      horizontalRoad(8, gridR, 180);
      verticalRoad(10, gridC, 90);
      verticalRoad(5, gridC, 270);
    }
    if(mapToggle == 1){ //medium level 
      horizontalRoad(2, gridR, 0);
      horizontalRoad(6, gridR, 180);
      horizontalRoad(10, gridR, 0);
      verticalRoad(2, gridC, 90);
      verticalRoad(6, gridC, 270);
      verticalRoad(9, gridC, 90);
      verticalRoad(13, gridC, 270);    
    }
    if(mapToggle == 2){ //complex 
      horizontalRoad(2, gridR, 0);
      horizontalRoad(4, gridR, 180);
      horizontalRoad(6, gridR, 180);
      horizontalRoad(8, gridR, 0);
      horizontalRoad(10, gridR, 0);
      verticalRoad(2, gridC, 90);
      verticalRoad(4, gridC, 270);
      verticalRoad(6, gridC, 270);
      verticalRoad(9, gridC, 90);
      verticalRoad(11, gridC, 90);
      verticalRoad(13, gridC, 270);    
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

    //is this gonna be mad slow?
    //Solution: create ANOTHER instance variable for the Car, so that it keeps track
    //of the previous Road, too.
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

  //only gets called once (in the setup of BasicMap)
  public void drawMap() {
    for (int r = 0; r < data.length; r++) {
      for (int c = 0; c < data[r].length; c++) {
        fill(data[r][c].getColor());
        rect(r * 50, c * 50, 50, 50, 7);
      }
    }
  }
  
  
}