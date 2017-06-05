public class TrafficLight{
  private int mode; //numbers 
  private int orientation; //1-4, where each increment is a turn of 90 degrees(90,180,270).
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
  
}  