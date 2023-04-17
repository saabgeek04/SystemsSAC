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

<img src='../media/trace1'>
<img src='../media/thicctrace'>

I did this on the same document I used to make [this acrylic plate](/journal/WEEKLY.md#23rd-february) as the measurements for the body mounts were somewhat accurate (+-1.5mm).