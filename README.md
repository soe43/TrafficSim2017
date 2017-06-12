# TrafficSim2017
Traffic Simulator Final Project

TrafficSim2017 is a simulation created by William Soe and Ben Weinstein. It is able to create simulations of cars driving on either randomly generated roads, applying real life physics to create an accurate simulation.

## Features  
### Features Added:  
-Basic Map grid system with Roads.  
-Cars can move, turn, and change their velocity based on awareness of stoplights and other cars around them.  
-One-lane Roads. 
-Rudimentary Two-Way Roads (literally just two one-way Roads with opposite directions placed next to each other).  
-Functioning stop lights that control traffic flow.    
-Accordion Menu.    
**Menu Features (Credit to the ControlP5 Library)**    
-Toggle between 3 built-in maps.    
-Slider for controlling the frequency of Car spawns.   
-Clear all Cars button.    
-Pause button.     

### Features to be Implemented:
-Menu can toggle build mode system, where user build roads with mouse clicks.   
-More Intersection functionality and features.  
-Two-lanes within a single Road.   

## Bugs
-Cars will overlap each other when too many of them bunch up near intersections.
-If you pause the simulation, and then try to press any of the other buttons on the Menu, you have to unpause before any changes will show up on the display.
  
  
## Proposed Development Log from Prototype:
STAGE 0: Research (estimated completion date: 6/2/17, if not done already) 
Completion of prototype and class outlines
Research into PVectors and how to use them in relation to our project.
Looking for libraries that might help. 
ControlP5
 
STAGE I: Basics (estimated completion date: 6/3/17)
Preset map with grid system.
Cars can move around the map in relation to one another.
Turning will probably be basic, though.
Orthogonal rather than radial turns 
Include a debugging mode like the one on the model site.
Create and understand the physics engine/model behind their movement. 
Research into how to improve their movement/turns (do they follow a certain curve, etc.)
Unidirectional, one-lane roads. Simple intersections.
Roads are black, intersections gray, sidewalks a lighter gray.
 
 
STAGE II: Demo version (estimated completion date: 6/5/17)
Randomly generated maps
Stoplights are pre-placed, but work.
Menu with pause, save, load, generate map options.
Bidirectional, one-lane roads.
Highlight function while mousing over.
 
 
STAGE III: Final version (estimated completion date: 6/12/17)
Get rid of any//all bugs in the demo version. 
Different types of cars
Add sliders to the menu, so that the user can tweak the number of cars, time intervals of stoplights, etc.
Bidirectional, multi-lane roads. 
Interactivity complete
Can place the roads, stoplights, entry/exit points for cars.
Make the roads/intersections look better (rather than just being differentiated by color). 
 
STAGE IV: Super cool stuff we hope to implement but most likely won’t get to 
Having cars with destinations and pathfinding.
Make turning more aesthetically pleasing.
Pedestrians and crosswalks.
All other cool stuff mentioned in the extra features part of the list of features (see above). 
 
