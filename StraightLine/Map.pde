import java.util.*;

public class Map {
  private GridSquare[][] data;
  private int maxX;
  private int maxY;

  //FOR SPAWNING/KILLING CARS
  private ArrayList<Road> spawnable = new ArrayList<Road>(); //isStart == true
  private ArrayList<Road> killable = new ArrayList<Road>(); //isEnd == true

  //maxX, maxY are the screen dimensions (size(x,y)) 
  public Map(int gridR, int gridC, int maxX, int maxY) {
    this.maxX = maxX;
    this.maxY = maxY;

    data = new GridSquare[gridR][gridC];

    for (int r = 0; r < gridR; r++) {
      for (int c = 0; c < gridC; c++) {
        if (r == 0 && c == 2) { //you're the start road
          Road rd = new Road(r, c, true, false);
          spawnable.add(rd);
          data[r][c] = rd;
        } else if (r == gridR - 1 && c == 2) { //you're the end road
          Road rd = new Road(r, c, false, true);
          killable.add(rd);
          data[r][c] = rd;
        } else if (c == 2) {
          data[r][c] = new Road(r, c, false, false); //making a horizontal road
        } else {
          data[r][c] = new GridSquare(r, c, 130); // set to the normal gray
        }
      }
    }
  }

  //accessor method
  public GridSquare getSquare(int r, int c) {
    return data[r][c];
  }

  public ArrayList<Road> getSpawnable() {
    return spawnable;
  }

  public ArrayList<Road> getKillable() {
    return killable;
  }
  
  public boolean toBeKilled(Car c){
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





  /* //NOT BEING USED RIGHT NOW
   //drawing the map (does that go here or...) 
   public void updateMap(float x, float y) {
   //find the grid square
   GridSquare gs = getSquare(int(x / 50), int(y / 50));
   if (gs.getColor() == 130) {
   data[int(x / 50)][int(y / 50)] = new Road(false, false);
   } else if (gs.getColor() == 0) {
   data[int(x / 50)][int(y / 50)] = new GridSquare(130);
   }
   }
   */
} 