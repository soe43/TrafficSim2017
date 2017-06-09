public class Intersection extends Road {
  ArrayList<TrafficLight> lights; //Maximum size of 2
  int xcor, ycor;
  boolean isStart, isEnd;

  public Intersection(int xcor, int ycor) {
    super(110);
    this.xcor = xcor;
    this.ycor = ycor;
    ArrayList<GridSquare> available = data.getNeighbors(xcor, ycor);
    if (available.size() == 3) {
      GridSquare startOrient;
      for (int i = 0; i < available.size(); i++) {
        int k = (int)Math.random() * available.size();
        if(available.get(k) instanceof Road) {
          startOrient = available.get(k);
        }
        lights.add(new TrafficLight(2, 90)); //Have to figure out how to find starting initialization
      }
    } else if (available.size() == 4) {
      GridSquare startOrient;
      for (int i = 0; i < available.size(); i++) {
        int k = (int)Math.random() * available.size();
        if (available.get(k) instanceof Road) {
          startOrient = available.get(k);
        }
        lights.add(new TrafficLight(3, 90)); //Have to figure out how to find starting initialization
      }
    }
  }
  
  
}