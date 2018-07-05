EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:arduino
LIBS:ResistanceMeter-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Resistance Meter"
Date "2018-07-05"
Rev "1"
Comp "Petar Nikolov"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Arduino_Uno_Shield A_UNO1
U 1 1 5B3E0FD3
P 4200 2800
F 0 "A_UNO1" V 4300 2800 60  0000 C CNN
F 1 "Arduino_Uno_Shield" V 4100 2800 60  0000 C CNN
F 2 "" H 6000 6550 60  0001 C CNN
F 3 "" H 6000 6550 60  0001 C CNN
	1    4200 2800
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR01
U 1 1 5B3E1064
P 2700 3250
F 0 "#PWR01" H 2700 3000 50  0001 C CNN
F 1 "Earth" H 2700 3100 50  0001 C CNN
F 2 "" H 2700 3250 50  0001 C CNN
F 3 "" H 2700 3250 50  0001 C CNN
	1    2700 3250
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR02
U 1 1 5B3E1082
P 2700 3850
F 0 "#PWR02" H 2700 3700 50  0001 C CNN
F 1 "+5V" H 2700 3990 50  0000 C CNN
F 2 "" H 2700 3850 50  0001 C CNN
F 3 "" H 2700 3850 50  0001 C CNN
	1    2700 3850
	-1   0    0    1   
$EndComp
$Comp
L R R5
U 1 1 5B3E11BC
P 7650 3900
F 0 "R5" V 7730 3900 50  0000 C CNN
F 1 "220" V 7650 3900 50  0000 C CNN
F 2 "" V 7580 3900 50  0001 C CNN
F 3 "" H 7650 3900 50  0001 C CNN
	1    7650 3900
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5B3E138E
P 8450 3900
F 0 "R7" V 8530 3900 50  0000 C CNN
F 1 "10K" V 8450 3900 50  0000 C CNN
F 2 "" V 8380 3900 50  0001 C CNN
F 3 "" H 8450 3900 50  0001 C CNN
	1    8450 3900
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 5B3E13E8
P 8850 3900
F 0 "R8" V 8930 3900 50  0000 C CNN
F 1 "10M" V 8850 3900 50  0000 C CNN
F 2 "" V 8780 3900 50  0001 C CNN
F 3 "" H 8850 3900 50  0001 C CNN
	1    8850 3900
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR03
U 1 1 5B3E14AE
P 8450 4350
F 0 "#PWR03" H 8450 4100 50  0001 C CNN
F 1 "Earth" H 8450 4200 50  0001 C CNN
F 2 "" H 8450 4350 50  0001 C CNN
F 3 "" H 8450 4350 50  0001 C CNN
	1    8450 4350
	1    0    0    -1  
$EndComp
$Comp
L R_Variable Rm1
U 1 1 5B3E1ECF
P 8450 2450
F 0 "Rm1" V 8550 2350 50  0000 L CNN
F 1 "R_Variable" V 8350 2400 50  0000 L CNN
F 2 "" V 8380 2450 50  0001 C CNN
F 3 "" H 8450 2450 50  0001 C CNN
	1    8450 2450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 5B3E1F81
P 8450 2200
F 0 "#PWR04" H 8450 2050 50  0001 C CNN
F 1 "+5V" H 8450 2340 50  0000 C CNN
F 2 "" H 8450 2200 50  0001 C CNN
F 3 "" H 8450 2200 50  0001 C CNN
	1    8450 2200
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5B3E3220
P 7850 3900
F 0 "R6" V 7930 3900 50  0000 C CNN
F 1 "220" V 7850 3900 50  0000 C CNN
F 2 "" V 7780 3900 50  0001 C CNN
F 3 "" H 7850 3900 50  0001 C CNN
	1    7850 3900
	1    0    0    -1  
$EndComp
$Comp
L IRF540N Q2
U 1 1 5B3E365D
P 8350 3350
F 0 "Q2" H 8500 3550 50  0000 L CNN
F 1 "IRF540N" H 8500 3150 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 8600 3275 50  0001 L CIN
F 3 "" H 8350 3350 50  0001 L CNN
	1    8350 3350
	1    0    0    -1  
