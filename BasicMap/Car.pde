public class Car {
  private float width;
  private float length;
  private float xcor;
  private float ycor;
  private float speed; //number of pixels moved per tick
  private float angle; //orientation of the car (0 to 360 degrees) 
  
  public Car() { 
    //what should be set here?
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
  
  //Will I be on a road? (should it be: will I be on a road after I move x steps)
  public boolean isOnRoad(GridSquare qs){
    return qs.getDrivable();
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