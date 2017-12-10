//Polymorphism
/* Each class that is an extension of this class will contain the information in this class along with their own individual 
information */

class Stat_Button
{
  float w = 200;
  float h = 45;
  float xpos = width - 400;
  float ypos = height - 100;
  color text_color = color(50, 205, 50);
  color button_color = color(255);
  
  boolean clicked = false;
  
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
  
  void stat_button()
  {
    stroke(0);
    fill(button_color);
    rect(xpos, ypos, w, h);
  }
}

class Stat_Button1 extends Stat_Button
{
  void text_display()
  {
    textSize(15);
    fill(text_color);
    text("DISPLAY STATS", 1010, 695);
  }
}

class Stat_Button2 extends Stat_Button
{
  void text_display()
  {
    textSize(15);
    fill(text_color);
    text("Click to return!", 1010, 695);
  }
}