$EndComp
$Comp
L IRF540N Q1
U 1 1 5B3E36A6
P 7650 3350
F 0 "Q1" H 7800 3550 50  0000 L CNN
F 1 "IRF540N" H 7800 3150 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 7900 3275 50  0001 L CIN
F 3 "" H 7650 3350 50  0001 L CNN
	1    7650 3350
	1    0    0    -1  
$EndComp
$Comp
L LED D3
U 1 1 5B3E453C
P 6700 1600
F 0 "D3" H 6700 1700 50  0000 C CNN
F 1 "LED" H 6700 1500 50  0000 C CNN
F 2 "" H 6700 1600 50  0001 C CNN
F 3 "" H 6700 1600 50  0001 C CNN
	1    6700 1600
	0    -1   -1   0   
$EndComp
$Comp
L LED D2
U 1 1 5B3E4711
P 7000 1600
F 0 "D2" H 7000 1700 50  0000 C CNN
F 1 "LED" H 7000 1500 50  0000 C CNN
F 2 "" H 7000 1600 50  0001 C CNN
F 3 "" H 7000 1600 50  0001 C CNN
	1    7000 1600
	0    -1   -1   0   
$EndComp
$Comp
L LED D1
U 1 1 5B3E4765
P 7300 1600
F 0 "D1" H 7300 1700 50  0000 C CNN
F 1 "LED" H 7300 1500 50  0000 C CNN
F 2 "" H 7300 1600 50  0001 C CNN
F 3 "" H 7300 1600 50  0001 C CNN
	1    7300 1600
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 5B3E488E
P 6700 2000
F 0 "R3" V 6780 2000 50  0000 C CNN
F 1 "220" V 6700 2000 50  0000 C CNN
F 2 "" V 6630 2000 50  0001 C CNN
F 3 "" H 6700 2000 50  0001 C CNN
	1    6700 2000
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5B3E49A4
P 7000 2000
F 0 "R2" V 7080 2000 50  0000 C CNN
F 1 "220" V 7000 2000 50  0000 C CNN
F 2 "" V 6930 2000 50  0001 C CNN
F 3 "" H 7000 2000 50  0001 C CNN
	1    7000 2000
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5B3E49E9
P 7300 2000
F 0 "R1" V 7380 2000 50  0000 C CNN
F 1 "220" V 7300 2000 50  0000 C CNN
F 2 "" V 7230 2000 50  0001 C CNN
F 3 "" H 7300 2000 50  0001 C CNN
	1    7300 2000
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR05
U 1 1 5B3E4B7D
P 6700 2250
F 0 "#PWR05" H 6700 2000 50  0001 C CNN
F 1 "Earth" H 6700 2100 50  0001 C CNN
F 2 "" H 6700 2250 50  0001 C CNN
F 3 "" H 6700 2250 50  0001 C CNN
	1    6700 2250
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR06
U 1 1 5B3E4BBF
P 7000 2250
F 0 "#PWR06" H 7000 2000 50  0001 C CNN
F 1 "Earth" H 7000 2100 50  0001 C CNN
F 2 "" H 7000 2250 50  0001 C CNN
F 3 "" H 7000 2250 50  0001 C CNN
	1    7000 2250
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR07
U 1 1 5B3E4BFA
P 7300 2250
F 0 "#PWR07" H 7300 2000 50  0001 C CNN
F 1 "Earth" H 7300 2100 50  0001 C CNN
F 2 "" H 7300 2250 50  0001 C CNN
F 3 "" H 7300 2250 50  0001 C CNN
	1    7300 2250
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR08
U 1 1 5B3E5D17
P 7600 2250
F 0 "#PWR08" H 7600 2000 50  0001 C CNN
F 1 "Earth" H 7600 2100 50  0001 C CNN
F 2 "" H 7600 2250 50  0001 C CNN
F 3 "" H 7600 2250 50  0001 C CNN
	1    7600 2250
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5B3E5D52
P 7600 2000
F 0 "R4" V 7680 2000 50  0000 C CNN
F 1 "220" V 7600 2000 50  0000 C CNN
F 2 "" V 7530 2000 50  0001 C CNN
F 3 "" H 7600 2000 50  0001 C CNN
	1    7600 2000
	1    0    0    -1  
