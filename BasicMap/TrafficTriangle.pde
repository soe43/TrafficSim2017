public class TrafficTriangle {
  int firstX, firstY; //coordinates of the first point of the triangle
  int angle;

  public TrafficTriangle(int xcor, int ycor, int angle) {
    firstX = xcor;
    firstY = ycor;
    this.angle = angle;
  }

  public void drawMe() {
    if (angle == 0) {
      triangle(firstX, firstY, firstX - 5, firstY + 5, firstX - 5, firstY - 5);
    } else if (angle == 90) {
      triangle(firstX, firstY, firstX - 5, firstY - 5, firstX + 5, firstY - 5);
    } else if (angle == 180) {
      triangle(firstX, firstY, firstX + 5, firstY + 5, firstX + 5, firstY - 5);
    } else {
      triangle(firstX, firstY, firstX - 5, firstY - 5, firstX + 5, firstY -5);
    }
  }
}