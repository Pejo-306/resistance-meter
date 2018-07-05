#define MEASURING_PIN A0

static const int supplyVoltage = 5;
static const double voltageConst = supplyVoltage / 1024.0;
static const double referenceResistance = 10000000;
static int analogVal;
static double referenceVoltage;
static double measuredCurrent;
static double measuredResistance;

void setup()
{
    Serial.begin(9600);
}

void loop()
{
    analogVal = analogRead(MEASURING_PIN);
    referenceVoltage = analogVal * voltageConst;
    measuredCurrent = referenceVoltage / referenceResistance;
    measuredResistance = (supplyVoltage - referenceVoltage) / measuredCurrent;
    
    Serial.print("analog value: ");
    Serial.print(analogVal);
    Serial.print(", voltage(r), V: ");
    Serial.print(referenceVoltage);
    Serial.print(", current, mA: ");
    Serial.print(measuredCurrent * 1000);
    Serial.print(", resistance, (ohms): ");
    Serial.println(measuredResistance);

    delay(100);
}

