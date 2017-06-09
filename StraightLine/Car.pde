public class Car {
  private float width;
  private float length;
  private float xcor;
  private float ycor;
  private float speed; //number of pixels moved per tick
  private float angle; //orientation of the car (0 to 360 degrees) 

  private GridSquare current;
  private GridSquare nextUp;
  private GridSquare nextLeft;
  private GridSquare nextRight;

<<<<<<< HEAD
=======
  private int turnTick = 10;
>>>>>>> ben

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
<<<<<<< HEAD
      ycor += speed;
    } else if (angle == 180) { //going to the left
      xcor -= speed;
    } else { //going down (angle == 270)
      ycor -= speed;
    }
  }

=======
      ycor -= speed;
    } else if (angle == 180) { //going to the left
      xcor -= speed;
    } else { //going down (angle == 270)
      ycor += speed;
    }

    turnTick--;
  }

  //turn the car!
  public void turn() {
    //added on the buffer to get rid of the double turning bug 
    if (turnTick > 0) {
      return;
    }

    ArrayList<String> choices = new ArrayList<String>();
    if (angle == 0 && xcor % 50 == 25) {
      if (nextUp.canDrive()) choices.add("S"); //stay straight
      if (nextLeft.canDrive()) choices.add("L"); //go left
      if (nextRight.canDrive()) choices.add("R"); //go right

      int i = int(random(choices.size()));
      if (choices.get(i).equals("L")){
        angle = 90;
        xcor -= width / 2; //precalculated adjustment     
      }
      if (choices.get(i).equals("R")){
        angle = 270;
        xcor -= width / 2; // xcor -= (widthCar) / 2; 
      }
      //else do nothing (stay straight)
      move();
      turnTick = 10;
    } else if (angle == 180 && xcor % 50 == 25) {
      if (nextUp.canDrive()) choices.add("S"); //stay straight
      if (nextLeft.canDrive()) choices.add("L"); //go left
      if (nextRight.canDrive()) choices.add("R"); //go right

      int i = int(random(choices.size()));
      if (choices.get(i).equals("L")){
        angle = 270;
        xcor -= width / 2;
      }
      if (choices.get(i).equals("R")){
        angle = 90;
        xcor -= width / 2;
      }
      //else do nothing (stay straight)
      move();
      turnTick = 10;
    } else if (angle == 90 && ycor % 50 == 25) {
      if (nextUp.canDrive()) choices.add("S"); //stay straight
      if (nextLeft.canDrive()) choices.add("L"); //go left
      if (nextRight.canDrive()) choices.add("R"); //go right

      int i = int(random(choices.size()));
      if (choices.get(i).equals("L")){
        angle = 180;
        ycor -= width / 2;
      }
      if (choices.get(i).equals("R")){
        angle = 0;
        ycor -= width / 2;
      }
      //else do nothing (stay straight)
      move();
      turnTick = 10;
    } else if (angle == 270 && ycor % 50 == 25) {
      if (nextUp.canDrive()) choices.add("S"); //stay straight
      if (nextLeft.canDrive()) choices.add("L"); //go left
      if (nextRight.canDrive()) choices.add("R"); //go right

      int i = int(random(choices.size()));
      if (choices.get(i).equals("L")){
        angle = 0;
        ycor -= width / 2;
      }
      if (choices.get(i).equals("R")){
        angle = 180;
        ycor -= width / 2;
      }
      //else do nothing (stay straight)
      move();
      turnTick = 10;
    }
  }


>>>>>>> ben


  //accessors: 
  public float getX() {
    return xcor;
  }

  public float getY() {
    return ycor;
  }

  public GridSquare current() {
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

  //more mutators: setting the adjacent squares
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
}