/**
 * Bugs:
 * No change in number of circles with up/down arrow input
 * Wave line always drawn on top of display - 
 * 
 * General TODO:
 * Change all fields to private & create accessor and mutator methods
 * Implement change of speed when left and right keys are pressed
 * Refactor the classes to decrease coupling
 * Change sizing to be dependent on system screen size
 *
 * @author Maksymilian Sekula
 * @version 9/2/2020
 */

// Instantiates Class Fields
private Circle circle1;
private Wave wave1;
private int n;

// Constructor
void setup()
{
  size(1200, 600);
  n = 25;
  
  //Instantiates new objects with default values
  wave1 = new Wave();
  circle1 = new Circle(100, 200, n, wave1);
  
  wave1.appendToFront(circle1.getSmallCircleYValue()); //<>//
}

// Draw the visualisation of the calculations
void draw()
{    
  if (focused){
    // TODO: Work out how to increment the n number dynamically on screen
    //if (key == CODED){
    //  if (key == UP){
    //    n = n+1;
    //    circle1.incremenetN();
    //  }
    //  else if (key == DOWN){
    //    circle1.decremenetN();
    //    n = n-1;
    //  }
    //}
     
    // Sets background, and draws the visualisation for every cycle when focused
    background(0);
    circle1.show(); //<>//
    wave1.show(); 
  }
}
