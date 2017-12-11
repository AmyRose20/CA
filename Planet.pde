class Planet
{
  // PImage contains pixel width/height
  PImage planet; // Variable will store the image (from the PIMage array 'p' passed as a paramter when creating a new 'Planet' object in the 'planets' array
  float x = random(-20, 650); // Random value between -20 and 650 assigned for the planets x-axis postion
  float y; // This value will be obtained from the array 'planet_ypos' in OOP_CA, giving the planets y-axis position
  float speed = random(0.1, 1);
  String name;// This value will be obtained from  the array 'planet_names' in OOP_CA
  
  boolean rollover = false; // Variable associated with the identifier button, will remain false unless the identifier button is over a planet
  boolean no_go = false; // Varibale associated with the target button, will remain false unless the target button is over a planet
  
  // Object's constructor
  /*  This constructor comes from void setup(). The PImage array 'p' is first loaded and stored within the current index 'i' of
  the loop and then the array 'planetss' gets a new 'Planet' object added to it, while passing the 'p[i]' value to the
  constructor where it can be used. */
  Planet(PImage tempPlanet, String tempName, float tempYpos)
  {
    planet = tempPlanet;
    name = tempName;
    y = tempYpos;
  }
  
  // Functions of the object
  /* This function will decrement the x positon of the planet by 1 by the speed. Once the value of the x position is < 0, 
  it will be reset back to width + 50. it is slightly off the size of the canvas to give a more natural appearance
  when the planet's position is reset. */
  void move()
  {
   x = x - speed;
   if(x < -150)
   {
     x = width + 50;
   }
  }
  
  // Function will display the planet image with a unique x, y position and a height/width of 100
  void display()
  {
    image(planet, x, y, 100, 100);
    // Message in a rectangle box will display is rollover is true
    if(rollover)
    {
      noFill();
      stroke(255, 255, 0);
      rect(mouseX - 50, mouseY + 20, 90, 30);
      textSize(15);
      fill(255);
      text(name, mouseX - 45, mouseY + 40);
    }
    // Message in a rectangle box will display if no_go is true
    if(no_go)
    {
      noFill();
      stroke(255, 255, 0);
      rect(mouseX - 50, mouseY + 20, 200, 60);
      textSize(15);
      fill(255);
      text("You can't destroy planets,\nthis isn't the Death Star.", mouseX - 45, mouseY + 40);
    }
  }
  
  /* Function checks if the mouses current x, y position is over the image and will
  display the planets name if this is true. This function is only carried out if
  the identifier button has been pressed. */
  void rollover(float px, float py) 
  {
    float d = dist(px, py, x, y);
    if (d < 40)
    {
        rollover = true; 
    } 
    else 
    {
        rollover = false;

    }
  }
  
  /* Function checks if the mouses current x, y position is over the image. This function
  is only carried out if the target button has been pressed. */
  void scan(float px, float py) 
  {
    float d = dist(px, py, x, y);
    if (d < 40)
    {
       no_go = true;
    } 
    else 
    {
       no_go = false;
    }
  }
}
  