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
