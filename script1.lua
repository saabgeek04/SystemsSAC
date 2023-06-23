
-- Logging helper function
function lb_log(message)
    gcs:send_text(6, "LED Lightbar: " .. message)
end

lb_log("Initialising")

-- this sets the LED strip length, i.e. the parameter in Ardupilot
local num_leds = 20

--unsure of function, copied in for testing
local timer = 0

-- find_channel finds the first channel of a data type and returns its physical channel number
-- channels 94 and up seem to be SERVOX_FUNCTION data output channels
-- channel numbers here do not correspond to the real channel numbers in the software
-- 
-- Reserved for ProfiLED:
-- 129: ProfiLED 1
-- 130: ProfiLED 2
-- 131: ProfiLED 3
-- 132: ProfiLED Clock
-- Channels 94 to 109 are usable for further LEDs.

local led_data = SRV_Channels:find_channel(129)
local led_clock = SRV_Channels:find_channel(132)

-- Check we got valid channels
if not led_clock then
    return lb_log("Failed to find led_clock")
end 

lb_log("Found clock on channel #" .. tostring(led_clock + 1))

if not led_data then
    return lb_log("Failed to find led_data")
end 


lb_log("Found LED data on channel #" .. tostring(led_data + 1))

--profiled init. 

