# Smart Traffic Light Controller using Verilog

## Description

This project implements a Smart Traffic Light Controller using Verilog HDL. The controller manages traffic signals for two roads and follows a predefined sequence of Green, Yellow, and Red lights. It also includes an Emergency Vehicle Priority feature that immediately gives a Green signal to Road A when an emergency vehicle is detected.

## Features

* Traffic light control for two roads
* Finite State Machine (FSM) based design
* Emergency vehicle priority handling
* Automatic signal transitions
* Verilog HDL implementation
* Waveform verification using EPWave

## Inputs

| Signal    | Description                        |
| --------- | ---------------------------------- |
| clk       | Clock signal                       |
| rst       | Reset signal                       |
| emergency | Emergency vehicle detection signal |

## Outputs

| Signal       | Description             |
| ------------ | ----------------------- |
| roadA_green  | Green light for Road A  |
| roadA_yellow | Yellow light for Road A |
| roadA_red    | Red light for Road A    |
| roadB_green  | Green light for Road B  |
| roadB_yellow | Yellow light for Road B |
| roadB_red    | Red light for Road B    |

## Working

1. When the controller starts, Road A gets a Green signal and Road B gets a Red signal.
2. Road A changes from Green to Yellow.
3. Road A becomes Red and Road B becomes Green.
4. Road B changes from Green to Yellow.
5. The sequence repeats continuously.
6. If `emergency = 1`, Road A immediately gets Green and Road B gets Red.
7. Once the emergency condition is removed, the controller resumes normal operation.

## State Sequence

Road A Green → Road A Yellow → Road B Green → Road B Yellow → Repeat

## Tools Used

* Verilog HDL
* EDA Playground
* Icarus Verilog
* EPWave

## Files

* `traffic_light.v` : Traffic Light Controller design
* `traffic_light_tb.v` : Testbench for simulation
* `traffic_controller_waveform.png` : Simulation waveform

## Waveform

<img src="PASTE_YOUR_GITHUB_IMAGE_URL_HERE" width="1000">

## Result

The Smart Traffic Light Controller was successfully simulated and verified. The controller correctly cycles through all traffic light states and provides immediate priority to emergency vehicles when the emergency signal is asserted.

## Author

**Sujal Patil**
