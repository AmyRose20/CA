class Identifier_Button
{
  // Properties/variables of the object
  float xpos = width - 400;
  float ypos =  height - 206;
  // Thes two variables are the centre of the rectangle's co-ordinates
  float center_x = 1066;
  float center_y = 584.5;
  
  // Boolean variables to test if the button is pressed 
  boolean light = false;
  boolean dark = true;
  
  // Functions of the object
  /* When the mouse is pressed this function will be carried out. The values of mouseX and mouseY will 
  be passed into the function and it's distance will be calculated between the button's center x and y position
  using the dist() function. This value will be stored in the variable 'd'. If the value of 'd' is < 45
  'light' will be true and 'dark' will be false. Functions within draw() and mousePressed() in 
  the main program will be able to be carried out depenidng on the value of 'light'. If the value of 'd' is > 45, 
  then 'light' will be false and 'dark' will remain true and no function within draw() or mousPressed() that need 
  'light' to be true will be carried out. */
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
    rect(xpos, ypos, 200, 45);
    fill(255);
    text("IDENTIFIER", 1025, 590);
  }
}