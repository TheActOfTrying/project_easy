import 'package:flutter/material.dart';
import 'theme_changer/model_theme.dart';
import 'package:provider/provider.dart';

import 'machine.dart';
import 'home_page.dart';

void main() {
  final Map<String, List<String>> machineCodes = {
    "Hettemaskin og Underbenk": [
      "A1 - Want of water\nVannventil",
      "B1 - Drain not efficient\nTømmepumpe",
      "B2 - Overflow alarm\nAvløp/Vannventil/Tømmepumpe",
      "C1 - Boiler temperature rise too fast\nTom boiler",
      "C2 - Boiler temperature too high\nParameter btC, rele/kontaktor",
      "C3 - Tank temperature too high\nParameter tHi, rele/kontaktor",
      "C4 - No connection to tank sensor\nDefekt føler",
      "C5 - Short circuit to tank sensor\nDefekt føler",
      "C6 - No connection to boiler sensor\nDefekt føler",
      "C7 - Short circuit to boiler sensor\nDefekt føler",
      "C8 - Rinsing is not done regularly for 2 consecutive cycles\nSkyllepumpe",
      "C9 - Automatic hood out of order\nBrudd på ledninger",
      "C10 - No connection to rinse sensor\nDefekt føler",
      "C11 - Short circuit to rinse sensor\nDefekt føler",
      "C12 - No connection to tank level sensor\nDårlig kontakt på plugg",
      "C13 - Rinse pump out of order\nSkyllepumpe",
      "E1 - Communication error between display and main\nBrudd på ledning",
      "E2 - Tank temperature to low\nElement, rele/kontaktor",
      "E3 - Boiler temperature to low\nElement, rele/kontaktor"
    ],
    "Tunnelmaskin": [
      "E10 - Flash memory is not recognized",
      "E12 - Heat pump out of order",
      "E13 - Heat pump water circuit pressure too high",
      "E14 - Heat pump water circuit pressure too low",
      "E15 - Main connection phases sequence not correct",
      "E16 - Heat pump evaporator temp. probe short circuit",
      "E17 - Heat pump evaporator temp. probe disconnected",
      "E18 - Heat pump out of order",
      "E20 - Door switches error - inverter U1 interlock open",
      "E21 - Door switches error – inverter U1 interlock closed",
      "E22 - Door switches error – inverter U1 interlock closed",
      "E23 - Interlock signals of the 2 inverter are different",
      "E25 - Wash and rinse ACU boards 208, 240V on J22 missing",
      "E30 - Main connection voltage supply too high",
      "E32 - Main connection voltage supply too low",
      "E40 - Main water connection reversed",
      "E41 - Hot water connection too cold",
      "E42 - Hot water line temp. probe short circuit",
      "E43 - Hot water line temp. probe disconnected",
      "E51 - Cold water connection too high",
      "E52 - Air-gap temperature probe short circuit",
      "E53 - Air-gap temperature probe disconnected.",
      "E61 - ESD/heat exchanger inefficient",
      "E62 - ESD/heat exchange temperature probe short circuit",
      "E63 - ESD/heat exchange temperature probe disconnected",
      "E90 - No communication UI – ACU1 wash and ACU2 rinse",
      "E110 - The flow detected by hot water flowmeter SF1+ST1 is too low",
      "E111 - Wash tank filling flow too low",
      "E112 - The level in the wash tank does not increase as expected",
      "E113 - The level in the wash tank does not increase as expected",
      "E114 - Wash Tank filling time-out expired",
      "E115 - Leaking in the draining circuit",
      "E116 - Wash tank filling time-out expired",
      "E117 - The wash tank level is too high",
      "E118 - Wash tank level sensor out of range",
      "E119 - Wash tank level sensor disconnected",
      "E120 - Wash/Triple Tank filling flow too high",
      "E124 - Door switch error, the door switch of wash section is flickering",
      "E130 - Wash Tank heating time-out expired",
      "E131 - Wash Tank water over-temperature",
      "E132 - Wash Tank temperature probe short circuit",
      "E133 - Wash Tank temperature probe disconnected",
      "E140 - Wash Pump thermal protection trips",
      "E150 - Wash Tank draining time-out expired",
      "E170 - Feeding motor, motor coils short circuit",
      "E171 - Feeding motor, motor overcurrent",
      "E172 - Feeding motor, motor speed out of control",
      "E173 - Feeding motor, motor thermal protection trip",
      "E174 - Feeding motor, inverter overtemperature",
      "E175 - Feeding motor, inverter failure",
      "E176 - Feeding motor, all motor coils open",
      "E177 - Feeding motor, inverter over-voltage dc bus",
      "E178 - Feeding motor, inverter under-voltage dc bus",
      "E179 - Feeding motor, motor coil open",
      "E180 - Feeding motor, J13 inverter bridge open",
      "E181 - Feeding motor, motor temperature too high",
      "E182 - Feeding motor, inverter ambient temp. too high",
      "E188 - Feeding motor torque too low",
      "E189 - Feeding motor, communication error ACU1 – Inverter U1",
      "E190 - Wash Tank filter not present",
      "E191 - Wash Tank filter not present",
      "E192 - Wash ACU1 board 208, 240V on J22 missing",
      "E193 - No communication UI – Wash ACU1",
      "E194 - ACU1 Wash over-current on low voltage section",
      "E195 - Conveyor gear motor thermal protection trips",
      "E204 - The final rinse arms missing",
      "E212 - The level in the triple tank does not increase as expected",
      "E213 - The level in the duo rinse tank does not increase as expected",
      "E214 - Triple rinse tank filling time-out expired",
      "E216 - Triple rinse tank filling time-out expired",
      "E217 - Triple tank level too high, risk of overflow",
      "E218 - Triple tank level sensor out of range",
      "E219 - Triple Tank level sensor disconnected",
      "E224 - Door switch error, the door switch of rinse section is flickering",
      "E225 - Triple Pump thermal protection trips.",
      "E226 - Duo Pump thermal protection trips",
      "E227 - Duo tank re-filling failed",
      "E228 - Duo pump error",
      "E229 - Duo flow too high",
      "E230 - Boiler heating time-out expired",
      "E231 - Boiler overtemperature",
      "E232 - Boiler temperature probe short circuit",
      "E233 - Boiler temperature probe disconnected",
      "E234 - Boiler empty",
      "E238 - Duo tank draining time-out expired",
      "E239 - Insert Duo rinse arms",
      "E240 - Triple tank heating time-out expired",
      "E241 - Triple tank water over-temperature",
      "E242 - Triple tank temp. probe short circuit",
      "E243 - Triple tank temp. probe disconnected",
      "E252 - The level in the air gap does not reach set point level within the time-out",
      "E254 - Air gap filling time-out expired",
      "E255 - Leaking in the air-gap circuit",
      "E257 - Air-gap level too high, risk of overflow",
      "E258 - Air-gap level sensor out of range",
      "E259 - Air gap level sensor disconnected",
      "E260 - Rinse pump does not drain the airgap",
      "E261 - Triple tank draining time-out expired",
      "E270 - Final Rinse pump, motor coils short circuit",
      "E271 - Final Rinse pump, motor over current",
      "E272 - Final Rinse pump, motor speed out of control",
      "E273 - Final Rinse pump, motor thermal protection trip",
      "E274 - Final Rinse pump, inverter overtemperature",
      "E275 - Final Rinse pump, inverter failure",
      "E276 - Final Rinse pump, all motor coils open",
      "E277 - Final Rinse pump, inverter over-voltage dc bus",
      "E278 - Final Rinse pump inverter under-voltage dc bus",
      "E279 - Final Rinse pump, motor coil open",
      "E280 - Final Rinse pump, J13 inverter bridge open",
      "E281 - Final Rinse pump, motor temperature too high",
      "E282 - Final Rinse pump, Inverter ambient temp. too high",
      "E283 - Final rinse flow too low",
      "E284 - Final rinse flow too high.",
      "E285 - Final rinse pump torque too high",
      "E288 - Final rinse pump torque too low",
      "E289 - Final rinse pump, communication error acu - obiwan",
      "E290 - Rinse flow out of range at maximum speed",
      "E292 - Rinse ACU2 board 208, 240v on J22 missing",
      "E293 - No communication UI - ACU2 rinse",
      "E294 - ACU2 rinse, overcurrent on low voltage section",
      "E392 - ACU3 optional, over-current on low voltage section",
      "E393 - No communication UI - ACU3 optional",
      "E394 - ACU3 optional, over-current on low voltage section",
      "E411 - Additional Wash Tank filling flow too low.",
      "E413 - The level in the Additional Wash tank does not increase as expected",
      "E414 - Additional Wash Tank filling timeout expired",
      "E415 - Leaking in the draining circuit",
      "E416 - Additional Wash tank filling time-out expired",
      "E417 - Additional Wash Tank level too high, risk of overflow",
      "E418 - Additional Wash Tank level sensor out of range",
      "E419 - Additional Wash Tank level sensor disconnected",
      "E420 - Additional Wash Tank filling flow too high",
      "E424 - Door switch error, the door switch of Additional Wash section is flickering",
      "E430 - Additional Wash Tank heating timeout expired",
      "E431 - Additional Wash Tank water overtemperature",
      "E432 - Additional Wash tank temp. probe short circuit",
      "E433 - Additional Wash tank temp. probe disconnected",
      "E440 - Additional Wash Pump thermal protection trips",
      "E450 - Wash Tank draining timeout expired",
      "E470 - Interlock error or door open in the Additional Wash",
      "E490 - Additional Wash Tank filter not present",
      "E491 - Additional Wash Tank filter not present",
      "E492 - Wash ACU4 board 208, 240V on J22 missing",
      "E493 - No communication UI, Prewash ACU4",
      "E494 - ACU4 Additional Wash, over-current on low voltage section",
      "E510 - The flow detected by cold water flowmeter SF30+ST30 is too low to Prewash 1 tank",
      "E511 - Prewash 1 Tank filling flow too low",
      "E512 - The level in the Prewash 1 tank does not increase as expected",
      "E513 - The level in the Prewash 1 tank does not increase as expected",
      "E514 - Prewash 1 Tank filling time-out expired",
      "E515 - Leaking in the draining circuit",
      "E516 - Prewash 1 tank filling time-out expired",
      "E517 - Prewash 1 Tank level too high, risk of overflow",
      "E518 - Prewash 1 tank level sensor out of range",
      "E519 - Prewash 1 tank level sensor SL32 disconnected",
      "E520 - Prewash 1 tank filling flow too high",
      "E524 - Door switch error, the door switch of Prewash 1 section is flickering",
      "E530 - Prewash 1 tank heating time-out expired",
      "E531 - Prewash 1 tank water overtemperature",
      "E532 - Prewash 1 tank temperature probe short circuit",
      "E533 - Prewash 1 tank temperature probe disconnected",
      "E540 - Prewash 1 pump thermal protection trips",
      "E550 - Wash tank draining time-out expired",
      "E570 - Interlock error or door open in the Prewash 1",
      "E590 - Prewash 1 Tank filter not present",
      "E591 - Prewash 1 Tank filter not present",
      "E592 - Wash ACU5 board 208, 240V on J22 missing",
      "E593 - No communication UI, Prewash 1 ACU5",
      "E594 - ACU5 Prewash 1, over-current on low voltage section",
      "E610 - The flow detected by cold water flowmeter SF30+ST30 is too low to Prewash 2 tank",
      "E611 - Prewash 2 Tank filling flow too low",
      "E612 - The level in the Prewash 2 tank does not increase as expected",
      "E613 - The level in the Prewash 2 tank does not increase as expected",
      "E614 - Prewash 2 Tank filling time-out expired",
      "E615 - Leaking in the draining circuit",
      "E616 - Prewash 2 tank filling time-out expired",
      "E617 - Prewash 2 Tank level too high, risk of overflow",
      "E618 - Prewash 2 Tank level sensor out of range",
      "E619 - Prewash 2 Tank level sensor disconnected",
      "E620 - Prewash 2 Tank filling flow too high",
      "E624 - Door switch error, the door switch of Prewash 2 section is flickering",
      "E630 - Prewash 2 Tank heating time-out expired",
      "E631 - Prewash 2 Tank water overtemperature",
      "E632 - Prewash 2 tank temp. probe short circuit",
      "E633 - Prewash 2 tank temp. probe disconnected",
      "E640 - Prewash 2 Pump thermal protection trips",
      "E650 - Wash Tank draining time-out expired",
      "E670 - Interlock error or door open in the Prewash 2",
      "E690 - Prewash 2 Tank filter not present",
      "E691 - Prewash 2 Tank filter not present",
      "E692 - Wash ACU 6 board, 208, 240v on J22 missing",
      "E693 - No communication UI - Prewash ACU 6",
      "E694 - ACU6 Prewash 2, over-current on low voltage section",
      "E724 - Door switch error, the door switch of Dryer 1 section is flickering",
      "E730 - Dryer 1 heating time-out expired",
      "E731 - Dryer 1 overtemperature",
      "E732 - Dryer 1 temperature probe short circuit",
      "E733 - Dryer 1 temperature probe disconnected",
      "E770 - Interlock error or door open in the Dryer 1",
      "E792 - Dryer 1 ACU7 board 208, 240v on J22 missing",
      "E793 - No communication UI - Dryer 1 ACU7",
      "E794 - ACU7 Dryer 1, over-current on low voltage section",
      "E824 - Door switch error, the door switch of Dryer 2 section is flickering",
      "E830 - Dryer 2 heating time-out expired",
      "E831 - Dryer 2 overtemperature",
      "E832 - Dryer 2 temp. probe short circuit",
      "E833 - Dryer 2 temp. probe disconnected",
      "E870 - Interlock error or door open in the Dryer 2",
      "E892 - Dryer 2 ACU8 board 208, 240v on J22 missing",
      "E893 - No communication UI - Dryer 2 ACU8",
      "E894 - ACU8 Dryer 2, over-current on low voltage section"
    ],
    "Skyline": [
      "ACUP - communication protocol between UI and ACU is not working",
      "CLLP - Clean hood’s lamp",
      "CLCS - Clean hood's condensation sink",
      "CLFt - Clean hood's demister and water separator filter",
      "CLdr - The cap of the cleaning drawer is not detected. It is not possible to START a cooking or cleaning cycle",
      "FCt - The User Interface is not programmed with the software",
      "Hd04 - Shower valve BV4 not working",
      "H20L - Water leakage detected",
      "PdEF - Physical memory failure",
      "rEPL - Replace hood's lamps",
      "GAS+Err - When at least one of burners error is present (Errors 300, 301, 302, 303) then also this label is showed on the UI",
      "1 Ertc - Issue with hardware (for example battery clock exhausted)",
      "101 butn - One of the panel buttons is permanently blocked",
      "102 FLA1 - The FLASH EPROM ID is different as expected",
      "103 FLA2 - Communication channel between the FRAM and the microcontroller is malfunctioning or blocked.",
      "104 FrA1 - The FRAM ID is different as expected",
      "105 FrA2 - The FRAM power fail data calculated MD5 is different as the stored one",
      "106 FrMC - The FRAM power fail data calculated MD5 is different as the stored one",
      "107 SCbL - Appliance is ON but ON/OFF switch feedback still OFF",
      "110 bAtt - Battery is low",
      "111 rtc1 - The communication channel between the RTC and the microcontroller is malfunctioning or blocked",
      "112 Urt2 - The RTC stopped flag is active even after the power on recovery procedure",
      "113 Urt3 - The RTC internal oscillator is malfunctioning",
      "115 ACUS - ACU software version (main uC) incompatible with present UI SW version",
      "116 ACSS - ACS software version (inside ACU board) incompatible with present UI SW version",
      "117 tCMS - TC software version (inside ACU board) incompatible with present UI SW version",
      "118 InuS - Inverter software version incompatible with present UI SW version.",
      "120 PUSr - The User parameters calculated MD5 is different to the stored one",
      "121 PFAC - Issue with the SW or with the HW",
      "122 PUOr - One or more User parameters are out of range",
      "123 PFOr - One or more Factory parameters are out of range",
      "125 PCE1 - Wrong parameter configuration: Appliance with boiler but without lambda probe. (24:APPL = 0 and 6:LAMb = 0)",
      "130 EGA0 - Software missing",
      "131 EGAt - Software missing",
      "132 EGAd - Software missing",
      "135 ECLt - Software missing",
      "140 FLre - SPI-FLASH memory reading error",
      "141 FLUE - SPI-FLASH memory writing error",
      "142 FLEE - SPI-FLASH memory block erase error (4kb block)",
      "145 FrrE - FRAM memory reading error",
      "146 FrUE - FRAM memory writing error",
      "150 USFO - Error during creation / opening of a file on the USB key",
      "151 USFC - Error during closure of a file on the USB key",
      "152 USrE - Error during reading of a file on the USB key",
      "153 USUE - Error during writing of a file on the USB key",
      "154 USdC - Error during creation of a directory on the USB key",
      "155 USFU - Impossible to write on the USB key: USB key full",
      "160 nIU1 - On Digit ovens, the UI is not able to communicate with the NIU, once the parameter 352 has been enabled to 1",
      "161 nIUS - NIU SW version is incompatible with UI SW version",
      "162 nIUH - NIU unknown",
      "163 nIUC - NIU configuration not valid",
      "164 nIUP - No valid PNC and SN found",
      "200 ACUM - Issue with the communication cable/connectors between ACU and UI. Communication cable failure. ACU failure",
      "201 MCtM/FU13 - Issue with the motor inverter. Connection or electrical issue",
      "202 MCbM/Fd13 - Issue with the motor inverter. Connection or electrical issue",
      "203 CPUA - ACU failure",
      "204 CPUt - ACU failure",
      "205 ACUP - The ACU has not been programmed correctly. The SD Card on the UI may be corrupted and not able to perform the ACU update with the software temporarily loaded on it",
      "210 EtC - Cavity safety switch triggered (TSC)",
      "211 EtUC - The cavity is dirty; The parameter COT is set too low",
      "212 ECEu - Top cavity thermocouple failure (TCAV UP)",
      "213 ECEd - Bottom cavity thermocouple failure (TCAV DWN)",
      "220 Etb - Boiler safety switch triggered (TSB)",
      "221 EtUb - Boiler over temperature (TBOI)",
      "222 EbOl - Boiler thermocouple failure (TBOI)",
      "223 BoLt - Boiler water loading timeout (EV5)",
      "224 BEtr - Boiler excessive temperature raising time (Tbol)",
      "227 LPIn - Working probe on, Safety probe off (WL-SL)",
      "228 Hd05 - Water solenoid valve EV5 not working. Boiler fill solenoid valve",
      "229 Hd06 - Boiler drain valve BV6 not working",
      "230 dESC - Descale boiler",
      "231 dESS - Descale boiler",
      "240 Bhto - Warning on excessive time on opening operation of the vent valve during cooking (VV1)",
      "241 Bhtc - Warning on excessive time on closing operation of the vent valve during cooking (VV1)",
      "242 BEto - Error, excessive time on opening operation of the vent valve during cleaning (VV1)",
      "243 BEtc - Error, excessive time on closing operation of the vent valve during cleaning (VV1)",
      "244 Y8 - blocks cleaning if the flap is closed",
      "250 EbYP - Quenching thermocouple failure (TQS).",
      "251 Eotd - High temperature on drain (NM8)",
      "252 Htd - Drain temperature above safety limit (NM8).",
      "253 EStd - Fail on NTC safety hydraulic drain (NM8)",
      "254 Hd02 - Water solenoid valve EV2 not working Quenching valve",
      "260 Cdo - Cleaning drawer cap absent (DRS).",
      "261 Hd07 - Water solenoid valve EV7 not working",
      "262 Hd11 - Water solenoid valve EV11 not working",
      "263 Hd12 - Water solenoid valve EV12 not working",
      "264 Hd08 - Cleaning pump M8 not working",
      "265 HdPP - Valves/pumps activations (ACS feedback)",
      "280/281 HFnI - ISG is active but humidity does not increase",
      "282 Hd01 - The solenoid valve EV1 is not working",
      "290 EntC - Component compartment NTC failure (NCC)",
      "291 ESCH - Component compartment temperature error (NCC)",
      "292 ASCH - Component compartment temperature warning (NCC/dirty air intake filter)",
      "293 FSnr - Cooling fan speed not reachable (FAN1-2-3)",
      "294 CFbL - Cooling fan stopped (FAN1-2-3).",
      "300 GbCU - Cavity upper burner locked",
      "301 GbCd - Cavity lower burner locked.",
      "302 GbbU - Boiler gas burner locked",
      "304 SbCU - Cavity Up burner fan does not reach set (VTCU)",
      "305 SbCd - Cavity down burner fan does not reach set (VTCD)",
      "306 SbbU - Boiler 1 burner fan does not reach set (VTBU)",
      "307 Sbbd - Boiler fan does not reach desired speed",
      "310 CntC - Cavity SSR NTC failure (NTC3)",
      "311 CSOt - Cavity SSR NTC over-temperature (NHSC)",
      "312 CSHt - Cavity SSR NTC over-temperature (NHSC)",
      "313 bntC - Boiler SSR NTC failure (NHSB)",
      "314 bSOt - Boiler SSR NTC over-temperature (NHSB)",
      "315 bSHt - Boiler SSR NTC over-temperature (NHSB)",
      "320 Epr1 - Single point core probe failure",
      "321 Epr6 - Six point core probe failure",
      "322 ELMb - Lambda sensor failure",
      "323 ACF - Air filter absent, microswitch AFS",
      "324 FA8H - Oven worked 8 hours without air inlet filter",
      "325 GrCo - Grease collector valve opened",
      "326 Hd03 - Cavity drain valve BV3 not working",
      "327 EH2O - Water measured inconsistent with valves state (FM)",
      "329 H2OC - H2O check. The oven retry the water check 3 times every 10min. After that EH2O is shown",
      "400 FU00 - Upper Motor short Circuit",
      "401 FU01 - Upper motor overcurrent.",
      "402 FU02 - Upper motor speed inconsistency",
      "403 FU03 - Upper Inverter Undervoltage DC",
      "404 FU04 - Upper Inverter Overvoltage",
      "405 FU05 - Upper Inverter outgoing phases open circuit",
      "406 FU06 - Upper Inverter High Temperature",
      "407 FU07 - Upper motor thermostat safety tripping (Klixon)",
      "408 FU08 - Upper inverter, Inverter Over torque",
      "409 FU09 - Upper inverter, Interlock Circuit Failure",
      "410 FU10 - Upper inverter, Drive Interlock failure",
      "411 FU11 - Upper inverter, Undervoltage AC",
      "412 FU12 - Upper inverter, Overvoltage AC",
      "413 Fd13 - Upper inverter, Communication Error",
      "414 Fd14 - Upper inverter, Parameter configuration Error",
      "415 Fd15 - Upper inverter, Alarm state",
      "416 Fd16 - Upper inverter, Alarm state",
      "417 FU17 - Upper inverter, Outgoing phases open circuit",
      "450 Fd00 - Lower motor, short circuit",
      "451 Fd01 - Lower motor, overcurrent",
      "452 Fd02 - Lower motor, speed inconsistency",
      "453 Fd03 - Lower inverter, Undervoltage DC",
      "454 Fd04 - Lower inverter, OverVoltage",
      "455 Fd05 - Lower Inverter, Outgoing phases open circuit",
      "456 Fd06 - Upper Inverter, Outgoing phases open circuit",
      "457 Fd07 - Upper motor thermostat safety tripping (Klixon)",
      "458 Fd08 - Upper motor thermal safety tripping (Klixon)",
      "459 Fd09 - Lower inverter, Drive interlock failure",
      "460 Fd10 - Upper inverter, Drive interlock failure",
      "461 Fd11 - Upper inverter, Undervoltage AC",
      "462 Fd12 - Lower Inverter, Undervoltage AC",
      "600 hod0 - Level 2, 3, 4 Malfunction on hood motor regulator",
      "601 hod1 - UV-C lamp’s cassette are not in right position",
      "602 hod2 - The cover panel of central technical compartment (UVC) is not inappropriate position or is not properly closed",
      "603 hod3 - The Demister and Water Separator Filter are not in appropriate position.",
      "604 hod4 - Level 4 only. Hood's electrical internal error (CN6). [Actually unused. This error is electrically bypassed in the hood control board]",
      "605 hod5 - Hood’s UVC lamp 1 and/or 2 missing or not working.",
      "606 hod6 - Hood’s UVC lamp 3 and/or 4 missing or not working",
      "607 hod7 - Level 4 only. Hood’s ozone sensor 1 limit exceeded [Predisposition only. Ozone sensor currently not in use].",
      "608 hod8 - Level 4 only. Hood’s ozone sensor 2 limit exceeded [Predisposition only. Ozone sensor currently not in use].",
      "609 hod9 - Level 4 only. Missing communication with Hood Lev. 4",
      "620 UPrb - USB Food Probe missing or removed during cooking",
      "1001 TBD - The cavity is dirty; The parameter COT is set too low."
    ],
    "AOS": [
      "Error Codes:",
      "EE2P: Communication error with the EEPROM",
      """E---: If the controller detects one or more parameters which have values not permitting the minimum
operational requirements, an error code will appear on the display, i.e. “E---” followed by the parameter
number. Enter the programming mode and set the correct value according to the parameter list.""",
      "EtUC: Cavity over temperature; cavity temperature exceeded value stored in parameter cot.",
      "EtUB: Boiler over temperature; boiler temperature exceeded value stored in parameter bot.",
      """EFUN UP/DOWN: Activation of the thermal protection of the motor. On the little temperature display it will
appear 'UP' or 'DOWN' according it is the thermal protection of the upper motor (and the motor of 6-10
grid ovens) or lower motor on 20-grid oven. The thermal protection has an automatic reset but in order to
continue with the cooking process, parameter ALFn has to be reset to 0.""",
      "Etc: Tripping out of cavity limiter",
      "Etb: Tripping out of boiler limiter",
      """ESCH: Over temperature on the electronic board; check the cooling fan and the ventilation openings on the
bottom of the control panel.""",
      "Ept1: cavity probe in open circuit (only the steam cycle _ 100 °C can be selected)",
      "Ept2: boiler probe in open circuit (only hot air cycle can be selected)",
      "Ept3: meat probe in open circuit (only time cooking can be selected)",
      """Ept4: by-pass probe in open circuit (only hot air, regeneration or low temperature steam cycle can be
selected)""",
      "Ept8: NTC probe in short or open circuit.",
      """ECAD-EAD1…EAD5: Analogic/Digital converters not working (thermocouples input signal). Check input
signal of all thermocouples, lambda sensor, food probe. Error can be reset with 'on/off' button. If the error
persist, change the power board.""",
      "Ertc : No communication with the clock. On lev. C set parameter Ertc to zero",
      "E PM: Communication error with PWM system (only gas versions)",
      """E SL: Water level probe error (probes in short circuit). If the boiler heating elements or burners are on for a
time over that one defined in parameter tbon without a water charging phase, this error message is
activated. To reset it, parameter ALFn has to be reset to 0.""",
      "Warnings:",
      """EH2O: Before the starting of the cleaning system and during its working, there are some check points of
the water pressure. If the water pressure is too low this warning message appears on the display. Check
the water pressure (1.5÷2.5 bar), check the correct working of the water pressure switch, check if there are
obstructions on the cleaning water inlet pipe (its inner diameter must be 20 mm).""",
      """EFLP: Cavity ventilation flap failure; check the motoreducer or the micro switch that detects the close
position of the flap.If the motoreducer does not close the flap within the time set in the firmware (40 sec),
the error appears.""",
      "ELMb: lambda system error. The signal from the lambda probe is out of the range [-50mV ; 1200mV]",
      "ECLO: Clock error, it appears if the clock was never adjusted or the battery is discharged.",
      "EPrG: Error in reading the phases of a multiphase recipe.",
      "EIND: Error in reading the index of the recipes.",
      "EDES: Error in reading the description of a recipe.",
      "ERAM: Communication error with the RAM.",
      "nFIP: Communication error of recipe display.",
      "FILL: Safety level probe of the boiler out of water.",
      """PrEH: Preheating phase of the boiler; it indicates the preheating phase of the cavity if the warning message
appears on temperature display.""",
      "OPEN: boiler drain activated.",
      "COOL: Cavity cooling phase.",
      "dEt: low level of detergent.",
      "rAI: low level of rinser.",
      "rCLN: request for a cleaning cycle (manual or automatic);parameter FCLn is set to a value different from 0."
    ]
  };
  runApp(MyApp(machineCodes: machineCodes));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.machineCodes});

  final Map<String, List<String>> machineCodes;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp(
              title: "Project Easy",
              debugShowCheckedModeBanner: false,
              theme: themeNotifier.isDark
                  ? ThemeData(brightness: Brightness.dark)
                  : ThemeData(brightness: Brightness.light),
              home: MyHomePage(
                  machines: List.generate(
                      machineCodes.length,
                      (index) => Machine(machineCodes.keys.elementAt(index),
                          machineCodes[machineCodes.keys.elementAt(index)]!))));
        },
      ),
    );
  }
}