LButton b1;
Spaceship ship;
Target t1;
// PImage is a built in class that will encapsulate information
PImage[] p = new PImage[5];
// Using an array to store five 'Planet' objects called 'planets'
Planet[] planets = new Planet[5];
// Using an ArrayList to store objects of the 'Star' class called 'stars'
ArrayList<Star> stars;

void setup()
{
  size(600, 600);
  b1 = new LButton();
  t1 = new Target();
  ship = new Spaceship();
  stars = new ArrayList<Star>();
  for(int i = 0; i < 100;  i++)
  {
    stars.add(new Star());
  } 
  
  for(int i = 0; i < planets.length; i++)
  {
    /* Image will be loaded from same directory that has the string "planet"
    as it's start and will take the value of i and add that to the string followed
    by "png" which will continue through the loop while i < planets.length
    */
    p[i] = loadImage("planet"+i+".png");
  }
  
  for(int i = 0; i < planets.length; i++)
  {
    /* A new 'Planet' object will be created and stored in the 'planets' array
    and will pass on a new PImage type from the PImage array 'p' to the constructor
    in the 'Planet' class 
    */
    planets[i] = new Planet(p[i]);
  }
}

void draw()
{
  background(0);
  for(int i = 0; i < planets.length; i++)
  {
    planets[i].move();
    planets[i].display();
  }
  if(b1.on)
  {
    t1.display_t();
  }
  ship.display(); 
  b1.display_b();
  for(int i = stars.size()-1; i >= 0; i--)
   {
    Star b = stars.get(i);
    b.display_stars();
    b.move(i);
    if(b.remove_s())
    {
      stars.remove(i);
    }
  }
}

void mousePressed()
{
  b1.clicked_b(mouseX, mouseY);
  if(b1.on)
  {
    for(int i = stars.size()-1; i >= 0; i--)
    {
      Star b = stars.get(i);
      b.clicked(mouseX, mouseY);
     }
   }
 }

  