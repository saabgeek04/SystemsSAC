#### [< Back to README.md](/README.md)

# Payload Grabby Thing
This document details the design process I used to create the Clamps system that will secure my payload. 

## Initial Designs 

<img src='../media/clampdemo1.png'>

I designed the inital clamps whilst on a plane to western australia, and all they really do is grab the payload and pull it down. They were very simple clamps but they worked, somewhat. I was sitting next to my dad on the plane, so him and I discussed the clamps and their shape quite a bit, and we started focusing on shape optimisation.

With my dads reccomendation I removed as much excess material as possible to create the most barebones clamp possible, then I can make it look pretty once I know all the design constraints. 
Using a stress test we can see that there is not much, if not very little wasted material.

<img src='../media/Barebones Stresstest.png'>

You can also see in this image that just around the pivot point there is significant stress. Ideally when I complete the design it will have two points, allowing for better load distribution. I will also add some extra material if required... we will see...

The other issue is failure modes. Ideally, the clamps fail shut so that the cargo is locked in place until it reaches its destination, where, upon arrival, it can be removed via a manual override. If the clamps were to fail open whilst the car was driving then the payload could be lost, which would mean mission failure

Steering servos use gears and can be moved pretty well by hand, but ideally I dont need 6 of them, and If I did have 6 they would have to be relatively powerful to keep the payload sercured. I could also use a set of very small linear actuators, however that would be incredibly complex and silly, as well as very hard to override manually As an engineer, I am required to find an incredibly simple, "why didn't I think of that before" type solution. I think said solution will most likely involve springs in some way.

## Design Process 

I started by thinking about the motion I want the payload to follow when it is loaded and unloaded, and realised that I could get the clamps to follow the payloads motion via pressure.