class Planet
{
  // PImage contains pixel width/height
  PImage planet;
  float x = random(-20, 650);
  float y = random(-20, 330);
  float speed = random(0.1, 1);
  String name;
  
  boolean rollover = false;
  
  // Object's constructor
  /*  This constructor comes from void setup(). The PImage array 'p' is first loaded and stored within the current index 'i' of
  the loop and then the array 'planetss' gets a new 'Planet' object added to it, while passing the 'p[i]' value to the
  constructor where it can be used. */
  Planet(PImage tempPlanet, String tempName)
  {
    planet = tempPlanet;
    name = tempName;
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
  
  // Function will display the planet image with a unique x, y postion and a height/width of fifty 
  void display()
  {
    image(planet, x, y, 100, 100);
    if(rollover)
    {
      noFill();
      rect(mouseX - 40, mouseY + 20, 80, 30);
      fill(255, 0, 0);
      fill(255, 0, 0);
      text(name, mouseX - 30, mouseY + 40);
    }
  }
  
  /* Function checks if the mouses current x, y position is over the image and will
  display the planets name if this is true*/
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
}