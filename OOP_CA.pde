LButton b1;
Spaceship ship;
Target t1;
// PImage is a built in class that will encapsulate information
PImage[] p = new PImage[5];
PImage[] a = new PImage[3];
// Using an array to store five 'Planet' objects called 'planets'
Planet[] planets = new Planet[5];
// Using an ArrayList to store objects of the 'Star' class called 'stars'
ArrayList<Star> stars;
ArrayList<Asteroid> asteroids;

void setup()
{
  size(600, 600);
  b1 = new LButton();
  t1 = new Target();
  ship = new Spaceship();
  
  stars = new ArrayList<Star>();
  // Adding 100 'Star' objects to the ArrayList 'stars'
  for(int i = 0; i < 100;  i++)
  {
    stars.add(new Star());
  } 
  
  // Loading images 
  for(int i = 0; i < planets.length; i++)
  {
    /* Image will be loaded from same directory that has the string "planet"
    at it's start and will take the value of i and add that to the string followed
    by "png" which will continue through the loop while i < planets.length
    */
    p[i] = loadImage("planet"+i+".png");
    /* A new 'Planet' object will be created and stored in the 'planets' array
    and will pass on a new PImage type from the PImage array 'p' to the constructor
    in the 'Planet' class 
    */
    planets[i] = new Planet(p[i]);
  }
  asteroids = new ArrayList<Asteroid>();
  for(int i = 0; i < 3; i++)
  {
    a[i] = loadImage("asteroid"+i+".png");
    asteroids.add(new Asteroid(a[i]));
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
    for(int i = asteroids.size()-1; i >= 0; i--)
   {
    Asteroid a1 = asteroids.get(i);
    a1.display();
    a1.move();
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

  