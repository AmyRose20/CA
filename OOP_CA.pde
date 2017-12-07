LButton b1; // Creating an instance of the 'LButton' class called 'b1'
Spaceship ship; // Creating an instance of the 'Spaceship' class called 'ship'
Target t1; // Creating an instance of the 'Target' class called 't1'
// PImage is a built in class that will encapsulate information
PImage[] p = new PImage[5]; // Using an array of type PImage to store five images called 'p'
PImage[] a = new PImage[3];
Planet[] planets = new Planet[5]; // Using an array to store five 'Planet' objects called 'planets'
ArrayList<Star> stars; // Using an ArrayList to store objects of the 'Star' class called 'stars'
ArrayList<Asteroid> asteroids;
float xpos = 650; // global variable passed to the 'asteroids' ArrayList type 'Asteroid' class when creating a new instance within the ArrayList

void setup()
{
  size(600, 600);
  b1 = new LButton(); // Initiliasing 'b1' as a new 'LButton' object
  t1 = new Target();
  ship = new Spaceship();
  
  stars = new ArrayList<Star>(); // Initiliasing 'stars' and assign it as an ArrayList of 'Star' objects
  for(int i = 0; i < 100;  i++)
  {
    stars.add(new Star()); // Adding 100 'Star' objects to the ArrayList 'stars'
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
  
  asteroids = new ArrayList<Asteroid>(); // Initiliasing 'asteroids' and assign it as an ArrayList of 'Asteroid' objects
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
    planets[i].move(); // Call each instance of the array 'planets' from it's template ('Planet'), and carry out the move function within the template
    planets[i].display(); // Call each instance of the array 'planets' from it's template ('Planet'), and carry out the display function within the template
  }
  for(int i = asteroids.size()-1; i >= 0; i--)
  {
    Asteroid a1 = asteroids.get(i); // An ArrayList doesn't know what it is storing so we have to cast the object coming out, in this case as 'a1'
    a1.display();
    a1.move();
    /* If the instance of this object returns true from it's remove() function, it will remove the the instance and create a new one at
    an x position of 650. */
    if(a1.remove_a())
    {
      asteroids.remove(i);
      asteroids.add(new Asteroid(a[i], xpos));
    }
  }
  for(int i = stars.size()-1; i >= 0; i--)
  {
    Star b = stars.get(i);
    b.display_stars();
    b.move();
    // If the instance of this object returns true from it's remove() function, it will remove the the instance.
    if(b.remove_s())
    {
      stars.remove(i);
    }
  }
  /* The instance of the object 't1' of object type 'Target' will only carry out it's display function if the boolean variable 'on' in 'b1' of 
  type 'LButton' is true. */
  if(b1.on)
  {
    t1.display_t(); 
  }
  
  ship.display(); // Display the intance 'ship' of the 'Ship' object type
  b1.display_b(); // Display the intance 'b1' of the 'LButton' object type
}

void mousePressed()
{
  /* When the mouse is pressed, the x, y co-ordinates of the mouse will be passed to the function clicked_b in the 
  'LButton' class and assesssed if the mouses x, y co-odinates are less then the radius of the circle using (dist), which means that
  the user will have clicked 'b1' */
  b1.clicked_b(mouseX, mouseY);
  /* If the boolean variable on is true, the user will be able to delete stars and asteroids when clicked. */
  if(b1.on)
  {
    for(int i = stars.size()-1; i >= 0; i--)
    {
      Star b = stars.get(i);
      b.star_clicked(mouseX, mouseY);
    }
    
    for(int i = asteroids.size()-1; i >= 0; i--)
    {
      Asteroid a1 = asteroids.get(i);
      a1.asteroid_clicked(mouseX, mouseY);
    }
  }
}

  