$EndComp
$Comp
L LED PWR_D1
U 1 1 5B3E6341
P 7600 1600
F 0 "PWR_D1" H 7600 1700 50  0000 C CNN
F 1 "LED" H 7600 1500 50  0000 C CNN
F 2 "" H 7600 1600 50  0001 C CNN
F 3 "" H 7600 1600 50  0001 C CNN
	1    7600 1600
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR09
U 1 1 5B3E64A1
P 7600 1350
F 0 "#PWR09" H 7600 1200 50  0001 C CNN
F 1 "+5V" H 7600 1490 50  0000 C CNN
F 2 "" H 7600 1350 50  0001 C CNN
F 3 "" H 7600 1350 50  0001 C CNN
	1    7600 1350
	1    0    0    -1  
$EndComp
$Comp
L HY1602E DS1
U 1 1 5B3E732F
P 7750 5450
F 0 "DS1" H 7500 4700 50  0000 C CNN
F 1 "NDS1602A V2" H 8050 4700 50  0000 C CNN
F 2 "Displays:HY1602E" H 7750 4550 50  0001 C CIN
F 3 "" H 7950 5550 50  0001 C CNN
	1    7750 5450
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR010
U 1 1 5B3E7E80
P 7750 6350
F 0 "#PWR010" H 7750 6100 50  0001 C CNN
F 1 "Earth" H 7750 6200 50  0001 C CNN
F 2 "" H 7750 6350 50  0001 C CNN
F 3 "" H 7750 6350 50  0001 C CNN
	1    7750 6350
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR011
U 1 1 5B3E7F94
P 8250 5650
F 0 "#PWR011" H 8250 5400 50  0001 C CNN
F 1 "Earth" H 8250 5500 50  0001 C CNN
F 2 "" H 8250 5650 50  0001 C CNN
F 3 "" H 8250 5650 50  0001 C CNN
	1    8250 5650
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 5B3E81E5
P 8500 5450
F 0 "R9" V 8580 5450 50  0000 C CNN
F 1 "220" V 8500 5450 50  0000 C CNN
F 2 "" V 8430 5450 50  0001 C CNN
F 3 "" H 8500 5450 50  0001 C CNN
	1    8500 5450
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR012
U 1 1 5B3E8873
P 7750 4550
F 0 "#PWR012" H 7750 4400 50  0001 C CNN
F 1 "+5V" H 7750 4690 50  0000 C CNN
F 2 "" H 7750 4550 50  0001 C CNN
F 3 "" H 7750 4550 50  0001 C CNN
	1    7750 4550
	1    0    0    -1  
$EndComp
$Comp
L POT RV1
U 1 1 5B3E899C
P 8400 4950
F 0 "RV1" V 8225 4950 50  0000 C CNN
F 1 "10K" V 8300 4950 50  0000 C CNN
F 2 "" H 8400 4950 50  0001 C CNN
F 3 "" H 8400 4950 50  0001 C CNN
	1    8400 4950
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR013
U 1 1 5B3E8AE7
P 8400 4700
F 0 "#PWR013" H 8400 4550 50  0001 C CNN
F 1 "+5V" H 8400 4840 50  0000 C CNN
F 2 "" H 8400 4700 50  0001 C CNN
F 3 "" H 8400 4700 50  0001 C CNN
	1    8400 4700
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR014
U 1 1 5B3E8CD2
P 8400 5200
F 0 "#PWR014" H 8400 4950 50  0001 C CNN
F 1 "Earth" H 8400 5050 50  0001 C CNN
F 2 "" H 8400 5200 50  0001 C CNN
F 3 "" H 8400 5200 50  0001 C CNN
	1    8400 5200
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR015
U 1 1 5B3E9335
P 7150 5150
F 0 "#PWR015" H 7150 4900 50  0001 C CNN
F 1 "Earth" H 7150 5000 50  0001 C CNN
F 2 "" H 7150 5150 50  0001 C CNN
F 3 "" H 7150 5150 50  0001 C CNN
	1    7150 5150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR016
