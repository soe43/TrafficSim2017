public class TrafficTriangle {
  int firstX, firstY; //coordinates of the first point of the triangle
  int angle;

  public TrafficTriangle(int xcor, int ycor, int angle) {
    firstX = xcor;
    firstY = ycor;
    this.angle = angle % 360;
  }

  public void drawMe() {
    if (angle == 0) {
      fill(0,255,85);
      triangle(firstX, firstY, firstX - 5, firstY + 5, firstX - 5, firstY - 5);
    } else if (angle == 90) {
      fill(0,255,85);
      triangle(firstX, firstY, firstX - 5, firstY + 5, firstX + 5, firstY + 5);
    } else if (angle == 180) {
      fill(0,255,85);
      triangle(firstX, firstY, firstX + 5, firstY + 5, firstX + 5, firstY - 5);
    } else if (angle == 270) {
      fill(0,255,85);
      triangle(firstX, firstY, firstX - 5, firstY - 5, firstX + 5, firstY - 5);
    }
    else{
      println("Invalid Angle for TrafficLight: " + angle);
    }
  }
}