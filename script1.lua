
-- Logging helper function
function lb_log(message)
    gcs:send_text(6, "LED Lightbar: " .. message)
end

-- Helper init function for a strip
-- channel: internal channel
-- num_leds: number of LEDs on the strip
function lb_init(channel, num_leds)
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
    local real_channel = SRV_Channels:find_channel(channel)
    
    -- Check channel is valid
    if not real_channel then
        lb_log("Failed to find LED channel for internal channel " .. tostring(channel))
        return nil
    end

    -- Other functions expect one-indexed channel number
    real_channel = real_channel + 1

    -- Init the number of channel LEDs
    serialLED:set_num_profiled(real_channel,  num_leds)

    -- Return the real channel number for further use
    return real_channel
end

-- Wrapper function to set a specific LED's colour
-- LEDs will not physically change until lb_send() is called.
-- channel: Physical channel number
-- led_number: zero-indexed number of the LED on the strip
-- red: 0-255 level of red
-- green: 0-255 level of green
-- blue: 0-255 level of blue
function lb_set_led(channel, led_number, red, green, blue)
    serialLED:set_RGB(channel, led_number, red, green, blue)
end

-- Wrapper function to set an entire light bar to a colour.
-- LEDs will not physically change until lb_send() is called.
-- channel: Physical channel number
-- num_leds: number of LEDs on the strip
-- red: 0-255 level of red
-- green: 0-255 level of green
-- blue: 0-255 level of blue
function lb_set_colour(channel, num_leds, red, green, blue)
    for led = 0, num_leds-1 do
        lb_set_led(channel, led, red, green, blue)
    end
end

-- Wrapper function to send data for the LED
-- Call this when you have finished setting the state of each LED.
function lb_send_data(channel)
    serialLED:send(channel)
end

lb_log("Initialising")

-- Init the LED strip
local num_leds = 20
local strip = lb_init(129, num_leds)

-- Exit program if we can't find the strip
if not strip then
    return
end

-- Rate at which loop should run in milis.
local delay = 20

-- Test main loop. Runs repeatedly by returning itself as the function to run.
function loop()
    lb_set_colour(strip, num_leds, 255, 0, 0)
    lb_send_data(strip)

    return loop, delay
end

-- Begin the loop by returning it initially.
-- todo: why do we wait 1 second? startup time? try testing other vals
return loop, 1000