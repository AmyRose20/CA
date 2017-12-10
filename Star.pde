class Star
{
  // Properties/variables of the object
  float xpos = random(0, width + 50); // The x-axis position of the star, containing a random value between 0 to width
  float ypos = random(0, 550); // The y-axis position of the star, containg a random value between 0 to 320
  float r = random(0, 3); // The radius of the star, containg a random value between 0 and 3 so the stars are different sizes
  float speed = random(1, 3); // The speed of the star, containing a random value between 1 and 3
  
  /* Variable will act as a boolean, checking if the user has clicked between a distance of the asteroid image's width/height
  and the current position of the mouse's x, y co-ordinates (mouseX, mouseY) This will be checked using the dist() function. */
  int hit = 0;
   
  // Functions of the object
  /* This function will decrement the x positon of the star by 1 by the speed. Once the value of the x position is < 0, 
  it will be reset back to width + 50. it is slightly off the size of the canvas to give a more natural appearance
  when the star's position is reset. */
  void move()
  {
    xpos = xpos - speed;
    if(xpos < 0)
    {
      xpos = width + 50;
    }
  }
  
  /* This function will only be possible if the user has clicked the object instance 'b1' first. Each time the mouse is pressed,
  the parameters of the mouse's current x, y co-ordinates will be passed to this function. They will be checked if the distance between
  them and the object's x, y position is less than the object's width/height. If it is the variable 'hit' will be assigned the value 1.
  If not, the variable will remain 0. */
  void star_clicked(float px, float py)
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
   
  /* This function will take place after the star_clicked() function. The variable 'hit' will have it's value checked and return a
  boolean value to the main programm (OOP_CA), within the draw() function depending on the value of 'hit'.  */
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
  
  /* This function will display the stars  onto the canvas using an ellispe that will draw the star  with no outline (noStroke()), white (fill(255))
  and with it's unique x position, y position and radius in the ellipse function.*/
  void display_stars()
  {
    noStroke();
    fill(255);
    ellipse(xpos, ypos, r*2, r*2);
  }
}