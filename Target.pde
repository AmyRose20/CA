class Target
{
  void display_t()
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 10, 10);
    line(mouseX, mouseY, mouseX, mouseY - 20);
    line(mouseX, mouseY, mouseX, mouseY + 20);
    line(mouseX - 20, mouseY, mouseX, mouseY);
    line(mouseX + 20, mouseY, mouseX, mouseY); 
  }
}