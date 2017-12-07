class Asteroid
{
  // Properties/variables of the object
  PImage asteroid; // PImage contains pixel width/height
  float x = random(-20, 650); // The x-axis position of the asteroid, containing a random value between -20 to 650 
  float y = random(-20, 330); // The y-axis position of the asteroid, containg a random value between -20 to 325
  float speed = random(1.5, 4); // The speed of the asteroid, containing a random value between 1.5 and 4
  
   /* Variable will act as a boolean, checking if the user has clicked between a distance of the asteroid image's width/height
   and the current position of the mouse's x, y co-ordinates (mouseX, mouseY) This will be checked using the dist() function. */
  int hit = 0;
  
  boolean rollover = false;
  
  // Object's constructors
  /*  This constructor comes from void setup(). The PImage array 'a' is first loaded and stored within the current index 'i' of
  the loop and then the ArrayList 'asteroids' gets a new 'Asteroid' object added to it, while passing the 'a[i]' value to the
  constructor where it can be used. */
  Asteroid(PImage tempAsteroid)
  {
    asteroid = tempAsteroid;
  }
  
  /* This second contrcutor is similar to the last one. However, this constructor is only executed if the 'Target' object 
  instance 't1' is activated and the mouse is pressed within the distance of the object's width/height. As the object gets
  deleted from the list, a new object instance is created in it's place, with a default x positon of 650, to avoid the 
  asteroid appearing out of nowhere in the middle of the canvas. */
  Asteroid(PImage tempAsteroid, float tempXpos)
  {
    asteroid = tempAsteroid;
    x = tempXpos;
  }
  
  // Functions of the object
  void move()
  {
    x = x - speed; // The object's x position is decremented each frame by the speed.
    if(x < -150)
    {
      x = width + 50; // The object's x postion will reset to 650, once it has reached width - 150 and it will return to the screen
    }
  }
  
  /* This function will only be possible if the user has clicked the object instance 'b1' first. Each time the mouse is pressed,
  the parameters of the mouse's current x, y co-ordinates will be passed to this function. They will be checked if the distance between
  them and the object's x, y position is less than the object's width/height. If it is the variable 'hit' will be assigned the value 1.
  If not, the variable will remain 0. */
  void asteroid_clicked(float px, float py)
  {
    float d = dist(px, py, x, y);
    if(d < 45)
    {
      hit = 1;
    }
    else
    {
      hit = 0;
    }
  }
  
  /* This function will take place after the asteroid_clicked() function. The variable 'hit' will have it's value checked and return a
  boolean value to the main programm (OOP_CA), within the draw() function depending on the value of 'hit'.  */
  boolean remove_a()
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
  
  /* This function will display the 'Asteroid' object image itself.*/
  void display()
  {
    /* The pushMatrix() ensures that all translations and rotations until popMatrix() is declared will be saved and individual to the object
    between these two functions. */
    pushMatrix();
    imageMode(CENTER); // used to ensure image rotates around it's center
    translate(x, y); // translate will change point of origin from (0, 0) to the random x, y values assigned
    /* rotate will change the angle of the object using radians as a unit of measurement, decreasing the value each
    time in relation to the current value of frameCount*/
    rotate(-radians(frameCount)); 
    image(asteroid, 0, 0, 50, 50);
    /* The popMatrix() function will reset all translations and rotations previously specified within pushMatrix() so that when used again,
    rotate() and translate() can have different values without effecting the previous translate() and rotate() */
    popMatrix();
    if(rollover)
    {
      strokeWeight(2);
      stroke(255, 255, 0);
      noFill();
      rect(mouseX - 40, mouseY + 20, 80, 30);
      fill(255, 0, 0);
      text("ASTEROID", mouseX - 30, mouseY + 40);
    }
  }
  
  void rollover(float px, float py) 
  {
    float d = dist(px, py, x, y);
    if (d < 50)
    {
        rollover = true; 
    } 
    else 
    {
        rollover = false;
    }
  }
}