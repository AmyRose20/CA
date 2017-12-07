class Asteroid
{
  // PImage contains pixel width/height
  PImage asteroid;
  float x = random(-20, 650);
  float y = random(-20, 325);
  float speed = random(0.1, 1);
  
  Asteroid(PImage tempAsteroid)
  {
    asteroid = tempAsteroid;
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
    pushMatrix();
    imageMode(CENTER);
    translate(x, y);
    rotate(-radians(frameCount));
    image(asteroid, 0, 0, 50, 50);
    popMatrix();
  }
}