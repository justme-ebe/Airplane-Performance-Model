# UAV Aerodynamic Performance and Flight Envelope Model

## Overview
This repository contains a generalized, MATLAB-based aerodynamic performance analysis tool designed to model the flight boundaries of any fixed-wing Unmanned Aerial Vehicle (UAV) or radio-controlled (RC) aircraft. 

By inputting basic mass, aerodynamic, and propulsion specifications, the model evaluates aircraft performance across various altitudes. It simulates the relationship between True Airspeed (TAS), Power Required, Power Available, and Rate of Climb (ROC). Through the implementation of an International Standard Atmosphere (ISA) density model and altitude-degraded propulsion efficiency calculations, this script allows users to quickly define operational envelopes, validate design parameters, and determine service ceiling metrics for a wide variety of airframe configurations.

## Key Engineering Features
*   **Atmospheric Modeling:** Implements an ISA density approximation to calculate air density ($\rho$) up to and beyond the tropopause (11,000 m).
*   **Drag & Power Requirements:** Computes total power required by summing parasitic and induced power profiles across the velocity envelope. 
*   **Propulsion Degradation:** Models the reduction in power available at altitude by accounting for air density drops and propeller efficiency losses.
*   **Kinematic Performance:** Derives theoretical Rate of Climb (ROC) in ft/min to determine the continuous climb capabilities at specified altitudes.

## Default System Parameters
The script is currently configured with the following default specifications (which can be easily modified in the `Inputs` section to analyze different airframes):
*   **Mass:** 1.9 kg
*   **Sea Level Power:** 700 W (Dual 350W motors)
*   **Wing Area (S):** 0.18 m^2
*   **Zero-Lift Drag Coefficient (CD0):** 0.1989
*   **Oswald Efficiency Factor (e):** 0.8829
*   **Aspect Ratio (AR):** 5.56

## Results & Visualization

The generated plots visualize two critical performance boundaries at the target altitude:
1.  **Power Curve Intersections:** Displays the convergence of Power Required (parasitic + induced) and Power Available, identifying the minimum and maximum level-flight velocities.
2.  **Rate of Climb (ROC):** Maps the positive and negative climb rate boundaries across the airspeed spectrum, confirming physical flight limitations.

## Execution and Setup
1. Ensure MATLAB is installed on the local machine.
2. Clone this repository to the local environment.
3. Open the MATLAB script.
4. Modify the `Inputs` section to test different altitudes, masses, or aerodynamic configurations.
5. Run the script to generate the performance plots.
