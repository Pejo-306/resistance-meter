#include <LiquidCrystal.h>

#define LCD_COLUMNS 16
#define LCD_ROWS 2
#define RANGE_1_PIN 2
#define RANGE_2_PIN 3
#define RANGE_3_PIN 4
#define MEASURE_COMMAND_PIN 5
#define RANGE_SELECT_PIN 6
#define LCD_D4_PIN 7
#define LCD_D5_PIN 8
#define LCD_D6_PIN 9
#define LCD_D7_PIN 10
#define LCD_ENABLE_PIN 11
#define LCD_RS_PIN 12
#define MEASURING_PIN A0

// initialize the lcd library
LiquidCrystal lcd(LCD_RS_PIN, LCD_ENABLE_PIN, LCD_D4_PIN, LCD_D5_PIN, LCD_D6_PIN, LCD_D7_PIN);

static const char lcdOhmSign = 222;
static const char lcdNoSign = 'E';  // should not be represented as a sign
static const char lcdFormats[] = { 'p', 'n', 234, 'm', 'E', 'k', 'M', 'T' };
static const short nformats = sizeof(lcdFormats) / sizeof(char);    
static const short supplyVoltage = 5;
static const double voltageConst = supplyVoltage / 1024.0;
static const double referenceResistances[] = { 110.0, 9990.0, 10000000.0 };
static double referenceResistance;
static const short maxRanges = 3;
static short currentRange = 2;

void setup()
{
    pinMode(RANGE_1_PIN, OUTPUT);
    pinMode(RANGE_2_PIN, OUTPUT);
    pinMode(RANGE_3_PIN, OUTPUT);
    pinMode(MEASURE_COMMAND_PIN, INPUT);
    pinMode(RANGE_SELECT_PIN, INPUT);
    lcd.begin(LCD_COLUMNS, LCD_ROWS);

    selectRange(currentRange);  // select the starting range
    double *formattedReference = lcdFormatParameter(0.001, 3);
    lcd.setCursor(0, 1);
    lcd.print(formattedReference[0]);
    if (formattedReference[1] != lcdNoSign)
        lcd.print((char)formattedReference[1]);
    lcd.print(lcdOhmSign);
    delete[] formattedReference;
}

void loop()
{
    static short analogVal;
    static double referenceVoltage;
    static double measuredCurrent;
    static double measuredResistance;
    static bool rangeSelectSwitchState;
    static bool prevRangeSelectSwitchState = false;
    static bool measureCommandSwitchState;
    static bool prevMeasureCommandSwitchState = false;

    // select the measuring range
    rangeSelectSwitchState = digitalRead(RANGE_SELECT_PIN);
    if (rangeSelectSwitchState != prevRangeSelectSwitchState) {
        if (rangeSelectSwitchState == HIGH) {
            if (currentRange >= maxRanges)  // reset the range counter
                currentRange = 0;
            selectRange(++currentRange);
        }
        prevRangeSelectSwitchState = rangeSelectSwitchState;
    }
    
    delay(10);
    
    /*
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
    */
}

/*
 * Change the measuring reference resistance
 * and write the new value to the lcd
 */
void selectRange(short range)
{
    short *formattedReference;
    
    // switch to the selected range on the circuit
    for (register short pin = 0; pin < maxRanges; ++pin)
        digitalWrite(RANGE_1_PIN + pin, (pin == range-1) ? HIGH : LOW);
    
    // display the new reference resistance
    referenceResistance = referenceResistances[range-1];
    formattedReference = lcdFormatParameter(referenceResistance);
    lcd.clear();
    lcd.print("Range: ");
    lcd.print(formattedReference[0]);
    if (formattedReference[1] != lcdNoSign)
        lcd.print((char)formattedReference[1]);
    lcd.print(lcdOhmSign);
    delete[] formattedReference;
}

/*
 * Represent the value of an electical parameter
 * as a (max) 3-digit value and an lcd symbol
 * 
 * The lcdFormats[] array holds values of the lcd's symbol table.
 * See the documentation of the lcd module for more details.
 * 
 * If the parsed value is bigger than 999 T or smaller than 1 p,
 * then the function returns a question mark ('?') which indicates
 * that the function cannot format the parsed value. However, these
 * values are rarely (if ever) used in practice.
 * 
 * NOTE: do not forget to delete the returned short array after
 *       having finished working with it
 */
short *lcdFormatParameter(double value)
{
    short selectedFormat = nformats / 2;
    short *formattedResult;

    formattedResult = new short[2];
    for (; value >= 1000; value /= 1000)
        selectedFormat++;
    for (; value < 1 && value != 0; value *= 1000)
        selectedFormat--;
    
    formattedResult[0] = round(value);
    formattedResult[1] = lcdFormats[selectedFormat];
    // indicate that the passed value is either too big or too small
    // for the purposes of this function
    if (selectedFormat < 0 || selectedFormat > nformats - 1)
        formattedResult[1] = '?';
    return formattedResult;
}

/*
 * Represent the value of an electical parameter
 * as a multi-digit value (3-digit integral and <variable>-digit decimal)
 * 
 * The lcdFormats[] array holds values of the lcd's symbol table.
 * See the documentation of the lcd module for more details.
 * 
 * If the parsed value is bigger than 999 T or smaller than 1 p,
 * then the function returns a question mark ('?') which indicates
 * that the function cannot format the parsed value. However, these
 * values are rarely (if ever) used in practice.
 * 
 * NOTE: do not forget to delete the returned double array after
 *       having finished working with it
 */
double *lcdFormatParameter(double value, unsigned short digits)
{
    short selectedFormat = nformats / 2;
    double *formattedResult;

    value = round(value * pow(10, digits)) / pow(10, digits);
    formattedResult = new double[2];
    for (; value >= 1000; value /= 1000)
        selectedFormat++;
    for (; value < 1 && value != 0; value *= 1000)
        selectedFormat--;
        
    formattedResult[0] = value;
    formattedResult[1] = (double) lcdFormats[selectedFormat];
    // indicate that the passed value is either too big or too small
    // for the purposes of this function
    if (selectedFormat < 0 || selectedFormat > nformats - 1)
        formattedResult[1] = '?';
    return formattedResult;
}

