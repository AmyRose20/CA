T_Button b1; // Creating an object instance of the 'T_Button' class called 'b1'
Identifier_Button b2; // Creating an object instance of the 'Identifier_Button' class called 'b2'
Identifier id1;  // Creating an object instance of the 'Identifier' class called 'id1'
Spaceship ship; // Creating an instance of the 'Spaceship' class called 'ship'
Target t1; // Creating an instance of the 'Target' class called 't1'
Radar radar; // Creating an instance of the 'Radar' class called 'radar'
/* 'Stat_Button1' and 'Stat_Button2' are extended classes fromt the 'Stat_Button' class */
Stat_Button1 stat_button;
Stat_Button2 stat_button2;

// PImage is a built in class that will encapsulate information
PImage[] p = new PImage[6]; // Using an array of type PImage to store five images called 'p'. These images are the planets images.
PImage[] a = new PImage[4]; // The images in this array are the asteroid images.

PImage boom; // Image will briefly display when a star or asteroid is removed from their designated ArrayLists

Planet[] planets = new Planet[6]; // Using an array to store five 'Planet' objects called 'planets'
ArrayList<Star> stars; // Using an ArrayList to store objects of the 'Star' class called 'stars'
ArrayList<Asteroid> asteroids;
float xpos = 1336 + 100; // global variable passed to the 'asteroids' ArrayList type 'Asteroid' class when creating a new instance within the ArrayList

String[] planet_names = {"JUPITER", "TITAN", "DAGOBAH", "KAMINO", "MUSTAFAR", "TATOOINE"}; // A string array used to pass the name of each planet to the constructor in 'Planet'
float[] planet_ypos = {40, 100, 200, 250, 300, 400}; // An array of type float to pass the y-axis position of the planets to the constructor in 'Planet'

int removed_stars = 0; // Variable will count the number of stars that the user has 'deleted' ie, the amount of stars that have been removed form the 'stars' ArrayList
int removed_asteroids = 0; // Variable will count the amount of asteroids that have been removed form thr 'asteroids' ArrayList

// 'controlP5' is a library imported to the sketch
import controlP5.*;
// A built in class in 'controlP5' called 'ControlP5'
ControlP5 cp5; // Creating an instance of that class
int music = 0; // Variable will be initial value of the interavtive button created from the 'ControlP5' class
// Using an imported library called 'Minum'. 'import' will allow information from the 'Minim' library to load in
import ddf.minim.*;
// A built in class in Minim called 'Minum'
Minim minim;
// Another built in class called 'AudioPlayer' which will contain the mp3 file
AudioPlayer player;
AudioPlayer laser;

void setup()
{
  /* All measurments are in realation to the size of my screen: 1366 x 768 */
  fullScreen();
  b1 = new T_Button(); // Initiliasing 'b1' as a new 'Button' object
  b2 = new Identifier_Button();
  id1 = new Identifier();
  t1 = new Target();
  ship = new Spaceship();
  radar = new Radar();
  stat_button = new Stat_Button1();
  stat_button2 = new Stat_Button2();
  
  boom = loadImage("boom.png"); // Loading an image into the variable 'boom' that is a PImage datatype
  
  stars = new ArrayList<Star>(); // Initiliasing 'stars' and assign it as an ArrayList of 'Star' objects
  for(int i = 0; i < 150;  i++)
  {
    stars.add(new Star()); // Adding 150 'Star' objects to the ArrayList 'stars'
  } 
  
  // Loading images 
  for(int i = 0; i < planets.length; i++)
  {
    /* Image will be loaded from the same directory that has the string "planet"
    at it's start and will take the value of i and add that to the string followed
    by "png" which will continue through the loop while i < planets.length
    */
    p[i] = loadImage("planet"+i+".png");
    /* A new 'Planet' object will be created and stored in the 'planets' array
    and will pass on a new PImage type from the PImage array 'p' to the constructor
    in the 'Planet' class, where it will be used in the display() function
    */
    planets[i] = new Planet(p[i], planet_names[i], planet_ypos[i]);
  }
  
  asteroids = new ArrayList<Asteroid>(); // Initiliasing 'asteroids' and assign it as an ArrayList of 'Asteroid' objects
  for(int i = 0; i < 4; i++)
  {
    a[i] = loadImage("asteroid"+i+".png");
    asteroids.add(new Asteroid(a[i]));
  }
  
  minim = new Minim(this); // Initialiasing 'minum' as a new 'Minum' object
  player = minim.loadFile("01 - Dead Already.mp3"); // Like the loadImage, minum.loadFile will load an mp3 file from the same directory
  player.loop(); // .loop() will replay the song once it has finished
  laser = minim.loadFile("Laser.mp3");
  
  cp5 = new ControlP5(this); // Initialiasing 'cp5' as a new 'ControlP5' object
  
  /* add a horizontal slider, the value of this slider will be linked
  to the variable 'music' */
  cp5.addSlider("music")
  .setPosition(100, (height / 100) * 95)
  .setRange(0, 1); // When the slider goes from a minimum of 0 ont it's left hand side, to a maximum value of 1 on it's right hand side
}

