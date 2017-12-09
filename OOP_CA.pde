Button b1; // Creating an object instance of the 'Button' class called 'b1'
Identifier_Button b2; // Creating an object instance of the 'Identifier_Button' class called 'b2'
Identifier id1;  // Creating an object instance of the 'Identifier' class called 'id1'
Spaceship ship; // Creating an instance of the 'Spaceship' class called 'ship'
Target t1; // Creating an instance of the 'Target' class called 't1'
Radar radar;
Stat_Button stat_button;

// PImage is a built in class that will encapsulate information
PImage[] p = new PImage[6]; // Using an array of type PImage to store five images called 'p'
PImage[] a = new PImage[4];

PImage boom; // Image will briefly display when a star or asteroid is removed from their designated ArrayLists

Planet[] planets = new Planet[6]; // Using an array to store five 'Planet' objects called 'planets'
ArrayList<Star> stars; // Using an ArrayList to store objects of the 'Star' class called 'stars'
ArrayList<Asteroid> asteroids;
float xpos = 1366 + 50; // global variable passed to the 'asteroids' ArrayList type 'Asteroid' class when creating a new instance within the ArrayList

String[] planet_names = {"JUPITER", "TITAN", "DAGOBAH", "KAMINO", "MUSTAFAR", "TATOOINE"}; // A string array used to pass the name of each planet to the constructor in 'Planet'
float[] planet_ypos = {40, 100, 200, 250, 300, 400}; // An array of type float to pass the y-axis position of the planets to the constructor in 'Planet'

int removed_stars = 0;
int removed_asteroids = 0;

import controlP5.*;
ControlP5 cp5;


int sliderValue = 0;
// Using an imported library called 'Minum'. 'import' will allow information from the 'Minim' library to load in
import ddf.minim.*;
// A built in class in Minim called 'Minum'
Minim minim;
AudioPlayer player;

void setup()
{
  fullScreen();
  b1 = new Button(); // Initiliasing 'b1' as a new 'Button' object
  b2 = new Identifier_Button();
  id1 = new Identifier();
  t1 = new Target();
  ship = new Spaceship();
  radar = new Radar();
  stat_button = new Stat_Button();
  
  boom = loadImage("boom.png");
  
  stars = new ArrayList<Star>(); // Initiliasing 'stars' and assign it as an ArrayList of 'Star' objects
  for(int i = 0; i < 150;  i++)
  {
    stars.add(new Star()); // Adding 150 'Star' objects to the ArrayList 'stars'
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
    planets[i] = new Planet(p[i], planet_names[i], planet_ypos[i]);
  }
  
  asteroids = new ArrayList<Asteroid>(); // Initiliasing 'asteroids' and assign it as an ArrayList of 'Asteroid' objects
  for(int i = 0; i < 4; i++)
  {
    a[i] = loadImage("asteroid"+i+".png");
    asteroids.add(new Asteroid(a[i]));
  }
  
  minim = new Minim(this);
  player = minim.loadFile("01 - Dead Already.mp3");
  
  
  
    cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("sliderValue")
     .setPosition(100, height - 100)
     .setRange(0,1);
}

void draw()
{
  if(stat_button.clicked)
  {
    background(0);
  }
  else
  {
    background(0);
    draw_planets();
    for(int i = stars.size()-1; i >= 0; i--)
    {
      Star b = stars.get(i);
      b.display_stars();
      b.move();
      // If the instance of this object returns true from it's remove() function, it will remove the the instance.
      if(b.remove_s())
      {
        image(boom, b.xpos, b.ypos, 40, 40);
        stars.remove(i);
        stars.add(new Star());
        removed_stars++;
      }
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
        image(boom, a1.x, a1.y, 80, 80);
        asteroids.remove(i);
        asteroids.add(new Asteroid(a[i], xpos));
        removed_asteroids++;
      }
    }
   }
    
   ship.display(); // Display the intance 'ship' of the 'Ship' object type
   b1.display_b(); // Display the intance 'b1' of the 'Button' object type
   b2.display_i(); // Display the intance 'b2' of the 'Identifier_Button' object type
    
   radar.draw_radar();
      
   /* If the boolean variable 'light' is true within the 'Identifier_Button' object, these functions within
   the 'Asteroid' class and the 'Planet' class will be used. These functions will check if the mouses current 
   position is within the distance of the objects centre and edge and will display if it is an asteroid or a named
   planet. */
   if(b2.light)
   {
     for(int i = asteroids.size()-1; i >= 0; i--)
     {
       Asteroid a1 = asteroids.get(i);
       a1.rollover(mouseX, mouseY);
     }
      
     for(int i = 0; i < planets.length; i++)
     {
       planets[i].rollover(mouseX, mouseY); 
     }
   }
   
   if(b1.on)
   {
     for(int i = 0; i < planets.length; i++)
     {
         planets[i].scan(mouseX, mouseY); 
     }
    }
    
   /* The instance of the object 't1' of object type 'Target' will only carry out it's display function if the boolean variable 'on' in 'b1' of 
   type 'Button' is true. */
   if(b1.on)
   {
     // TARGET
     t1.display_t();
   }
   if(b2.light)
   {
     // IDENTIFIER
     id1.display_id();
   }
   stat_button.stat_button();
   wave_length();
}


void mousePressed()
{
  /* When the mouse is pressed and b2.light = false, the x, y co-ordinates of the mouse will be passed to the function 'clicked_b' in the 
  'Button' class and assesssed if the mouses x, y co-ordinates are less then the radius of the circle using the dist() function, which means that
  the user will have clicked 'b1' */
  if(!b2.light)
  {
    b1.clicked_b(mouseX, mouseY);
  }
  /* A similar function happens here, the function will be carried out if the mouse is pressed and 'b1s' boolean variable on is false. The 
  function will check if the mouse is pressed within the centre and the edge of the rectangle shape. */
  if(!b1.on)
  {
    b2.clicked_i(mouseX, mouseY);
  }
  
  /* If the boolean variable 'on' is true, the user will be able to delete stars and asteroids when clicked. */
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

void mouseClicked()
{
  if(mouseX > width - 400 && mouseX < width - 400 + 200 && mouseY > height - 100 && mouseY < height - 100 + 45)
  {
    stat_button.clicked();
  }
}

// Function to draw planets
void draw_planets()
{
  for(int i = 0; i < planets.length; i++)
  {
    planets[i].move(); // Call each instance of the array 'planets' from it's template ('Planet'), and carry out the move function within the template
    planets[i].display(); // Call each instance of the array 'planets' from it's template ('Planet'), and carry out the display function within the template
  }
}

void wave_length()
{
  fill(0);
  rect(350, 600, 160, 90);
  if(sliderValue == 1)
  {
    player.play();
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      stroke(255);
      float x1 = map( i, 0, player.bufferSize(), 350, 510 );
      float x2 = map( i+1, 0, player.bufferSize(), 350, 510 );
      line( x1, 645 + player.right.get(i)*50, x2, 645 + player.right.get(i+1)*50 );
    }
  }
  else
  {
    player.pause();
    stroke(255);
    strokeWeight(3);
    line(350, 645, 510, 645);
  }
}
  