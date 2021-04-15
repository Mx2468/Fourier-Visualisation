/**
 * Bugs:
 * No change in number of circles with up/down arrow input
 * Wave line always drawn on top of display - 
 * 
 * General TODO:
 * Implement change of speed when left and right keys are pressed
 * Refactor the classes to decrease coupling
 * Change sizing to be dependent on system screen size
 * Create Coordinate class
 *
 * @author Maksymilian Sekula
 * @version 15/04/2021
 */

// Instantiates Class Fields
private Circle circle1;
private Wave wave1;
private int n;

// Constructor
void setup()
{
  // Instantiates new objects with default values
  size(1200, 600);
  n = 24;
  wave1 = new Wave();
  circle1 = new Circle(100, 200, n, wave1);
  
  wave1.appendToFront(circle1.getSmallCircleYValue());
} //<>//

/**
 * Main method of program to draw visualisation of the calculation
 */
void draw()
{
  if(focused){
    // Sets background, and draws the visualisation for every cycle when focused on the window
    background(0);
    circle1.show();
    wave1.show();
  }
}
