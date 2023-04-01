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

![](https://lh3.googleusercontent.com/cCvXNmqAJQ-Dzde6Edks9Jgcj7sBC_KAo0_wGmh6R-JNMMeAL0P5p_DAWde3b8YiSKtgVkuWM6rpzyeH77Pm35y30xxK-fpQv64y8bZr0GqIGiZyVgs8SOBW173tsOYG5bb0Bzg_VqCsZa3A8IKvnbJjsRLAkWzcedbbvzvXfQaDtdLyuD2dtpHmqYCJ2huL6yCtL1Lvz9MUIKdnny4SO4rXSJYtKarYt0j2UVLjObjb8sBBcidYbHesRW0CjaQ9eNNxwhGmfa5eLCRzgEZoWd5Sr68XB_qBzL2O3Yn7ly7fFERdwxHGQF4XTnSCfq2P6ZYSpEHLkqsSZZzK7Nm_FwICf1S071HIsIt2NgllapRoXOauZLz7k25R7HXRanPbonoyLTWaJA7SjvTZ7_B6i-FJIcsUzPElK729iMZtwo3t54w5d-4rfPNC0TixWHhWna4Hv49gUcMfYLT3MNmX_n2VZPQSyBy45MvSUvBHErS8AuLyIeGc9gY71JLdDTCkIVwa_wjOxutOXE4zE_tWubxW0xLMJYoVQQQLVekeMYtdXsGOuA45APB331n7sB6Xp56kNV-P3MsZD9HL85dC6URxeC3f1sLSvc05SbFpA6ZHpv-YL5MnXsMGwu0om-PWRLInmZtAcjbZjXU_471v37jW0ZE7MH2UCEV5MYWE7H4lFvqIqtk9tLbE7jEJgEjkZlmljgDR8OFUuReqiVYm9Fy5vc_aCQ0UixOvgtojGsRKgwrGhsa_v9izNZ78skEPBCiUsmhMY7P9btSyjMSFQXnKRweO4iZ_mOdFRM1OpyJDXIvnrilnoAqplHU3X7mxO1X8iBTSUgvoJesRud7Ews1GOXbLYjyFYzo4pW-JTXjg57V0mUbY9CBF1G9-tX5DQdVo_Pk1XPFqjKhhqf6CPwtinrSfJsopKeQtH3xoHt6jS43AQshPaFftVbE6VvDxVOc8GpEyf9Hi_Q0RjAST6Ug=w1510-h1133-s-no?authuser=0)  
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
My initial ideas for the payload so far have been to deliver a cylinder about the size of a 600ml water bottle or maybe a pringles can. The payload will be secured to the vehicle via a custom designed clamping system. I am considering using a seatbelt style strap + tensioner as well, which would allow me to secure multiple types of package. 

### A Cylinder? Why not a box
I am choosing to use a cylinder for a couple of reasons, primarily because they are very easy for a human to hold due to the shape. It also gives me a fun engineering challenge in terms of securing it as it is more complex and less conventional compared to a box. A cylindrical payload could also be transported via other methods, and would be far better for transporting liquids for human consumption (who knows, someone could really really need a bottle of mount franklin!). 

### Loading System
I 