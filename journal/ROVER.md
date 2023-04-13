#### [< Back to README.md](/README.md)

# Rover Building
This document details the process I followed to turn my traxxas slash into a autonomous rover.

## Initial Planning and designs

The Traxxas Slash, like most remote control cars, has a flimsy plastic body that attaches to the chassis via 4 mounting poles. The body is non structual, and mostly serves as a protective cover, allowing crashes and rollovers to occur without damaging the vehicle. It also has front and rear bumpers, as well as side bash bars, for maximum saftey. 

Ideally, All modifications added to the car are completely reverseable, "bolt on" modifications.

I initially wanted to mount the navigation equipment in place of the body, via attaching a plate to the four mounting points. I tested this, and found it was not a bad solution. The car drove fine with the plate installed despite the increase in center of gravity, However there are a couple of issues with this design, the main one being that the navigation system would not be protected in event of a rollover, (which would be more likely due to the increase in CG). The other issue is that the body mounts are not designed to deal with the huge forces that I would be creating with all the extra weight.

I then came across this [forum post](https://diydrones.com/group/ardurover-user-group/forum/pixhawk-equipped-4wd-traxxas-slash-chassis?commentId=7447824%3AComment%3A1586066) which basically solves all my problems. 

As you can see in the following images, The navigation systems are mounted on a plate much closer to the chassis.

<img src='../media/otherover1.JPG'>
<img src='../media/otherover2.JPG'>
<img src='../media/otherover3.JPG'>
<img src='../media/otherover4.JPG'>

This is a far better design then what I was going for, so Credit to [Thomas J Coyle III](https://diydrones.com/members/ThomasJCoyleIII) for that. 
I will be attempting to reverse engineer these designs so I figured credit was a good idea...

I will be laser cutting the navigation plate out of acrylic, which will mean I can be very precise in the nav mount design. 

I plan to construct two versions, one for prototyping, and one as the final design. This will allow me to figure out exactly which electronics and computers I need without worrying about space on the rover, before constructing the most efficient plate, saving weight and space 

## Navigation Computers

As I previously mentioned when talking about Ardupilot, I needed a couple of peices of hardware to make my car into a rover

- Ardupilot control module
- GPS module
- Telemetry/control TX/RX system
- Sonar/IR for obstical avoidance (maybe)

### Ardupilot Control Module

The control module is the bit that makes everything happen. It plugs into the speed controller and steering servo to drive the rover, as well as recieving GPS signal from the GPS module. It also allows for manual control of the rover if needed from the regular remote control, buzzer connections to be added (for locating a lost rover) and for a emergency safety switch to be connected. 

The ideal system, if avalible, would be the [Pixhawk 4](https://holybro.com/products/pixhawk-4?variant=41527199498429), which is unfortunately out of stock and very expensive. Its also a bit overkill for what I need, since I am using a rover and not a drone/aeroplane with complex shennanigans going on.