U 1 1 5B3EB082
P 8750 5350
F 0 "#PWR016" H 8750 5200 50  0001 C CNN
F 1 "+5V" H 8750 5490 50  0000 C CNN
F 2 "" H 8750 5350 50  0001 C CNN
F 3 "" H 8750 5350 50  0001 C CNN
	1    8750 5350
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW1
U 1 1 5B3ED40D
P 3950 5250
F 0 "SW1" H 4000 5350 50  0000 L CNN
F 1 "SW_Push" H 3950 5190 50  0000 C CNN
F 2 "" H 3950 5450 50  0001 C CNN
F 3 "" H 3950 5450 50  0001 C CNN
	1    3950 5250
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR017
U 1 1 5B3ED5AD
P 3950 4950
F 0 "#PWR017" H 3950 4800 50  0001 C CNN
F 1 "+5V" H 3950 5090 50  0000 C CNN
F 2 "" H 3950 4950 50  0001 C CNN
F 3 "" H 3950 4950 50  0001 C CNN
	1    3950 4950
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5B3ED87F
P 3950 6200
F 0 "R10" V 4030 6200 50  0000 C CNN
F 1 "220" V 3950 6200 50  0000 C CNN
F 2 "" V 3880 6200 50  0001 C CNN
F 3 "" H 3950 6200 50  0001 C CNN
	1    3950 6200
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR018
U 1 1 5B3ED940
P 3950 6450
F 0 "#PWR018" H 3950 6200 50  0001 C CNN
F 1 "Earth" H 3950 6300 50  0001 C CNN
F 2 "" H 3950 6450 50  0001 C CNN
F 3 "" H 3950 6450 50  0001 C CNN
	1    3950 6450
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW2
U 1 1 5B3EE4C0
P 4350 5250
F 0 "SW2" H 4400 5350 50  0000 L CNN
F 1 "SW_Push" H 4350 5190 50  0000 C CNN
F 2 "" H 4350 5450 50  0001 C CNN
F 3 "" H 4350 5450 50  0001 C CNN
	1    4350 5250
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR019
U 1 1 5B3EE59E
P 4350 4950
F 0 "#PWR019" H 4350 4800 50  0001 C CNN
F 1 "+5V" H 4350 5090 50  0000 C CNN
F 2 "" H 4350 4950 50  0001 C CNN
F 3 "" H 4350 4950 50  0001 C CNN
	1    4350 4950
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 5B3EE5EB
P 4350 6200
F 0 "R11" V 4430 6200 50  0000 C CNN
F 1 "220" V 4350 6200 50  0000 C CNN
F 2 "" V 4280 6200 50  0001 C CNN
F 3 "" H 4350 6200 50  0001 C CNN
	1    4350 6200
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR020
U 1 1 5B3EE64C
P 4350 6450
F 0 "#PWR020" H 4350 6200 50  0001 C CNN
F 1 "Earth" H 4350 6300 50  0001 C CNN
F 2 "" H 4350 6450 50  0001 C CNN
F 3 "" H 4350 6450 50  0001 C CNN
	1    4350 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5550 4350 5550
Wire Wire Line
	4550 4200 4550 5550
Wire Wire Line
	5900 4200 4550 4200
Wire Wire Line
	5900 2150 5900 4200
Wire Wire Line
	5500 2150 5900 2150
Wire Wire Line
	6000 4300 6000 2050
Wire Wire Line
	4150 4300 6000 4300
Wire Wire Line
	4150 5550 4150 4300
Wire Wire Line
	3950 5550 4150 5550
Connection ~ 4350 5550
Wire Wire Line
	4350 5450 4350 5650
Wire Wire Line
	4350 6450 4350 6350
Wire Wire Line
	4350 5050 4350 4950
