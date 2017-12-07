class Star
{
  float xpos = random(0, width);
  float ypos = random(0, 320);
  float zpos = random(600);
  float sx = 0;
  float sy = 0;
  float r = random(0,3);
  float speed = random(1, 3);
  
  int hit = 0;
   
  void move(float pos)
  {
    xpos = xpos - speed;
    if(xpos < 0)
    {
      xpos = width;
    }
  }
  
  void clicked(float px, float py)
  {
    float d = dist(px, py, xpos, ypos);
    if(d < r)
    {
      hit = 1;
    }
    else
    {
      hit = 0;
    }
   }
   
   boolean remove_s()
   {
     if(hit == 1)
     {
       return true;
     }
     else
     {
       return false;
     }
   }
 
  void display_stars()
  {
    noStroke();
    fill(255);
    ellipse(xpos, ypos, r*2, r*2);
  }
}