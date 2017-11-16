LButton b1;
Spaceship ship;
Target t1;
ArrayList<Star> stars;


 int SPREAD=64;
int CX,CY;
float SPEED=1.9;

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
}

void draw()
{
  background(0);
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

  