Wire Wire Line
	3950 6350 3950 6450
Connection ~ 3950 5550
Wire Wire Line
	6000 2050 5500 2050
Wire Wire Line
	3950 5050 3950 4950
Wire Wire Line
	3950 5450 3950 5650
Wire Wire Line
	7850 4150 7850 4050
Wire Wire Line
	7650 4150 7850 4150
Wire Wire Line
	7650 4050 7650 4150
Wire Wire Line
	7650 3650 7650 3750
Wire Wire Line
	7650 3650 7850 3650
Wire Wire Line
	7850 3650 7850 3750
Wire Wire Line
	7750 4150 7750 4250
Wire Wire Line
	7750 3650 7750 3550
Connection ~ 8450 2850
Wire Wire Line
	8850 2850 8450 2850
Wire Wire Line
	8750 5450 8750 5350
Wire Wire Line
	8650 5450 8750 5450
Wire Wire Line
	8400 4800 8400 4700
Wire Wire Line
	8250 4950 8250 4850
Wire Wire Line
	8400 5200 8400 5100
Wire Wire Line
	2500 900  2500 2950
Wire Wire Line
	8850 900  2500 900 
Wire Wire Line
	8850 900  8850 2850
Wire Wire Line
	5750 5750 7350 5750
Wire Wire Line
	5750 2350 5750 5750
Wire Wire Line
	5500 2350 5750 2350
Wire Wire Line
	5700 2450 5500 2450
Wire Wire Line
	5700 5850 5700 2450
Wire Wire Line
	7350 5850 5700 5850
Wire Wire Line
	5650 2550 5500 2550
Wire Wire Line
	5650 5950 5650 2550
Wire Wire Line
	7350 5950 5650 5950
Wire Wire Line
	5600 2650 5500 2650
Wire Wire Line
	5600 6050 5600 2650
Wire Wire Line
	7350 6050 5600 6050
Wire Wire Line
	6200 2750 5500 2750
Wire Wire Line
	6200 4400 6200 2750
Wire Wire Line
	7350 4400 6200 4400
Wire Wire Line
	7350 4850 7350 4400
Wire Wire Line
	6100 2850 5500 2850
Wire Wire Line
	6100 4500 6100 2850
Wire Wire Line
	7250 4500 6100 4500
Wire Wire Line
	7250 5150 7250 4500
Wire Wire Line
	7350 5150 7250 5150
Wire Wire Line
	7150 5050 7150 5150
Wire Wire Line
	7350 5050 7150 5050
Wire Wire Line
	8250 4850 8150 4850
Wire Wire Line
	7750 4650 7750 4550
Wire Wire Line
	8150 5450 8350 5450
Wire Wire Line
	8250 5550 8150 5550
Wire Wire Line
	8250 5650 8250 5550
Wire Wire Line
	7750 6350 7750 6250
Wire Wire Line
	2500 2950 2900 2950
Wire Wire Line
	8450 2200 8450 2300
Wire Wire Line
	7600 1450 7600 1350
Wire Wire Line
	7600 1850 7600 1750
Wire Wire Line
	7600 2250 7600 2150
Connection ~ 6300 1750
Wire Wire Line
	6300 2950 7350 2950
Wire Wire Line
	7350 2950 7350 3350
Wire Wire Line
	7350 3350 7450 3350
Connection ~ 6400 1850
Wire Wire Line
	8050 3350 8150 3350
Wire Wire Line
	8050 2850 8050 3350
Wire Wire Line
	6400 2850 8050 2850
Wire Wire Line
	7300 1150 7300 1450
Wire Wire Line
	6300 1150 7300 1150
Wire Wire Line
	6300 1150 6300 2950
Wire Wire Line
	5500 1750 6300 1750
Wire Wire Line
	7000 1250 7000 1450
Wire Wire Line
	6400 1250 7000 1250
Wire Wire Line
	6400 1250 6400 2850
Wire Wire Line
	5500 1850 6400 1850
Wire Wire Line
	6700 1350 6700 1450
Wire Wire Line
	6500 1350 6700 1350
