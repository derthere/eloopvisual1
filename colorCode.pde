//for the cirlce
int segs;
int steps = 8;
float rotAdjust = TWO_PI / segs / 4;
float radius;
float segWidth;

float interval = TWO_PI / segs;

XMLElement xml;
SensorData waterData;
SensorData VOCData;
SensorData tempData;
SensorData humidData;
SensorData soilData;

//make array for elements min, max, ave
ArrayList<DailyData> waterDailyValues;
ArrayList<DailyData> VOCDailyValues;
ArrayList<DailyData> tempDailyValues;
ArrayList<DailyData> humidDailyValues;
ArrayList<DailyData> soilDailyValues;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  ellipseMode(RADIUS);
  noStroke();

  // data structure setup
  xml = new XMLElement(this, "data.xml");
  waterData = new SensorData("water", xml);
  VOCData = new SensorData("VOC", xml);
  tempData = new SensorData("temperature", xml);
  humidData = new SensorData("humidity", xml);
  soilData = new SensorData("soil", xml);

  //make array for elements min, max, ave
  waterDailyValues = waterData.getDailyData();
  VOCDailyValues = VOCData.getDailyData();
  tempDailyValues = tempData.getDailyData();
  humidDailyValues = humidData.getDailyData();
  soilDailyValues = soilData.getDailyData();


  // make the diameter 90% of the sketch area
  radius = min(width, height) * 0.45;
  segWidth = radius / steps;

  //look for elements

    //make arrays for each day

  segs = waterDailyValues.size(); // divide segments according to time span

  Val2Color(); //assign color values to each
  displayData(); //plot circle graph
}


void displayData() {

  for (int i = 0; i < segs; i++)
  {

    fill(tempcolor[i]); //filling each arc cone section
    arc(width/2, height/2, radius, radius, 
    interval*i+rotAdjust, interval*(i+.9)+rotAdjust);

    fill(255);     //white gap
    arc(width/2, height/2, radius *.75, radius* .75, 
    interval*i+rotAdjust, interval*(i+1)+rotAdjust);

    fill(aircolor[i]); //filling each arc cone section
    arc(width/2, height/2, radius* .74, radius* .74, 
    interval*i+rotAdjust, interval*(i+.9)+rotAdjust);

    fill(255);    //white gap
    arc(width/2, height/2, radius* .49, radius* .49, 
    interval*i+rotAdjust, interval*(i+1)+rotAdjust);     

    fill(watercolor[i]); //filling each arc cone section
    arc(width/2, height/2, radius* .48, radius* .48, 
    interval*i+rotAdjust, interval*(i+.9)+rotAdjust); 

    fill(#FFFFFF);  //white gap  
    arc(width/2, height/2, radius* .23, radius* .23, 
    interval*i+rotAdjust, interval*(i+1)+rotAdjust);     

    fill(soilcolor[i]);    
    arc(width/2, height/2, radius* .22, radius* .22, 
    interval*i+rotAdjust, interval*(i+.9)+rotAdjust);
  }

  radius -= segWidth *2 ;
}
