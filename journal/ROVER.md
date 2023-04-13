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

### Which to buy on a budget?

The control module is the bit that makes everything happen. It plugs into the speed controller and steering servo to drive the rover, as well as recieving GPS signal from the GPS module.

The ideal system, if avalible, would be the [Pixhawk 4](https://holybro.com/products/pixhawk-4?variant=41527199498429), which is unfortunately out of stock and very expensive. Its also a bit overkill for what I need, since I am using a rover and not a drone/aeroplane with complex shennanigans going on.

I started looking for a cheaper flight controller and eventually found a kit on aliexpress that for the price of a regular Pixhawk, would give me all the hardware I need + a Pixhawk clone, as a bunch of bonus bits. [This is the kit](https://www.aliexpress.com/item/33058886931.html) and I plan on purchasing the "915V1 1000MWPackageC" Variant.

This variant comes with a cable that has a voltage regulator built in to power the Pixhawk clone, meaning no cable splicing is required. It also features 1000mw 933mhz radio, which will do the job. 933hz is not as fast as regular 2.4Ghz, but for my application it will be fine. The 1000mw rating means I will have plenty of range too.

The included GPS module may not be very good, but I happen to have a large box of GPS modules, which were used 20 years ago for mapping and surveying large areas. They are fitted with USB connectors currently, but I can always solder different connectors on if required. I plan to stick with a single GPS unless I start having issues. 

The kit also contains a safety switch (basically a big red emergency stop button but without the big and red parts), a buzzer that can be enabled if the rover is lost and a sd card to be used as a rudimentry "Black Box".

I think this kit, which at this time is on sale for $335 is the best option for me at the moment.