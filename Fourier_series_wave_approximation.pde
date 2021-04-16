/**
 * 
 * General TODO:
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
    
    text("Number of circles:"+circle1.getN()+"  Timestep:"+circle1.getTimestep(), 550, 580);
    
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
  switch(keyCode){
  // Number of circles controlled by up and down arrows
  case UP:
    circle1.incrementN();
    break;
  
  case DOWN:
    circle1.decrementN();
    break;
  
  // Time Step controlled by right and left arrows
  case RIGHT:
    circle1.doubleTime();
    break;
  
  case LEFT:
    circle1.halfTime();
    break;
    
  case SHIFT:
    circle1.resetTime();
    break;
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
