public class Car {
  private float width;
  private float length;
  private float xcor;
  private float ycor;
  private float speed; //number of pixels moved per tick
  private float angle; //orientation of the car (0 to 360 degrees) 

  private Road current;
  private GridSquare nextUp;
  private GridSquare nextLeft;
  private GridSquare nextRight;


  public Car(float x, float y, float orientation) { 
    //what should be set here?
    width = 15; 
    length = 30;
    xcor = x;
    ycor = y;
    speed = 1;
    angle = orientation;
    // Map.updateCar(this);
  }

  //drawing of the car: 
  public void drawMe() {
    fill(98, 229, 129); //a fun light green

    if (angle == 0 || angle == 180) { //if you're horizontal
      rect(xcor, ycor, length, width);
    } else { //if you're vertical
      rect(xcor, ycor, width, length);
    }
  }



  //moving the car!
  //will have to be changed with PVectors...
  public void move() {
    if (angle == 0) { //going to the right
      xcor += speed;
    } else if (angle == 90) { //going up 
      ycor += speed;
    } else if (angle == 180) { //going to the left
      xcor -= speed;
    } else { //going down (angle == 270)
      ycor -= speed;
    }
  }



  //accessors: 
  public float getX() {
    return xcor;
  }

  public float getY() {
    return ycor;
  }

  public Road current() {
    return current;
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

  public float getAngle() {
    return angle;
  }

  public float getSpeed() {
    return speed;
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
}