
# Rapid Remote Response Vehicle (RRRV)
This Markdown document details the design process used and the troubleshooting that was involved in creating my RRRV.  
This work was completed as part of VCE Systems engineering Units 3 and 4.  
I wrote this all in markdown for the simplicity and accessability, as well as generally being more pleasant than using word or powerpoint
There are most likely spelling mistakes and grammatical errors in this document spelling is a priority at the moment. I have gone through with a basic spellchecker, but I cannot guarantee perfection.

For my weekly journal, see [here](/journal/WEEKLY.md)

# Overview
## What am I building?
I will be building a remote payload delivery vehicle with a first person view camera. the idea of this vehicle is similar to a bomb disposal robot. Its strength is that it can be used to access areas that are not safe for humans. It will be capable of delivering a payload and navigating complex terrain.  
In more detail, I am going to be equipping my own existing remote control car (Traxxas Slash 4x4) with the equipment needed to drive into an area unsafe for humans so that it can deliver a payload. The car will be run using [Ardupilot Rover](https://ardupilot.org/rover/), and will be able to deposit its payload remotely.  
The payload in question will not be a bomb, I promise. Rather it will be medical supplies or food.  

## Why not a plane?
I'm not designing this for war, but in the event of one, drones and planes can be shot down out of the sky after being picked up on radar. The last thing we want is a urgent and valuable supply drone to fail to complete an urgent mission. A ground vehicle is slower, but could drive along the desert for days on end undetected (and with solar panels too!).  
# Initial Planning and design 
## The Car 
The car is a Traxxas Slash 4x4 VXL
I will be using it as a base, as it has all the features I need and will allow me to focus on the autonomy + Payload. The last thing I need is to be trying to build and diagnose two systems at the same time. The Slash is very robust and reliable, and stands up to large amounts of abuse with ease (trust me, I've tested it). Its also something I am fairly confident with, as I understand it and how it works. Mine has an upgraded steering servo as a bonus as well. 

See [ROVER.md](/journal/ROVER.md) for more information

<img src='./media/TRAXXASLASH.jpg'>
<i>Picture of the car pre-systems</i>  

## The Autopilot 
I will be using [Ardupilot Rover](https://ardupilot.org/rover/) to automatically drive the car and complete GPS waypoint based missions.  
According to their website:   

<i>Rover is an advanced open source autopilot for guiding ground vehicles and boats. It can run fully autonomous missions that are defined using mission planning software or pre-recorded by the driver during a manual run.</i>

This is perfect for me as I will be able to set up missions around the school to demonstrate the capabilities of my project. 

Documentation for the autopilot side of things will be documented in [ROVER.md](/journal/ROVER.md), as it is all part of designing the rover.

### Background
Ardupilot itself was originally designed as low cost autopilot for remote control aeroplanes and boats, but has also been adapted to run "rovers" as well. Think Mars Rovers. 

It works by acting as a remote control for the vehicle its being used on. It essentially replaces the preinstalled receiver on the "rover". It knows its own position using a GPS module, and connects to a Ground control station for mission instructions and waypoints. 

Overall its a very well sorted system and will make the Autonomous driving part pretty easy (touch wood), allowing me to focus more on the Payload system.

### Hardware
Ardupilot doesn't need much hardware, meaning it will be relatively cheap to install on my car. Below is a brief list of the Hardware I will need:  

- Ardupilot control module
- GPS module
- Telemetry/control TX/RX system
- Sonar/IR for obstacle avoidance (maybe)

See [This Section](/journal/ROVER.md#navigation-computers) for which exact bits I used and why.

### Software
I will be using [Mission Planner](https://ardupilot.org/planner/index.html#home) for my Ground Control Software (GCS) as it is the most supported and popular GCS for Windows. 

<img src='https://ardupilot.org/planner/_images/mission_planner_screen_flight_plan.jpg'>

As you can see in the screenshot above, Mission planner will allow me to create a set of waypoints which my rover will use GPS to navigate to. Mission planner will also be able to show my FPV camera footage in its HUD if needed, but I could also do a VLC stream if I needed.

## The Payload

See also [Payload System](/journal/PAYLOAD.md)

My initial ideas for the payload so far have been to deliver a cylinder about the size of a 600ml water bottle or maybe a pringles can. The payload will be secured to the vehicle via a custom designed clamping system. I am considering using a seatbelt style strap + tensioner as well, which would allow me to secure multiple types of package. 

### A Cylinder? Why not a box
I am choosing to use a cylinder for a couple of reasons, primarily because they are very easy for a human to hold due to the shape. It also gives me a fun engineering challenge in terms of securing it as it is more complex and less conventional compared to a box. A cylindrical payload could also be transported via other methods, and would be far better for transporting liquids for human consumption (who knows, someone could really really need a bottle of mount franklin!). 
### Securing the Payload

<img src='./media/ogclamps.png'>

I am going to use a clamping system to secure the payload to the vehicle. I want this system to be adaptive to the size/shape of the payload, allowing shapes like water bottles to be held firmly in place. I will have 6 clamping arms along the long side, with another thing at the end to prevent sliding forwards and backwards. The front side will be pressed up against part of the vehicle.

<img src='./media/clampdemo1.png'>  

<i>Demonstration of initial clamp design and its pivot point</i>

Ideally the clamps can move independently of each other, allowing the greatest flexibility. This does present a problem however: how do I move all 6 (or 3 pairs of 2) at the same time, without needing 
6 individual motors?

I continue the design process for this part in the [PAYLOAD.md](/journal/PAYLOAD.md) document.

## Risk Assessment

As with any project, there are risks involved with the operation of this rover. To help identify and mitigate these, I have grabbed the risk assessment matrix from the [Worksafe website](https://www.worksafe.vic.gov.au/how-conduct-risk-assessment) and filled it in with colours to make it nicer to look at 

![Alt text](image.png)

#### Key

##### 1. Insignificant
Any injury or disease that needs first aid treatment only.
##### 2. Minor
Any injury or disease that is likely to result in a person being incapacitated from normal activity for a continuous period of up to 7 days.
##### 3. Moderate
Any injury or disease that is likely to result in a person being incapacitated from normal activity for a continuous period of 7 or more days.
##### 4. Major
A fatality or total and permanent disability.
##### 5. Catastrophic
Multiple fatalities.

So, what are some of the risks we might run into? 

### 1. The Rover collides with a person

#### Likelyhood: Unlikely
It would take very strange circumstances for the rover to collide with a human. Humans tend to see it coming and move it out of the way. Unless you somehow dont see or hear it coming (from quite a while away). Its very easy to detect.
#### Severity: Insignificant
I have had the rover collide with me alot. I have sustained less than a bruise from these collisions. It kinda just bounces off your feet.
#### Verdict: Low Risk
A possible solution would be the Lidar sensor to get the rover to avoid humans.


### 2. The Rover Battery Explodes

#### Likelyhood: Rare
The Lithium-Polymer (LiPo) battery used to power the rover is very unlikely to experience thermal runaway during operation. The Flight controller knows the battery percentage, and will trigger a safety toggle to stop operation. The risk really comes from charging the battery, but if the battery is charged on a safe charger and the balance lead is used, then there is virtually no risk of a fire.
#### Severity: Moderate
A LiPo battery explosion is pretty violent. Theres alot of heat that gets released very quickly. If the battery is close to a human whilst charging, then they could get seriously burned.
#### Verdict: Moderate Risk
I believe as long as the LiPo battery is treated with respect, and the user understands how to identify a battery that is at risk, then the risk will be minimised.

### 3. Manual handling of the Rover resulting in back injury

#### Likelyhood: Moderate
Someone in a rush may use improper lifting techniques to lift the Rover.
#### Severity: Minor
Gets worse over time but on a single occurance factor could be unpleasant.
#### Verdict: Moderate Risk
If the correct lifting procedures are followed, then injury will not occur.

### 4. Rover motors activate whilst the rover is being handled, causing harm

#### Likelyhood: Unlikely
It has never ever happened to me, and I've done a bunch of dumb stuff with the rover
#### Severity: Insignificant
The most that would happen is you might get a bit of carpetburn from one of the tires or a pinched finger
#### Verdict: Low Risk
A saftey switch to kill motor power is installed on the rover to prevent this from happening