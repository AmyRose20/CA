class Button
{
  // Properties/variables of the object
  float xpos = 60;
  float ypos = 400;
  float r = 12;
  
  // Boolean variables to test if the button is pressed 
  boolean on = false;
  boolean off = true;
  
  // Functions of the object
  /* When the mouse is pressed this function will be carried out. The values of mouseX and mouseY will 
  be passed into the function and it's distance will be calculated between the button's x and y position
  ussing the dist() function. This value will be stored in the variable 'd'. If the value of 'd' is < the 
  radius of the button 'on' will be true and 'off' will be false. Function within draw() and mousePressed() in 
  the main program will be able to be carried out. If the value of 'd' is > the radius, then 'on' will be false 
  and 'off' will remain true and no function within draw() or mousPressed() that need on to be 
  true will be carried out. */
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
  
  /* Function will display the button and depending on the value of the boolean variable 'on' the colour 
  of the button will change. */
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