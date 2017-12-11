class Radar
{
  // The 'Radar' class has one function which will draw the radar
  void draw_radar()
  {
   /* The pushMatrix() ensures that all translations and rotations until popMatrix() is declared will be saved and individual to the object
   between these two functions. */
   pushMatrix();
    int timer = second(); // This variable will act as a timer, storing the value of each second tht passes
    translate(width / 100 * 52.5, height / 100 * 92); // Translate will change point of origin from (0, 0) to the values assigned
    stroke(255,0,0);
    /* The backgorund of the radar will change colour every four seconds */
    if (timer % 4 == 0)
    {
     fill(119, 136, 153);
    }
    else
    {
     fill(105, 105, 105);
    }
    ellipse(0,0, 150, 150);
    ellipse(0, 0, 115, 115);
    ellipse(0, 0, 80, 80);
    ellipse(0, 0, 45, 45);
    fill(255, 0, 0);
    ellipse(0, 0, 10, 10);
    /* Rotate will change the angle of the line using radians as a unit of measurement, increasing the value each
    time in relation to the current value of frameCount. It will rotate around the new origin, stated in translate().
    Because the first point of the line is at the origin, this position will remain the same while the other point
    moves position. */
    rotate(radians(frameCount));
    line(0, 0, 75, 0);
   /* The popMatrix() function will reset all translations and rotations previously specified within pushMatrix() so that when used again,
   rotate() and translate() can have different values without effecting the previous translate() and rotate() */
   popMatrix();
  }
}