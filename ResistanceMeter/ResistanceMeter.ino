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
static const unsigned short nformats = sizeof(lcdFormats) / sizeof(char);    
static const short supplyVoltage = 5;
static const double voltageConst = supplyVoltage / 1024.0;
static const double referenceResistances[] = { 110.0, 9990.0, 10000000.0 };
static double referenceResistance;
static const unsigned short maxRanges = 3;
static unsigned short currentRange = 2;
static const unsigned short maxMeasurements = 300;
static const unsigned short measurementIterations = 15;

void setup()
{
    pinMode(RANGE_1_PIN, OUTPUT);
    pinMode(RANGE_2_PIN, OUTPUT);
    pinMode(RANGE_3_PIN, OUTPUT);
    pinMode(MEASURE_COMMAND_PIN, INPUT);
    pinMode(RANGE_SELECT_PIN, INPUT);
    pinMode(LED_BUILTIN, OUTPUT);
    lcd.begin(LCD_COLUMNS, LCD_ROWS);

    selectRange(currentRange);  // select the starting measuring range
}

void loop()
{
    static bool rangeSelectSwitchState;
    static bool prevRangeSelectSwitchState = false;
    static bool measureCommandSwitchState;
    static bool prevMeasureCommandSwitchState = false;
    static bool canReset = false;  // request the user to reset
    short adcVoltageVal;
    double measuredResistance;

    // check if the unknown resistance is in the wrong measuring range
    adcVoltageVal = analogRead(MEASURING_PIN);
    lcd.setCursor(13, 0);
    if (adcVoltageVal <= 1)
        lcd.print("l!");
    else if (adcVoltageVal >= 1022)
        lcd.print("H!");
    else
        lcd.print("  ");
 
    // measure the unknown resistance
    measureCommandSwitchState = digitalRead(MEASURE_COMMAND_PIN);
    if (measureCommandSwitchState != prevMeasureCommandSwitchState) {
        if (measureCommandSwitchState == HIGH) {            
            if (canReset) {
                // clear the lcd and prepare for another measurement
                selectRange(currentRange);
                canReset = false;
            } else {
                for (register short i = 0; i < measurementIterations; ++i) {
                    measuredResistance = measureResistance(maxMeasurements / measurementIterations);
                    lcd.setCursor(0, 1);
                    printResistance(measuredResistance, 2);
                    // flash the Arduino's builtin LED
                    digitalWrite(LED_BUILTIN, HIGH);
                    delay(20);
                    digitalWrite(LED_BUILTIN, LOW);
                }
                // require the user to perform a reset
                lcd.setCursor(15, 0);
                lcd.print('R');
                canReset = true;  
            }
        }
        prevMeasureCommandSwitchState = measureCommandSwitchState;
    }

    // select the measuring range
    if (!canReset) {
        rangeSelectSwitchState = digitalRead(RANGE_SELECT_PIN);
        if (rangeSelectSwitchState != prevRangeSelectSwitchState) {
            if (rangeSelectSwitchState == HIGH) {
                if (currentRange >= maxRanges)  // reset the range counter
                    currentRange = 0;
                selectRange(++currentRange);
            }
            prevRangeSelectSwitchState = rangeSelectSwitchState;
        }
    }
    delay(10);
}

/*
 * Measure the unknown resistance by reading the analogue value
 * of the MEASURING_PIN and performing the necessary calculations
 * a number of times. The resulting resistance is the average of all
 * performed calculations.
 */
double measureResistance(unsigned short measurementsLimit)
{
    short adcVoltageVal;
    double measuredResistance;
    
    for (register short m = 0; m < measurementsLimit; ++m) {
        adcVoltageVal = analogRead(MEASURING_PIN);
        measuredResistance += calculateResistance(adcVoltageVal);
        delay(10);  // delay the measurements slightly
    }
    measuredResistance /= measurementsLimit;
    return measuredResistance;
}

/*
 * Calculate the unknown resistance via a voltage divider construction
 * (See project schematics for a better understanding 
 * of the following calculations)
 */
double calculateResistance(short adcVoltageVal)
{
    double referenceVoltage;  // the voltage applied to the reference resistance
    double measuredCurrent;
    double measuredResistance;
    
    referenceVoltage = min(max(adcVoltageVal, 1), 1022) * voltageConst;
    measuredCurrent = referenceVoltage / referenceResistance;
    measuredResistance = (supplyVoltage - referenceVoltage) / measuredCurrent;
    return measuredResistance;
}

/*
 * Change the measuring reference resistance
 * and write the new value to the lcd
 */
void selectRange(short range)
{
    // switch to the selected range on the circuit
    for (register short pin = 0; pin < maxRanges; ++pin)
        digitalWrite(RANGE_1_PIN + pin, (pin == range-1) ? HIGH : LOW);
    
    // display the new reference resistance
    referenceResistance = referenceResistances[range-1];
    lcd.clear();
    lcd.print("Range: ");
    printResistance(referenceResistance);
}

/*
 * Handle the printing of the parsed resistance to the lcd
 * 
 * Be aware that this function neither sets the position of the
 * lcd cursor, nor does it clear it.
 */
void printResistance(double resistance)
{
    short *formattedReference = lcdFormatParameter(resistance);
    lcd.print(formattedReference[0]);
    if (formattedReference[1] != lcdNoSign)
        lcd.print((char)formattedReference[1]);
    lcd.print(lcdOhmSign);
    delete[] formattedReference;
}

/*
 * Handle the printing of the parsed resistance to the lcd
 * 
 * Be aware that this function neither sets the position of the
 * lcd cursor, nor does it clear it.
 */
void printResistance(double resistance, unsigned short digits)
{
    double *formattedReference = lcdFormatParameter(resistance, digits);
    lcd.print(formattedReference[0], digits);
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
 * The decimal part is rounded to that many digits as passed to the function as an argument.
 * However, since the decimal part would only ever have a noticable effect
 * if the parameter has a small value (< 1000 for the purposes of this functiton),
 * the decimal part is ignored above the specified threshold because
 * attempting to round a big number via the used method may lead to an overflow.
 *
 * NOTE: do not forget to delete the returned double array after
 *       having finished working with it
 */
double *lcdFormatParameter(double value, unsigned short digits)
{
    short selectedFormat = nformats / 2;
    double *formattedResult;

    value = (value < 1000) ? round(value * pow(10, digits)) / pow(10, digits) : round(value);
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

