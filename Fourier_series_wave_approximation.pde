/**
 * 
 * General TODO:
 * Implement change of speed when left and right keys are pressed
 * Refactor the classes to decrease coupling
 * Change sizing to be dependent on system screen size
 * Create Coordinate class
 * Put key functionality from Circle into keyPressed()
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
    
    text("Number of circles:"+circle1.)
    
    circle1.show();
    wave1.show();
  }
}

/**
 * Called each time a key is pressed
 * handles the key press events of the program
 */
void keyPressed()
{
  // Number of circles controlled by up and down arrows
  if(keyCode == UP){
    circle1.incremenetN();
  }
  
  else if (keyCode == DOWN){
    circle1.decremenetN();
  }
  
  // Time Step controlled by right and left arrows
  else if(keyCode == RIGHT){
    circle1.doubleTime();
  }
  
  else if (keyCode == LEFT){
    circle1.halfTime();
  }
  
  // Selects which type of wave is shown 
  if (key == 'e'){
    circle1.setCalculationMode(WaveCalculationStatus.PULSE);
  }
  else if (key == 't'){
    circle1.setCalculationMode(WaveCalculationStatus.TRIANGLE);
  }
  else if (key == 'w'){
    circle1.setCalculationMode(WaveCalculationStatus.SAWTOOTH);
  }
  else if (key == 's'){
    circle1.setCalculationMode(WaveCalculationStatus.SQUARE);
  }
  
}
