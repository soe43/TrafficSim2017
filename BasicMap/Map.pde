public class Map {
  private GridSquare[][] data;
  private int maxX;
  private int maxY;
<<<<<<< HEAD
  private boolean toggleBuild;
=======
>>>>>>> ben

  //maxX, maxY are the screen dimensions (size(x,y)) 
  public Map(int gridR, int gridC, int maxX, int maxY) {
    this.maxX = maxX;
    this.maxY = maxY;

    data = new GridSquare[gridR][gridC];

    for (int r = 0; r < gridR; r++) {
      for (int c = 0; c < gridC; c++) {
        data[r][c] = new GridSquare(130); // set to the normal gray
      }
    }
<<<<<<< HEAD

    toggleBuild = false;
=======
>>>>>>> ben
  }

  //accessor method
  public GridSquare getSquare(int r, int c) {
    return data[r][c];
  }

<<<<<<< HEAD
  public ArrayList<GridSquare> getNeighbors(int r, int c) {
    ArrayList<GridSquare> moves = new ArrayList<GridSquare>();
    if (r == 0 && (c != 0 && c != maxY / 50)) {
      moves.add(data[r+1][c]);
      moves.add(data[r][c+1]);
      moves.add(data[r][c-1]);
    } else if (r == 0 && c == 0) {
      moves.add(data[r+1][c]);
      moves.add(data[r][c+1]);
    } else if (r == 0 && c == maxY / 50) {
      moves.add(data[r+1][c]);
      moves.add(data[r][c-1]);
    } else if (r == maxX / 50 && (c != 0 && c != maxY / 50)) {
      moves.add(data[r-1][c]);
      moves.add(data[r][c+1]);
      moves.add(data[r][c-1]);
    } else if (r == maxX / 50 && c == 0) {
      moves.add(data[r-1][c]);
      moves.add(data[r][c+1]);
    } else if (r == maxX / 50 && c == maxY / 50) {
      moves.add(data[r-1][c]);
      moves.add(data[r][c-1]);
    } else if (c == 0 && (r != 0 && r != maxX / 50)) {
      moves.add(data[r+1][c]);
      moves.add(data[r-1][c]);
      moves.add(data[r][c+1]);
    } else if (c == maxY / 50 && (r != maxX / 50 && r != 0)) {
      moves.add(data[r + 1][c]);
      moves.add(data[r - 1][c]);
      moves.add(data[r][c-1]);
    } else {
      moves.add(data[r+1][c]);
      moves.add(data[r-1][c]);
      moves.add(data[r][c+1]);
      moves.add(data[r][c-1]);
    }
    return moves;
  }


=======
>>>>>>> ben
  //only gets called once (in the setup of BasicMap)
  public void drawMap() {
    for (int r = 0; r < data.length; r++) {
      for (int c = 0; c < data[r].length; c++) {
        fill(data[r][c].getColor());
        rect(r * 50, c * 50, 50, 50, 7);
      }
    }
  }

  //drawing the map (does that go here or...) 
  public void updateMap(float x, float y) {
    //find the grid square
    GridSquare gs = getSquare(int(x / 50), int(y / 50));
    if (gs.getColor() == 130) {
<<<<<<< HEAD
      data[int(x / 50)][int(y / 50)] = new Road();
    } else if (gs.getColor() == 0) {
      data[int(x / 50)][int(y / 50)] = new GridSquare(130);
    }
  }

  public void toggleBuild() {
    if (toggleBuild) {
      for (int   r = 0; r < data.length; r++) {
        for (int c = 0; c < data[r].length; c++) {
          fill(data[r][c].getColor());
          rect(r * 50, c * 50, 50, 50, 7);
        }
      }
    } else if (!toggleBuild) {
      for (int   r = 0; r < data.length; r++) {
        for (int c = 0; c < data[r].length; c++) {
          fill(data[r][c].getColor());
          rect(r * 50, c * 50, 50, 50);
        }
      }
    }
  }
}
=======
      data[int(x / 50)][int(y / 50)] = new Road(); 
    } else if (gs.getColor() == 0){
      data[int(x / 50)][int(y / 50)] = new GridSquare(130);
    }
  }
  
  

} 
>>>>>>> ben
