#include <OneWire.h> 
#include <DallasTemperature.h>

#define ONE_WIRE_BUS 7 
OneWire oneWire(ONE_WIRE_BUS); 
DallasTemperature sensors(&oneWire);
int lightLevel = A2;

void setup(void) 
{ 
  Serial.begin(115200);
  sensors.begin(); 
}
 
void loop(void) 
{ 
  digitalWrite(LED_BUILTIN, HIGH);
  sensors.requestTemperatures();
  Serial.print("T"); 
  Serial.print(sensors.getTempCByIndex(0));
  Serial.print(";L");
  Serial.println(analogRead(lightLevel));
  digitalWrite(LED_BUILTIN, LOW);
  delay(5000); 
}
