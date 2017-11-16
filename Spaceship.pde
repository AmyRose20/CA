class Spaceship
{
  void display()
  {
    // May delete
    strokeWeight(2);
    stroke(191, 189, 189);
    fill(191, 189, 189);
    rect(0, height - 220, width, height);
    triangle(0, height - 280, width - 400, height - 220, 0, height - 220);
    triangle(width, height - 280, 400, height - 220, width, height - 220);
  }
}