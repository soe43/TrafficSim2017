public class Map {
  private GridSquare[][] map;
  private int maxX;
  private int maxY;

  //maxX, maxY are the screen dimensions (size(x,y)) 
  public Map(int gridR, int gridC, int maxX, int maxY) {
    this.maxX = maxX;
    this.maxY = maxY;

    map = new GridSquare[gridR][gridC];

    for (int r = 0; r < gridR; r++) {
      for (int c = 0; c < gridC; c++) {
        map[r][c] = new GridSquare(130); // set to the normal gray
      }
    }
  }

  //accessor method
  public GridSquare getSquare(int r, int c) {
    return map[r][c];
  }

  //only gets called once (in the setup of BasicMap)
  public void drawMap() {
    for (int r = 0; r < map.length; r++) {
      for (int c = 0; c < map[r].length; c++) {
        fill(map[r][c].getColor());
        rect(r * 50, c * 50, 50, 50, 7);
      }
    }
  }

  //drawing the map (does that go here or...) 
  public void updateMap(float x, float y) {
    //find the grid square
    GridSquare gs = getSquare(int(x / 50), int(y / 50));
    if (gs.getColor() == 130) {
      gs.setColor(0);
    } else if (gs.getColor() == 0){
      gs.setColor(130);
    }
  }
} 