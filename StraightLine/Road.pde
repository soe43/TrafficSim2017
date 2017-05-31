public class Road extends GridSquare {
  private boolean isEnd; //Cars get killed here
  private boolean isStart; //Cars spawn here

  public Road(int r, int c, boolean start, boolean end) {
    super(r, c, 0); //set to black
    isStart = start;
    isEnd = end;
  }
}