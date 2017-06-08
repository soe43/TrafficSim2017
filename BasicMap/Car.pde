public class Car {
  private float width;
  private float length;
  private float xcor;
  private float ycor;
  private float speed; //number of pixels moved per tick
  private float angle; //orientation of the car (0 to 360 degrees) 
<<<<<<< HEAD
  private float turnTick = 10;

  private GridSquare current;
  private GridSquare nextUp;
  private GridSquare nextLeft;
  private GridSquare nextRight;


  public Car(float x, float y, float orientation) { 
    width = 15;
    length = 30;
    xcor = x;
    ycor = y;
    speed = 1;
    angle = orientation;
    //Map.updateCar(this)
  }

  //drawing the car onto the map
  public void drawMe() {
    fill(98, 229, 129);
    //horizontal
    if (angle == 0 || angle == 180) {
      rect(xcor, ycor, length, width);
      //vertical
    } else { 
      rect(xcor, ycor, width, length);
    }
  }

  public void turn(int LightOrient) {
    //added on the buffer to get rid of the double turning bug 
    if (turnTick > 0) {
      return;
    }
    if ((angle == 0 && xcor % 50 == 25) || (angle == 180 && xcor % 50 == 25)) {
      angle = LightOrient;
      xcor -= width / 2;
    } else if ((angle == 90 && ycor % 50 == 25) || (angle == 270 && ycor % 50 == 25)) {
      angle = LightOrient;
      ycor -= width / 2;
    }
  }

  //accessors: 
  public float getX() {
    return xcor;
  }

  public float getY() {
    return ycor;
  }

  public float getAngle() {
    return angle;
  }

  public float getSpeed() {
    return speed;
  }

  public GridSquare nextUp() {
    return nextUp;
  }

  public GridSquare nextLeft() {
    return nextLeft;
  }

  public GridSquare nextRight() {
    return nextRight;
  }

  //mutators: 
  public void incX(float x) {
    xcor += x;
  }

  public void incY(float y) {
    ycor += y;
  }

  public void setSpeed(float s) {
    speed = s;
  }

  public void incSpeed(float s) {
    speed += s;
  }

  public void setAngle(float a) {
    angle = Math.abs(a % 360);
  }

  public void incAngle(float a) {
    angle += a;
    angle = Math.abs(angle % 360);
  }

  public void setCurrent(GridSquare g) {
    current = g;
  }

  public void setNextUp(GridSquare g) {
    nextUp = g;
  }

  public void setLeft(GridSquare g) {
    nextLeft = g;
  }

  public void setRight(GridSquare g) {
    nextRight = g;
  }

  //Will I be on a road? (should it be: will I be on a road after I move x steps)
  public boolean isOnRoad(GridSquare qs) {
    return qs.canDrive();
  }

  public void move() {

    if (angle == 0) { //move right 
      xcor += speed;
    } else if (angle == 90) { //move up
      ycor += speed;
    } else if (angle == 180) { //move left
      xcor -= speed;
    } else if (angle == 270) { //move down
      ycor -= speed;
    } else {
      //continue turning sequence:
      //turn()
    }
  }
=======
  
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
  
  
  
  
  //Am I on a road? (should it be: will I be on a road after I move x steps)
  /*
  public boolean isOnRoad(){
    return getSquare(int(xcor / 50), int(ycor / 50)) instanceof Road;
  }*/
   
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
   
>>>>>>> ben
}