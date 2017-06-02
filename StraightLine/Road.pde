public class Road extends GridSquare {
  private boolean isStart; //Cars spawn here
  private boolean isEnd; //Cars get killed here

  public Road(int r, int c, boolean start, boolean end) {
    super(r, c, 0); //set to black
    isStart = start;
    isEnd = end;
  }

  public boolean isStart() {
    return isStart;
  }

  public boolean isEnd() {
    return isEnd;
  }
}