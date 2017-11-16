class Star
{
  float xpos = random(0, width);
  float ypos = random(0, 320);
  float zpos = random(600);
  float sx = 0;
  float sy = 0;
  float r = 3;
  float speed = random(1, 3);
  
  int hit = 0;
   
  void move(float pos)
  {
    xpos = xpos - speed;
    if(xpos < 0)
    {
      xpos = width;
    }
   /* if(pos <= 25)
     {
        xpos = xpos + speed;
        if(xpos > width)
        {
          xpos = random(0, width);
        }
      }
     if(pos >= 75)
     {
       
       ypos = ypos - speed;
       if (ypos < -10)
       {
         ypos = random(0, 320);
       }
     }
     if(pos > 25 && pos <= 50)
     {
       xpos = xpos - speed;
       if(xpos < -10)
       {
         xpos = random(0, width);
       }
     }
     if(pos > 50 && pos < 75)
     {
       ypos = ypos + speed;
       if(ypos > 320)
       {
         ypos = random(0, 320);
       }
     }*/
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