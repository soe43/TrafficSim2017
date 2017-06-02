public class Map {
  private GridSquare[][] data;
  private int maxX;
  private int maxY;

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
  }

  //accessor method
  public GridSquare getSquare(int r, int c) {
    return data[r][c];
  }
  
  //public int[] getLocation(GridSquare g){
    //for(int i = 0;i < data.length;i++){
      //for(int k = 0;k < data[0].length;k++){
        //if(data[i][k] == g){
        //}}}}
            

  //only gets called once (in the setup of BasicMap)
  public void drawMap(){
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
      data[int(x / 50)][int(y / 50)] = new Road(); 
    } else if (gs.getColor() == 0){
      data[int(x / 50)][int(y / 50)] = new GridSquare(130);
    }
  }
  
  

} 