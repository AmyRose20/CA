class Identifier_Button
{
  // Properties/variables of the object
  float xpos = width - 400;
  float ypos =  height - 206;
  float w = 200;
  float h = 45;
  float center_x = 1066;
  float center_y = 584.5;
  
  // Boolean variables to test if the button is pressed 
  boolean light = false;
  boolean dark = true;
  
  // Functions of the object
  /* When the mouse is pressed this function will be carried out. The values of mouseX and mouseY will 
  be passed into the function and it's distance will be calculated between the button's center x and y position
  using the dist() function. This value will be stored in the variable 'd'. If the value of 'd' is < 20
  'light' will be true and 'dark' will be false. Function within draw() and mousePressed() in 
  the main program will be able to be carried out. If the value of 'd' is > 20, then 'light' will be false 
  and 'dark' will remain true and no function within draw() or mousPressed() that need on to be 
  true will be carried out. */
  void clicked_i(float px, float py)
  {
    float d = dist(px, py, center_x, center_y);
    if(d < 45)
    {
      if(dark)
      {
        light = true;
        dark = false;
      }
      else if(light)
      {
       light = false;
       dark = true;
      }
    }
  }
  
  /* Function will display the button and depending on the value of the boolean variable 'on' the colour 
  of the button will change. */
  void display_i()
  {
    if(dark)
    {
      stroke(0, 100, 0);
      fill(34, 139, 34);
    }
    else
    {
      stroke(34, 139, 34);
      fill(50, 205, 50);
    }
    rect(xpos, ypos, w, h);
    text("IDENTIFIER", 1025, 530);
  }
}

class Stat_Button 
{
  boolean clicked = false;
  
  void stat_button()
  {
    stroke(0);
    fill(255);
    rect(width - 400, height - 100, 200, 45);
  }
  
  void clicked()
  {
    clicked = true;
  }
}