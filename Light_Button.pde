class LButton
{
  float xpos = 60;
  float ypos = 400;
  float r = 12;
  
  boolean on = false;
  boolean off = true;
  
  void clicked_b(float px, float py)
  {
    float d = dist(px, py, xpos, ypos);
    if( d < r)
    {
      if(off)
      {
        on = true;
        off = false;
      }
      else if(on)
      {
       on = false;
       off = true;
      }
    }
  }
  
  void display_b()
  {
    if(on)
    {
       stroke(217, 25, 25);
       fill(255, 0, 0);
    }
    else
    {
      stroke(140, 3, 3);
      fill(215, 25, 25);
    }
    ellipse(xpos, ypos, r*2, r*2);
  }
}