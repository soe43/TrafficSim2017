<<<<<<< HEAD
public class TrafficLight {
  private int mode; //numbers that create a two-direction(2) or three-direction(3) streetlight
  private int orientation; //A multiple of 90
  private int currentTick; //ticks left until next switch
  private int tickTiming; //time until it changes orientation
  private boolean isStop; //Is the traffic light stopping cars?

  public TrafficLight(int mode, int startOrientation) {
    this.mode = mode;
    orientation = startOrientation;
    currentTick = 100;
    tickTiming = 100;
    isStop = false;
  }

  //Public Accessors
  public int getOrientation() {
    return orientation % 360;
  }

  public int getTick() {
    return tickTiming;
  }

  public void changeStop() {
    isStop = !isStop;
  }

  public void changeTime(int newTime) {
    tickTiming = newTime;
  }

  //Changes traffic light's orientation after a certain amount of time, 
  //or changes reduces time until next switch
  public void switchOrient() {
    if (currentTick == 0) {
      orientation = (orientation+2)%4;
      currentTick = tickTiming;
    } else {
      currentTick--;
    }
  }


  public void stop(Car c) {
    if (isStop) {
      c.setSpeed(0);
    } else {
      c.setSpeed(10);
    }
  }
  
  public void drawMe(Intersection inters){
    TrafficTriangle t = new TrafficTriangle(inters.xcor,inters.ycor,90);
  }
=======
public class TrafficLight{
  private int orientation; //1-4, where each increment is a turn of 90 degrees.
  private int currentTick; //ticks left until next switch
  private int ticktiming; //time until it changes orientation
  
  //Public Accessors
  public int getOrientation(){
    return orientation * 90;
  }
  
  public int getTick(){
    return ticktiming;
  }
  
  //Changes traffic light's orientation after a certain amount of time, 
  //or changes reduces time until next switch
  public void switchOrient(){
    if(currentTick == 0){
      orientation = (orientation+2)%4;
      currentTick = ticktiming;
    }
    else{
      currentTick--;
    }
  }
  
>>>>>>> ben
}  