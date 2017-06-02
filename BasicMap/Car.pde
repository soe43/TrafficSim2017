public class Car {
  private float width;
  private float length;
  private float xcor;
  private float ycor;
  private float speed; //number of pixels moved per tick
  private float angle; //orientation of the car (0 to 360 degrees) 
  
  //Orientation can only be 0,90,180,270 degrees
  public Car(float x, float y, float orientation) { 
    width = 15;
    length = 30;
    xcor = x;
    ycor = y;
    speed = 1;
    angle = orientation;
  }
  
  //accessors: 
  public float getX(){
    return xcor;
  }
  
  public float getY(){
    return ycor;
  }
  
  public float getAngle(){
    return angle;
  }
  
  public float getSpeed(){
    return speed;
  }
  
  //mutators: 
  public void incX(float x){
    xcor += x;
  }
  
  public void incY(float y){
    ycor += y;
  }
  
  public void setSpeed(float s){
    speed = s; 
  }
  
  public void incSpeed(float s){
    speed += s;
  }
  
  public void setAngle(float a){
    angle = Math.abs(a % 360);
  }
  
  public void incAngle(float a){
    angle += a;
    angle = Math.abs(angle % 360);    
  }
  
  
  
  
  //Am I on a road? (should it be: will I be on a road after I move x steps)
  //Checks if a given square is a road
  /*
  public boolean isOnRoad(flaot x, float y){
    return (getSquare(int(x / 50), int(y / 50)).getColour() == 0);
  }*/
  
  //for turn()
  public void isIntersection(float x, float y){
    //GridSquare a = getSquare(int(x / 50), int(y / 50));
    
  }
   
   public void turn(){
   }
   
  public void move(){
  
    if(angle == 0){ //move right 
      xcor += speed; 
    } 
    else if(angle == 90){ //move up
      ycor += speed;
    }
    else if(angle == 180){ //move left
      xcor -= speed;
    }
    else if(angle == 270){ //move down
      ycor -= speed;
    }
    
    else{
      //continue turning sequence:
      //turn()
    }
    
    
      
  }
   
}