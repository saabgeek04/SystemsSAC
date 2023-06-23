-- New ProfiLED lightbar script by orca
-- TODO: Untested!

ProfiLEDBar = {}
ProfiLEDBar.__index = ProfiLEDBar

-- Static --
-- Log a message
-- 
-- Params:
-- message - Message to log
function ProfiLEDBar.log(message)
    gcs:send_text(6, "ProfiLED: " .. message)
end

-- Create a new instance of an LED bar controller
-- 
-- Params:
-- channel - Number from 1 to 16 corresponding to the Ardupilot channel.
-- num_leds - Number of LEDs attached to the strip.
function ProfiLEDBar:create(channel, num_leds)
    -- Check the channel is in the valid range
    if channel < 1 or channel > 16 then
        return ProfiLEDBar.log("Invalid channel " .. tostring(channel))
    end

    -- Get the actual channel. Starts at 94 to 109 corresponding to 1 to 16.
    local actual_channel = SRV_Channels:find_channel(channel + 93)

    -- Check we got a channel
    if not actual_channel then
        return ProfiLEDBar.log("Failed to get channel " .. tostring(channel))
    end

    -- Init the channel with the set number of LEDs
    serialLED:set_num_profiled(actual_channel, num_leds)

    local bar = {}
    -- Set the super object for the instance
    setmetatable(bar, ProfiLEDBar)

    -- Channel is 1-indexed from here on
    bar.channel = actual_channel + 1
    bar.num_leds = num_leds

    return bar
end

-- Set the colour of an LED on the strip with RGB
-- LEDs will not physically change until send() is called.
-- 
-- Params:
-- led_number - one-indexed number of the LED on the strip
-- red - 0-255 level of red
-- green - 0-255 level of green
-- blue - 0-255 level of blue
function ProfiLEDBar:set_led(led_number, red, green, blue)
    -- led number is zero-indexed, we fix here for external consistency
    serialLED:set_RGB(self.channel, led_number - 1, red, green, blue)
end

-- Set a single colour for every LED on the strip.
-- LEDs will not physically change until send() is called.
-- 
-- Params:
-- red - 0-255 level of red
-- green - 0-255 level of green
-- blue - 0-255 level of blue
function ProfiLEDBar:set(red, green, blue)
    for led = 1, self.num_leds do
        self.set_led(led, red, green, blue)
    end
end

-- Send the data for the strip's channel. LEDs will not update until called.
function ProfiLEDBar:send()
    serialLED:send(self.channel)
end

------------------------------------------------------------------
--                          Example                             --
------------------------------------------------------------------

-- Start script, ran once.
local function start()

    -- Delay between running the loop in milis
    -- 20ms = 50hz
    local delay = 20

    -- Create our test lightbar using channel 9
    local bar = ProfiLED.create(9)

    -- Check if we succeeded, if not, bail
    if not bar then
        ProfiLEDBar.log("Failed to init the bar, bailing")
        -- Try again after 2s
        return start, 2000
    end

    -- Keep track of time for cycling colour
    local time = 0

    -- Program main loop
    local function loop()

        local red = (time) % 255
        local green = (time + 250) % 255
        local blue = (time + 500) % 255

        bar:set(red, green, blue)
        bar:send()

        time = time + 1
        return loop, delay
    end

    -- Begin the loop
    return loop, delay
end

-- Start the start function the first time
-- TODO: why wait a second first?
return start, 1000