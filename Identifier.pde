class Identifier 
{
   // The 'Identifier' class simply has one function which displays the object
  void display_id()
  {
   stroke(255, 255, 0);
   line(mouseX, mouseY, mouseX - 15, mouseY - 15);
   line(mouseX, mouseY, mouseX + 15, mouseY + 15);
   line(mouseX, mouseY, mouseX + 15, mouseY - 15);
   line(mouseX, mouseY, mouseX - 15, mouseY + 15);
   noFill();
   ellipse(mouseX, mouseY, 15*3, 15*3);
  }
}