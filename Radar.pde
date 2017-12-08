class Radar
{
  void draw_radar()
  {
    pushMatrix();
    int timer = second();
    translate(300,450);
    stroke(255,0,0);
    if (timer % 4 == 0)
    {
     fill(119, 136, 153);
    }
    else
    {
     fill(105, 105, 105);
    }
    ellipse(0,0, 100, 100);
    ellipse(0, 0, 75, 75);
    ellipse(0, 0, 50, 50);
    ellipse(0, 0, 25, 25);
    fill(255, 0, 0);
    ellipse(0, 0, 5, 5);
    rotate(radians(frameCount));
    line(0, 0, 50, 0);
  popMatrix();
  }
}