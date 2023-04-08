
# Rapid Remote Response Vehicle (RRRV)
This Markdown document details the design process used and the troubleshooting that was involved in creating my RRRV.  
This work was completed as part of VCE Systems engineering Units 3 and 4.  
I wrote this all in markdown for the simplicity and accessablility, as well as minimal microsoft reliance

# Overview
## What am I building?
I will be building a remote playload delivery vehicle with a first person view camera. the idea of this vehicle is similar to a bomb disposal robot. Its strength is that it can be used to access areas that are not safe for humans. It will be capable of delivering a payload and navigating complex terrain.  
In more detail, I am going to be equipping my own existing remote control car (Traxxas Slash 4x4) with the equipment needed to drive into an area unsafe for humans so that it can deliver a payload. The car will be run using [Ardupilot Rover](https://ardupilot.org/rover/), and will be able to deposit its payload remotely.  
The payload in question will not be a bomb, I promise. Rather it will be medical supplies or food.  
Even if 
## Why not a plane?
I'm not designing this for war, but in the event of one, drones and planes can be shot down out of the sky after being picked up on radar. The last thing we want is a urgent and valuble supply drone to fail to complete an urgent mission. A ground vehicle is slower, but could drive along the desert for days on end undetected (and with solar panels too!).  
# Initial Planning and design 
## The Car 
I will be using a remote control car that I already own as a base, as it has all the features I need and will allow me to focus on the autonomy + Payload.   
The car itself is a Traxxas Slash 4x4 VXL, The VXL meaning Brushless in this scenario

<img src='./media/TRAXXASLASH.jpg'>
<i>Picture of the car pre-systems</i>  

## The Autopilot 
I will be using [Ardupilot Rover](https://ardupilot.org/rover/) to automatically drive the car and complete GPS waypoint based missions.  
According to their website:   

<i>Rover is an advanced open source autopilot for guiding ground vehicles and boats. It can run fully autonomous missions that are defined using mission planning software or pre-recorded by the driver during a manual run.</i>

This is perfect for me as I will be able to set up missions around the school to demonstrate the capabilities of my project. 

### Background
Ardupilot itself was originally designed as low cost autopilot for remote control aeroplanes and boats, but has also been adapted to run "rovers" as well. Think Mars Rovers. 

It works by acting as a remote control for the vehicle its being used on. It essentially replaces the preinstalled reciever on the "rover". It knows its own position using a GPS module, and connects to a Ground control station for mission instructions and waypoints. 

Overall its a very well sorted system and will make the Autonomous driving part pretty easy (touch wood), allowing me to focus more on the Payload system.

### Hardware
Ardupilot doesn't need much hardware, meaning it will be relatively cheap to install on my car. Below is a brief list of the Hardware I will need:  

- Ardupilot control module
- GPS module
- Telemetry/control TX/RX system
- Sonar/IR for obstical avoidance (maybe)

I haven't decided on exactly what parts I intend to use, but I'll update this list when I do for anyone playing along at home

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

With my dads reccomendation I removed as much excess material as possible to create the most barebones clamp possible, then I can make it look pretty once I know all the design constraints. 
Using a stress test we can see that there is not much, if not very little wasted material.

<img src='./media/Barebones Stresstest.png'>

You can also see in this image that just around the pivot point there is significant stress. Ideally when I complete the design it will have two points, allowing for better load distribution. I will also add some extra material if required... we will see...

Ideally the clamps can move independently of each other, allowing the greatest flexibility. This does present a problem however: how do I move all 6 (or 3 pairs of 2) at the same time, without needing 
6 individual motors?

To solve this problem I am going to start by thinking about failure modes. If the Electronic controls fail, It would be ideal for them to be manually overridden via brute force, i.e someone yanking on them. If they were to fail open whilst the car was driving then the payload could be lost, which would mean mission failure.

Steering servos use gears and can be moved pretty well by hand, but ideally I dont need 6 of them, and If I did have 6 they would have to be relatively powerful to keep the payload sercured. I could also use a set of very small linear actuators, however that would be incredibly complex and silly. As an engineer, I am required to find an incredibly simple, "why didn't I think of that" type solution. I think said solution will most likely involve springs in some way.

I continue the design process for this part in the [PAYLOAD.md](/journal/PAYLOAD.md) document.