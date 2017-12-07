class Planet
{
  // PImage contains pixel width/height
  PImage planet;
  float x = random(-20, 650);
  float y = random(-20, 325);
  float speed = random(0.1, 1);
  
  Planet(PImage tempPlanet)
  {
    planet = tempPlanet;
  }
  
  void move()
  {
   x = x - speed;
   if(x < -150)
   {
     x = width + 50;
   }
  }
  
  void display()
  {
    //tint(255, 0, 0);
    image(planet, x, y, 100, 100);
  }
}