public class Car {
  private float width;
  private float length;
  private float xcor;
  private float ycor;
  private float speed; //number of pixels moved per tick
  private float origSpeed; //keeping track of original speed (max speed)
  private float angle; //orientation of the car (0 to 360 degrees) 

  private GridSquare current;
  private GridSquare nextUp;
  private GridSquare nextLeft;
  private GridSquare nextRight;
  private GridSquare previous;

  private int turnTick = 10;

  private int stopTick;


  public Car(float x, float y, float orientation) { 
    //what should be set here?
    width = 15; 
    length = 30;
    xcor = x;
    ycor = y;
    speed = 1;
    origSpeed = 2.0;
    angle = orientation;
    // Map.updateCar(this);
  }

  public Car(float x, float y, float orientation, float speed) {
    width = 15;
    length = 30;
    xcor = x;
    ycor = y;
    this.speed = speed % 2.0 + 1.0; //either 1.0 or 2.0 
    origSpeed = 2.0;
    angle = orientation;
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
      ycor -= speed;
    } else if (angle == 180) { //going to the left
      xcor -= speed;
    } else { //going down (angle == 270)
      ycor += speed;
    }

    turnTick--;
  }

  //LATER: REQUIRES IMPLEMENTATION OF WILL'S STOPLIGHTS!!!
  //adjusting speed based on location of cars (later stoplights) in front of you
  public void adjustSpeed() {
    //EACH ROAD HAS AN ARRAYLIST OF CARS THAT ARE CURRENTLY ON IT!
    //should be edited in Car. Current is a road, so will work that way.
    Car next = getNextCar(); 
    if (next == null && !(nextUp.hasStopSign())) {
      //return gradually to origSpeed
      speed += (origSpeed - speed) / 250; //250 is a constant, subject to change

      if (speed > origSpeed) {
        speed = origSpeed;
      }

      return;
    }
    //otherwise:
    else if (next != null && !(nextUp.hasStopSign())) {
      //speed calculations:
      float distToCar = 0.0;
      if (angle == 0 || angle == 180) {
        distToCar = Math.abs(xcor - next.getX());
      }
      if (angle == 90 || angle == 270) {
        distToCar = Math.abs(ycor - next.getY());
      }

      //linear deceleration:
      //NEEDS TO SLOW DOWN FASTER (that's why I multiplied by 2.0)
      //this constant may need to change as I tweak the Cars' speeds
      speed -= 2.0 * (speed - next.getSpeed()) / distToCar;
    } else if (next == null && nextUp.hasStopSign()) {
      //FOR STOP SIGNS:
      float distToStopSign = 0.0;
      if (nextUp.hasStopSign()) {
        if (angle == 0) {
          distToStopSign = 50.0 - (xcor % 50);
        }
        if (angle == 180) {
          distToStopSign = xcor % 50;
        }
        if (angle == 90) {
          distToStopSign = ycor % 50;
        }
        if (angle == 270) {
          distToStopSign = 50 - (xcor % 50);
        }
      }

      speed -= 2.0 * speed / distToStopSign;
    } else {
      float distToCar = 0.0;
      if (angle == 0 || angle == 180) {
        distToCar = Math.abs(xcor - next.getX());
      }
      if (angle == 90 || angle == 270) {
        distToCar = Math.abs(ycor - next.getY());
      }

      float decSpeedCar = 2.0 * (speed - next.getSpeed()) / distToCar;

      //FOR STOP SIGNS:
      float distToStopSign = 0.0;
      if (nextUp.hasStopSign()) {
        if (angle == 0) {
          distToStopSign = 50.0 - (xcor % 50);
        }
        if (angle == 180) {
          distToStopSign = xcor % 50;
        }
        if (angle == 90) {
          distToStopSign = ycor % 50;
        }
        if (angle == 270) {
          distToStopSign = 50 - (xcor % 50);
        }
      }

      float decSpeedStopSign = 2.0 * speed / distToStopSign;

      if (decSpeedStopSign > decSpeedCar) {
        speed -= decSpeedStopSign;
      } else {
        speed -= decSpeedCar;
      }
    }

    //to prevent negative speed:
    if (speed < 0) {
      speed = 0;
    }
      
  }



  public Car getNextCar() {
    ArrayList<Car> cList = nextUp.carsHere();
    if (cList.size() == 0) {
      return null;
    }
    //otherwise:

    Car closestCar = cList.get(0);
    for (int i = 1; i < cList.size(); i++) {
      Car iCar = cList.get(i);
      if (angle == 0 && iCar.getX() < closestCar.getX()) {
        closestCar = iCar;
      }
      if (angle == 90 && iCar.getY() > closestCar.getY()) {
        closestCar = iCar;
      }
      if (angle == 180 && iCar.getX() > closestCar.getX()) {
        closestCar = iCar;
      }
      if (angle == 270 && iCar.getY() < closestCar.getY()) {
        closestCar = iCar;
      }
    }

    return closestCar;

    //check if any other Cars are on YOUR Road. If that's true, choose the closest car
    //if that's false, look at the next Road. 
    //what to do if it returns null? HANDLED!
    //probably best to use a Deque... YES USE A DEQUE!!! Not an ArrayList<Road>!!!
  }

  //Where car adds itself to the road it is currently on, unless already on it.
  public void updateRoadList() {
    current.addCar(this);
  }








  //turn the car!
  public void turn() {
    //added on the buffer to get rid of the double turning bug 
    if (turnTick > 0) {
      return;
    }

    ArrayList<String> choices = new ArrayList<String>(); 
    if (angle == 0 && Math.abs(xcor % 50 - 25) <= 1) {
      if (nextUp.canDrive() && nextUp.getHeading() == 0) choices.add("S"); //stay straight
      if (nextLeft.canDrive() && nextLeft.getHeading() == 90) choices.add("L"); //go left
      if (nextRight.canDrive() && nextRight.getHeading() == 270) choices.add("R"); //go right

      if (choices.size() == 0) return;

      int i = int(random(choices.size())); 
      if (choices.get(i).equals("L")) { //DONE   
        xcor = int(xcor / 50) * 50 + 25;
        angle = 90; 
        xcor -= width / 2; //precalculated adjustment
      }
      if (choices.get(i).equals("R")) {
        angle = 270; 
        xcor = int(xcor / 50) * 50 + 25;
        xcor -= width / 2; // xcor -= (widthCar) / 2;
      }
      //else do nothing (stay straight)
      move(); 
      turnTick = 10;
    } else if (angle == 180 && Math.abs(xcor % 50 - 25) <= 1) {
      if (nextUp.canDrive() && nextUp.getHeading() == 180) choices.add("S"); //stay straight
      if (nextLeft.canDrive() && nextLeft.getHeading() == 270) choices.add("L"); //go left
      if (nextRight.canDrive() && nextRight.getHeading() == 90) choices.add("R"); //go right

      if (choices.size() == 0) return;

      int i = int(random(choices.size())); 
      if (choices.get(i).equals("L")) { //DONE
        angle = 270; 
        xcor = int(xcor / 50) * 50 + 25;
        xcor -= width / 2;
      }
      if (choices.get(i).equals("R")) { //DONE
        angle = 90; 
        xcor = int(xcor / 50) * 50 + 25;
        xcor -= width / 2;
      }
      //else do nothing (stay straight)
      move(); 
      turnTick = 10;
    } else if (angle == 90 && Math.abs(ycor % 50 - 25) <= 1) {
      if (nextUp.canDrive() && nextUp.getHeading() == 90) choices.add("S"); //stay straight
      if (nextLeft.canDrive() && nextLeft.getHeading() == 180) choices.add("L"); //go left
      if (nextRight.canDrive() && nextRight.getHeading() == 0) choices.add("R"); //go right

      if (choices.size() == 0) return;

      int i = int(random(choices.size())); 
      if (choices.get(i).equals("L")) { //DONE
        angle = 180; 
        ycor = int(ycor / 50) * 50 + 25;
        ycor -= width / 2;
      }
      if (choices.get(i).equals("R")) { //DONE
        angle = 0; 
        ycor = int(ycor / 50 + 1) * 50.0 - 25;
        ycor -= width / 2;
      }
      //else do nothing (stay straight)
      move(); 
      turnTick = 10;
    } else if (angle == 270 && Math.abs(ycor % 50 - 25) <= 1) {
      if (nextUp.canDrive() && nextUp.getHeading() == 270) choices.add("S"); //stay straight
      if (nextLeft.canDrive() && nextLeft.getHeading() == 0) choices.add("L"); //go left
      if (nextRight.canDrive() && nextRight.getHeading() == 180) choices.add("R"); //go right

      if (choices.size() == 0) return;

      int i = int(random(choices.size())); 
      if (choices.get(i).equals("L")) { //DONE
        angle = 0; 
        ycor = int(ycor / 50) * 50 + 25;
        ycor -= width / 2;
      }
      if (choices.get(i).equals("R")) { //DONE
        angle = 180; 
        ycor = int(ycor / 50) * 50 + 25;
        ycor -= width / 2;
      }
      //else do nothing (stay straight)
      move(); 
      turnTick = 10;
    }
  }




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

  public GridSquare previous() {
    return previous;
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

  public void setPrevious(GridSquare g) {
    previous = g;
  }
}