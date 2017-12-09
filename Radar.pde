class Radar
{
  void draw_radar()
  {
    pushMatrix();
    int timer = second();
    translate(width - 680, height - 125);
    stroke(255,0,0);
    if (timer % 4 == 0)
    {
     fill(119, 136, 153);
    }
    else
    {
     fill(105, 105, 105);
    }
    ellipse(0,0, 150, 150);
    ellipse(0, 0, 115, 115);
    ellipse(0, 0, 80, 80);
    ellipse(0, 0, 45, 45);
    fill(255, 0, 0);
    ellipse(0, 0, 10, 10);
    rotate(radians(frameCount));
    line(0, 0, 75, 0);
  popMatrix();
  }
}