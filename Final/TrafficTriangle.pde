public class TrafficTriangle {
  int firstX, firstY; //coordinates of the first point of the triangle
  int angle;
  boolean stop;

  public TrafficTriangle(int xcor, int ycor, int angle) {
    firstX = xcor;
    firstY = ycor;
    this.angle = angle % 360;
    stop = false;
  }

  public void drawMe() {
    if(stop){
      fill(255,0,0);
    }
    else{
      fill(0,255,85);
    }    
    if (angle == 0) {
      triangle(firstX, firstY, firstX - 5, firstY + 5, firstX - 5, firstY - 5);
    } else if (angle == 90) {
      triangle(firstX, firstY, firstX - 5, firstY + 5, firstX + 5, firstY + 5);
    } else if (angle == 180) {
      triangle(firstX, firstY, firstX + 5, firstY + 5, firstX + 5, firstY - 5);
    } else if (angle == 270) {
      triangle(firstX, firstY, firstX - 5, firstY - 5, firstX + 5, firstY - 5);
    }
    else{
      println("Invalid Angle for TrafficLight: " + angle);
    }
  }
}