/**
 * TO-DO:
 * (Refactoring)
 * Create mutator and accessor methods
 *
 * @author Maksymilian Sekula
 * @version 13/4/2021
*/

class Wave{
  
  // Initialises the list needed to store the values for the wave 
  private float[] waveList = {};

  // Constructor
  public Wave()
  {
  }
  
  /**
   * Draws out the "Wave" on screen
   */
  public void show(){
    
    stroke(255);
    line(500, waveList[0], circle1.getSmallCircleXValue(), waveList[0]);
    noFill();
    
    // Draws Graph
    beginShape();
    for(int i = 0; i < waveList.length; i = i + 1){
      curveVertex(i + 500, waveList[i]);
    }
    endShape();
    
    // Deletes items in list outside of visible range
    while(waveList.length > 700){
      waveList = shorten(waveList);
    }
    
  }
  
  /**
  * Adds element to array
  * Takes one parameter:
  * yPosition - the y coordinate to add to the drawn out wave
  */
  public void appendToFront(float yPosition)
  {
    waveList = append(waveList, yPosition);
  }
  
  /**
  * Adds y position to end of array
  * Takes one parameter:
  * yPosition - the y coordinate to add to the drawn out wave
  */
  public float[] addToEnd(float yPosition)
  {
    waveList = reverse(waveList);
    waveList = append(waveList, yPosition);
    waveList = reverse(waveList);
    return waveList;
  }
  
  /**
   * @return The array of float values, which holds the 
   * y-value of each timestep of the wave generated
   */
  public float[] getWaveList()
  {
    return waveList;  
  }
  
  /**
   * Sets the list of y coordinates to another floating point value array
   */
  public void setWaveList(float[] newWaveList)
  {
    waveList = newWaveList;
  }
}
