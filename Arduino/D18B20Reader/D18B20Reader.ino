#include <OneWire.h> 
#include <DallasTemperature.h>

#define ONE_WIRE_BUS 7 
OneWire oneWire(ONE_WIRE_BUS); 
DallasTemperature sensors(&oneWire);

void setup(void) 
{ 
  Serial.begin(115200);
  sensors.begin(); 
}
 
void loop(void) 
{ 
  digitalWrite(LED_BUILTIN, HIGH);
  sensors.requestTemperatures();
  Serial.print("T "); 
  Serial.println(sensors.getTempCByIndex(0));
  digitalWrite(LED_BUILTIN, LOW);
  delay(5000); 
}