void draw()
{
  /* When the stat_button is clicked, it will go to the view_stats() function and
  display the page differently. */
  if(stat_button.clicked)
  {
    view_stats();
  }
  else
  {
    background(0);
    draw_planets(); // Function will draw planets and their functionalitites
    draw_stars();  // Function will draw stars and their functionalitites
    draw_asteroids(); // Function will draw asteroids and functionalitites associated with it where allowed
 
    ship.display(); // Display the intance 'ship' of the 'Ship' object type
    b1.display_b(); // Display the intance 'b1' of the 'Button' object type
    b2.display_i(); // Display the intance 'b2' of the 'Identifier_Button' object type
    radar.draw_radar(); // Display the intance 'radar' of the 'Radar' object type
      
    /* If the boolean variable 'light' is true within the 'Identifier_Button' object for this particular instance, 
    these functions within the 'Asteroid' class and the 'Planet' class will be used. These functions will check if
    the mouses current position is within the distance of the objects centre and edge and will display if it is an asteroid or a named
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
   
   /* A similar functionality as the if statement above takes place here. If the boolean variable light is true within the 'T_Button' 
   object of the 'b1' instance, the function will pass the mouses x, y current values and check if they are within the planet images.
   If they are, a messsage will display. */
    if(b1.on)
    {
      for(int i = 0; i < planets.length; i++)
      {
         planets[i].scan(mouseX, mouseY); 
      }
    }
    
    stat_button.stat_button(); // Function comes from the 'Stat_Button' class
    /* As the stat_button is in the 'Stat_Button1' class, an extension of the 'Stat_Button'
    class, this function is individual to this particular class that other class extensions like
    'Stat_Button2 will not have. */
    stat_button.text_display(); 
    
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
  }
  wave_length(); // Function displays the wave length lines within a black rectangle
  fill(0,0,139);
  textSize(15);
  text("Play music", 110, 700);
}

void mousePressed()
{
  /* When the mouse is pressed and b2.light = false, the x, y co-ordinates of the mouse will be passed to the function 'clicked_b' in the 
  'Button' class and assesssed if the mouses x, y co-ordinates < the radius of the circle using the dist() function, which means that
  the user will have clicked 'b1' */
  if(!b2.light)
  {
    b1.clicked_b(mouseX, mouseY);
  }
  /* A similar function happens here, the function will be carried out if the mouse is pressed and 'b1s' boolean variable 'on' is false. The 
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
  /* When the mouse is clicked and is within range specified in the if statement below, stat_button.clicked()
  will be carried out. */
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

// Function to draw stars
void draw_stars()
{
 for(int i = stars.size()-1; i >= 0; i--)
 {
   Star b = stars.get(i);
   b.display_stars(i);
   b.move();
   // If the instance of this object returns true from it's remove() function, it will remove the the instance.
   if(b.remove_s())
   {
     laser.rewind();
     laser.play();
     image(boom, b.xpos, b.ypos, 40, 40);
     stars.remove(i);
     stars.add(new Star());
     removed_stars++;
    }
  }
}

// Function to draw asteroids
void draw_asteroids()
{
 for(int i = asteroids.size()-1; i >= 0; i--)
 {
   Asteroid a1 = asteroids.get(i); // An ArrayList doesn't know what it is storing so we have to cast the object coming out, in this case as 'a1'
   a1.display();
   a1.move();
   /* If the instance of this object returns true from it's remove() function, it will remove the the instance and create a new one at
   an x position of 650. */
   if(a1.remove_a())
   {
    laser.rewind();
    laser.play();
    image(boom, a1.x, a1.y, 80, 80);
    asteroids.remove(i);
    asteroids.add(new Asteroid(a[i], xpos));
    removed_asteroids++;
   }
  }
}

// Function to draw the wave_lengths of the song when it is playing
void wave_length()
{
  fill(0);
  stroke(218, 112, 214);
  rect(350, 600, 160, 90);
  /* If the value of the integer 'music' is 1, which is the top range of the button-slider 'cp5' which is an 
  instance of the 'ControlP5' class, the song will play. If it was previously paused, it will continue playing from that 
  paaused position. */
  if(music == 1)
  {
    player.play();
    // Loop will draw the waves
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      stroke(255);
      /* The map() function will map the ranges of 'x1' and 'i' together. The ranges of
      'x1' is 350 and 510. The ranges of 'i' is 0 and player.bufferSize(). This will
      restrict the waves when drawn between the range of 350 and 510. */
      float x1 = map(i, 0, player.bufferSize(), 350, 510);
      float x2 = map(i+1, 0, player.bufferSize(), 350, 510);
      /* The values returned by and right.get() will be between -1 and 1
      each time through the loop, so they will be scaled up by 'player.right.get(i) * 50'
      and 'player.right.get(i+1) * 50'. */
      line(x1, 645 + player.right.get(i) * 50, x2, 645 + player.right.get(i+1) * 50);
    }
  }
  else
  {
    /* Song will pause and a simple white line will be displayed to give it the appearance that
    it is currently off. */
    player.pause();
    stroke(255);
    strokeWeight(3);
    line(350, 645, 510, 645);
  }
}

// Function to display stats. 
/* This function will display a different sketch on the canvas if the instance 'stat_buttons' varibale clicked
is true. It displays 'stat_button2' of the class 'Stat_Button2' which is an extension of the 'Stat_Button' class
along with two rectangles with some text in them with the values of the two integer datatype variables, 'removed_stars'
and 'removed_asteroids'. These variables are incremented by 1 each time a star or asteroid is removed from their 
designated ArrayList. The textSize must be specified so it does not remain the same size as the previous textSize used. */
void view_stats()
{
  background(95,158,160);
  stat_button2.stat_button();
  stat_button2.text_display();
  fill(255);
  rect(100, 50, 400, 400);
  rect(600, 50, 480, 400);
  textSize(40);
  fill(0);
  //PFont font;
  //font = loadFont("AgencyFB-Reg-48.vlw");
  //textFont(font, 60);
  text("Stars destroyed", 150, 100);
  text(removed_stars, 280, 300);
  text("Asteroids destroyed", 650, 100);
  text(removed_asteroids, 840, 300);
}