Wire Wire Line
	6500 1950 6500 1350
Wire Wire Line
	5500 1950 6500 1950
Wire Wire Line
	6700 2250 6700 2150
Wire Wire Line
	7000 2150 7000 2250
Wire Wire Line
	7300 2250 7300 2150
Wire Wire Line
	7300 1850 7300 1750
Wire Wire Line
	7000 1750 7000 1850
Wire Wire Line
	6700 1850 6700 1750
Wire Wire Line
	2700 3350 2700 3250
Wire Wire Line
	2600 3350 2900 3350
Wire Wire Line
	2700 3750 2700 3850
Wire Wire Line
	2600 3750 2900 3750
Wire Wire Line
	7750 3150 7750 3050
Connection ~ 7750 3650
Wire Wire Line
	7750 4250 8850 4250
Connection ~ 7750 4150
Connection ~ 8450 3050
Wire Wire Line
	8450 2600 8450 3150
Wire Wire Line
	7750 3050 8850 3050
Wire Wire Line
	8850 3050 8850 3750
Wire Wire Line
	8450 3750 8450 3550
Connection ~ 8450 4250
Wire Wire Line
	8450 4050 8450 4350
Wire Wire Line
	8850 4250 8850 4050
NoConn ~ 2900 1750
NoConn ~ 2900 1850
NoConn ~ 2900 2050
NoConn ~ 2900 2150
NoConn ~ 2900 2450
NoConn ~ 2900 2550
NoConn ~ 2900 2650
NoConn ~ 2900 2750
NoConn ~ 2900 2850
NoConn ~ 2900 3050
NoConn ~ 2900 3850
NoConn ~ 2900 3650
NoConn ~ 2900 3550
NoConn ~ 2900 3450
NoConn ~ 5500 3750
NoConn ~ 5500 3850
NoConn ~ 5500 3550
NoConn ~ 5500 3450
NoConn ~ 5500 3350
NoConn ~ 5500 3250
NoConn ~ 5500 3150
NoConn ~ 5500 3050
NoConn ~ 5500 2250
NoConn ~ 7350 5350
NoConn ~ 7350 5450
NoConn ~ 7350 5550
NoConn ~ 7350 5650
$Comp
L PWR_FLAG #FLG021
U 1 1 5B3E5384
P 2600 3750
F 0 "#FLG021" H 2600 3825 50  0001 C CNN
F 1 "PWR_FLAG" H 2600 3900 50  0000 C CNN
F 2 "" H 2600 3750 50  0001 C CNN
F 3 "" H 2600 3750 50  0001 C CNN
	1    2600 3750
	0    -1   -1   0   
$EndComp
Connection ~ 2700 3750
$Comp
L PWR_FLAG #FLG022
U 1 1 5B3E589C
P 2600 3350
F 0 "#FLG022" H 2600 3425 50  0001 C CNN
F 1 "PWR_FLAG" H 2600 3500 50  0000 C CNN
F 2 "" H 2600 3350 50  0001 C CNN
F 3 "" H 2600 3350 50  0001 C CNN
	1    2600 3350
	0    -1   -1   0   
$EndComp
Connection ~ 2700 3350
$Comp
L LED D4
U 1 1 5B3E8104
P 3950 5800
F 0 "D4" H 3950 5900 50  0000 C CNN
F 1 "LED" H 3950 5700 50  0000 C CNN
F 2 "" H 3950 5800 50  0001 C CNN
F 3 "" H 3950 5800 50  0001 C CNN
	1    3950 5800
	0    -1   -1   0   
$EndComp
$Comp
L LED D5
U 1 1 5B3E8177
P 4350 5800
F 0 "D5" H 4350 5900 50  0000 C CNN
F 1 "LED" H 4350 5700 50  0000 C CNN
F 2 "" H 4350 5800 50  0001 C CNN
F 3 "" H 4350 5800 50  0001 C CNN
	1    4350 5800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 6050 3950 5950
Wire Wire Line
	4350 6050 4350 5950
$EndSCHEMATC
