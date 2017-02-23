/*
Zane Alvarez
 Data_Visualization_3
 February 23, 2017
 Press the up and down arrow keys to switch between a scatter plot and a line graph to display the amount of incidents responded to by ATCEMS per month
 */


Table table;
int graph;

void setup() {
  size(1300, 680);
  //getting csv
  table = loadTable("EMS_-_Incidents_by_Month.csv", "header");
  graph = 0;
}

//switching between scatter and line
void keyPressed() {
  println("key pressed");
  if (keyCode == UP) {
    graph = 0;
    println("UP");
  }
  if (keyCode == DOWN) {
    graph = 1;
  }
}

void draw() {
  background(255);

  //title
  textAlign(CENTER);
  textSize(25);
  text("ATCEMS Incidents by Month", width/2, height/2+250);

  /*TableRow lastRow = table.getRow(table.getRowCount()-1);
   float nyear = lastRow.getFloat("Month Key");
   float nval = lastRow.getFloat("Austin Incidents");
   float nMap = map(nval, 6000, 11000, 100, 450);
   ellipse(75+(table.getRowCount()-1)*75, -nMap+400, 10, 10);
   // final point tick, line, and text
   line(75+(table.getRowCount()-1)*75, 35, 75+(table.getRowCount()-1)*75, 45);
   line(675, 35, 750, 35);
   textSize(10);
   text((table.getRowCount()-1)+1990, 75+(table.getRowCount()-1)*75, 20);
   */

  //variables
  for (int i = 0; i < table.getRowCount()-1; i++) {
    //getting rows
    TableRow row = table.getRow(i);
    TableRow nextRow = table.getRow(i+1);
    //TableRow nextRow = table.getRow(i+1);
    float year = row.getFloat("Month Key");
    float val = row.getFloat("Austin Incidents");
    float nVal = nextRow.getFloat("Austin Incidents");
    //maping for y axis
    float map = map(val, 6000, 11000, 100, 450);
    float nMap = map(nVal, 6000, 11000, 100, 450);

    fill(0);
    //switching between graphs
    if (graph == 0) {
      //scatter
      ellipse(75+i*15, -map+450, 10, 10);
    }
    if (graph == 1) {
      //line
      line(75+i*15, -map+450, 75+(i+1)*15, (-nMap+1)+450);
    }
    //x ticks
    line(75+i*15, 35, 75+(i)*15, 45);
    //year
    textSize(10);
    text((i+2010), 75+i*159, 30);
    if ( (75+i*75) < 525) {
      //incidents
      text(((-i+5)*1000)+5000, 15, 78+i*75);
      //y ticks
      line(35, 75+i*75, 45, 75+i*75);
    }
    //y axis
    line(35, 35, 35, 450);
    //x axis
    line(35, 35, 1185, 35);
  }
}
