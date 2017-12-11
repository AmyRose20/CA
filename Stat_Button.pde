//Polymorphism
/* Each class that is an extension of this class will contain the information in this class along with their own individual 
information */

class Stat_Button
{
  float w = 200; // Width of the rectangle
  float h = 45; // Height of the rectangle 
  float xpos = width - 400; // Upper left corner of rectangle x-axis position
  float ypos = height - 100; // Upper left corner of rectangle y-axis position
  color text_color = color(50, 205, 50);
  color button_color = color(255);
  
  // Variable will hold true/false, depending on if the button is pressed
  boolean clicked = false;
  
  /* If the mouse is clicked, the mouseClicked() function will be carried out and if the mouse is clicked
  within the range specified in the if condition, clicked() will be carried out. If the clicked is currently false,
  it will become true, if it is currently false, it will become true. Depending on this variables value will either display
  the main sketch in draw() or will display a different sketch in the 'view_stat' function. */
  void clicked()
  {
    if(clicked)
    {
      clicked = false;
    }
    else if(!clicked)
    {
      clicked = true;
    }
  }
  
  // Function will display the button
  void stat_button()
  {
    stroke(0);
    fill(button_color);
    rect(xpos, ypos, w, h);
  }
}

/* 'Stat_Button1' is an extension of 'Stat_Button'.
It contains all the same properrties as 'Stat_Button'' but also 
has a unique text which it displays. Because it has a unique propety,
it is specified as 'Stat_Button1' in the main program and not 
'Stat_Button'. */
class Stat_Button1 extends Stat_Button
{
  void text_display()
  {
    textSize(15);
    fill(text_color);
    text("DISPLAY STATS", 1010, 695);
  }
}

/* 'Stat_Button2' is an extension of 'Stat_Button'. Like 
'Stat_Button1', it also has a unique text which it displays. */
class Stat_Button2 extends Stat_Button
{
  void text_display()
  {
    textSize(15);
    fill(text_color);
    text("Click to return!", 1010, 695);
  }
}