#### [< Back to README.md](/README.md)

# Rover Building
This document details the process I followed to turn my Traxxas slash into a autonomous rover.

## Initial Planning and designs

The Traxxas Slash, like most hobby class remote control cars, has a flimsy plastic body that attaches to the chassis via 4 mounting poles. The body is non structural, and mostly serves as a protective cover, allowing crashes and rollovers to occur without damaging the vehicle. It also has front and rear bumpers, as well as side bash bars, for maximum safety. 

Ideally, All modifications added to the car are completely reversible, "bolt on" modifications.

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

As I previously mentioned when talking about Ardupilot, I needed a couple of pieces of hardware to make my car into a rover

- Ardupilot control module
- GPS module
- Telemetry/control TX/RX system
- Sonar/IR for obstacle avoidance (maybe)

### Which to buy on a budget?

The control module is the bit that makes everything happen. It plugs into the speed controller and steering servo to drive the rover, as well as receiving GPS signal from the GPS module.

The ideal system, if available, would be the [Pixhawk 4](https://holybro.com/products/pixhawk-4?variant=41527199498429), which is unfortunately out of stock and very expensive. Its also a bit overkill for what I need, since I am using a rover and not a drone/aeroplane with complex shenanigans going on.

I started looking for a cheaper flight controller and eventually found a kit on aliexpress that for the price of a regular Pixhawk, would give me all the hardware I need + a Pixhawk clone, as a bunch of bonus bits. [This is the kit](https://www.aliexpress.com/item/1005005167479286.html) and I plan on purchasing the "915V1 1000MWPackageC" Variant. I know I said earlier that I didn't need all the functionality of a fully fledged Pixhawk, but I couldn't really find a better kit for the money. 

This variant comes with a cable that has a voltage regulator built in to power the Pixhawk clone, meaning no cable splicing is required. It also features 1000mw 433mhz radio, which will do the job. 433mhz is not as fast as regular 2.4Ghz, but for my application it will be fine. The 1000mw rating means I will have plenty of range too. Originally I planned to use a 933mhz system, but due to legal requirements I cannot. The power limit for 433mhz is only 25mw ERIP, the ERIP of my radio system is about 100mw, so I'll just turn it down a bit :wink: 

The included GPS module may not be very good, but I happen to have a large box of GPS modules, which were used 20 years ago for mapping and surveying large areas. They are fitted with USB connectors currently, but I can always solder different connectors on if required. I plan to stick with a single GPS unless I start having issues. 

The kit also contains a safety switch (basically a big red emergency stop button but without the big and red parts), a buzzer that can be enabled if the rover is lost and a sd card to be used as a rudimentary "Black Box".

I think this kit, which at this time is on sale for $335 is the best option for me at the moment. Obviously, in an ideal world I would not have to worry about cost and I would just spec out the best solution for this, but I don't have that luxury (Someone sponsor me!) so I'll be doing this all on the cheap, which is kind of the wrong way around if you think about the RC car I'm using as a base. 

There are a couple of other options that are cheaper, but they miss out on certain sensors like a compass, which I may need, and I would hate to order the cheaper kit and need a compass or something else and have to spend more money + time getting a new kit. Once I sort everything out, I will write out a set of minimum requirements so that anyone can spec out a system that works for them for a better price.

## Designing the Navigation platform 

Whilst I wait for the Navigation computer to arrive, I will begin designing the platform for everything to reside on. At this point in time, since I am away, I do not have access to the car itself, but I have previously measured out parts of the car that I can then combine with an arial shot of the car to get approximate measurements. When I return home I will be able to take some more precise measurements of the car to further refine the model. I know that I am not the most precise measurerer, so I will build in adjustability in form of some slots. I will also cut prototypes out of cardboard to make sure everything fits properly without wasting material (a mistake I made previously...oops)
To create the initial plan design I traced a top down photo of the rover chassis, not very precise, but I can tidy it up later

<img src='../media/trace1.png'>
<img src='../media/thicctrace.png'>

I did this on the same document I used to make [this acrylic plate](/journal/WEEKLY.md#23rd-february) as the measurements for the body mounts were somewhat accurate (+-1.5mm). When I have access to the rover in person again, I will be able to measure out the length of each side and draw a new sketch to suit.

There are alot of different forces at play during rover operation, and I want the computers to stay relatively safe during this. I expect to hitting lots of bumps and other obstacles, and even if I do upgrade the suspension, theres only so much it can do to smooth things out. The primary computer comes with a anti vibration mount, but the rest of the stuff does not, fortunately, we can 3D print TPU (a kind of rubber), which I will use to make rubber "washers" that will soak up a decent amount of vibration.

<img src='../media/rubberwasher.png'>
<i>an expertly drawn cross section of the rubber washer design</i>

When I got back from WA, I measured out the exact(ish) dimensions of the chassis, which was difficult without removing parts of the car but I managed to do it.

<img src='../media/chassismeasure.jpg'>

Its not the greatest of photos, but it doesn't need to be either.

I struggled to get everything to line up, but then I got the width and length measurements and that helped alot with sorting out everything. I wasn't sure what angle the 65 and 63.5 bits were on, so I made circles with the same radius and used the intersecting point of those two circles, which worked very well!

<img src='../media/trace2.png'>

In this next image, the blue is the old one and the grey is the new one, as you can see 

<img src='../media/trace3.png'>

In class, I cut this trace out using cardboard, and no suprises here, it didn't fit properly. I went through 5 iterations, every time getting closer and closer to perfection. I still need to make the 5th piece narrower at the back, that way I can accommodate the suspension. The laser cutter we have is amazing for rapid prototyping in this instance, as I can cut, review and redesign over and over, all using cardboard that would have otherwise been thrown away.

<img src='../media/5thplate.jpg'>

## Complete Redesign

I realised it wasnt super efficient or really worth mounting everything on a single plate, and I also wasnt happy with the mounting system at all. I made up some parts in fusion360. The idea with these was to make my mount alot stronger and less wobbly, reducing stress and enabling me to mount things better. 

<img src='../media/fusionmountss.png'>

I then 3d printed these pieces, one at a time due to the dubious reliablility of the 3d printers. 

<img src='../media/newsidemount.jpg'>  
<img src='../media/newmountbro.jpg'>  

Notice that the reciever and ESC just floating around in the car. I ended up making a mounting plate 

<img src='../media/finishedmounts.jpg'>

This week, I finished printing the other mount and laser cut some cross braces. I built holes into the cross braces, that way I could mount the pixhawk and I also lowered the GPS. I was initially concerned about the GPS getting less reception due to being down lower, but in practice, this was not the case. On occasion, I noticed I had one less satellite, so no really huge difference there

I also mounted the speed controller and reciever much lower and properly wwith 3M DualLock velcro tape, which works really well.

After some brief testing, I found that I needed to make some mudguards to stop grass and mud entering the rover. I prototyped some parts out of cardboard, which worked pretty well and got rid of 99% of the debris, but the cardboard was not going to last very long, see below:

<img src='../media/cbmf1.jpg'>
<img src="../media/cbmf.jpg">

To fix this, I made some new parts out of coreflute. These look much cooler, and dont get saturated when used in water. I still have some water hitting the underside of the "cabin" portion of the body, and this can cause water to drip down into the "isloated" space where the electronics are, so I am going to look into getting a waterproof mesh cover or something similar. If I wanted everything totally waterproof, then I would probably put everything in a tuppawere container, but this is not a boat, so I should be fine.

![](2023-06-16-09-58-38.png)
![](2023-06-16-09-58-59.png)

This was also done on relatively tall, wet grass, which is difficult for a whole host of other reasons.

## Lightbar 

I really wanted to have a lightbar that woudl show me some status lights as well as work as navigation lights at night. The Ardupilot actually has support for profiLED and neopixel LEDs, but if you wanna do fancy stuff with them like I do, you actually need to write some lua scripts. I am by no means any good at programming. To date, the most I've done is make a javascript... script? that rotates a window on a website to face the cursor, very similar to a steam trading card. 

I looked at some example code, and with the help of a much more skilled friend, went through and we tried to make a script that would work. After about 4 hours of troubleshooting, much refactoring and 2 new wiring harnesses, we gave up on profiLED.

![](../media/image.png)

<i>part of the code we wrote</i>

I then tried using Neopixels instead, but could not get any output out of the Pixhawk at all.

## Obstacle avoidance and LIDAR

I had a little budget left and really wanted to have obstacle avoidance, so I spent $80 and bought a TF02 Lidar sensor off aliexpress. It suprisingly only took two weeks to ship, and when it arrived I had to repin it, but once that was done I plugged it in, set the relevant parameters and.... nothing. It was getting pretty annoying having nothing new work with the Pixhawk, sooo...

## Firmware

It was at this point I decided to reflash the firmware on the pixhawk. I backed up all the parameters and reflashed Ardupilot rover onto it. This fixed nothing. This kinda sucked. I had a look at other options for Pixhawk firmware as well as different GCS (ground control software). I landed on running PX4 firmware (as opposed to ardupilot, which I was previously running) and using [QGroundControl](http://qgroundcontrol.com/). This combination seems to be more of an industry standard(?) and is the "it just works" solution compared to ardupilot, which is more of a hobby class solution. I haven't started on getting LIDAR or the lightbar working on Qgroundcontrol, but currently, I'm happy that its just working, and the user experience on Qgroundcontrol is much nicer than Ardupilot. It's highly likey that my issues with LIDAR and NeoPixel are due to me purchasing a flight controller off aliexpress, but its worth trying all the software first before I come to that conclusion. 

