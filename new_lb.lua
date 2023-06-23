ProfiLEDBar = {}
ProfiLEDBar.__index = ProfiLEDBar

-- Create a new instance of an LED bar controller
-- Params:
-- channel - Number from 1 to 15
function ProfiLEDBar:create(channel)
    local bar = {
        
    }
    -- Set the super object for the instance
    setmetatable(bar, ProfiLEDBar)

    return bar
end

function ProfiLEDBar: