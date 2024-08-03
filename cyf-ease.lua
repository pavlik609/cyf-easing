easings = {}
ease_types_i = {["inOutSine"] = 1,["inSine"] = 1,["outSine"] = 1}
-- [REFERENCE - input_move] [NUMBER - time] (in seconds) [NUMBER - end_value] for all of the functions
function AddEasing(input_move,time,end_value,ease) 
    local easing = {}
    if ease_types_i[ease] == nil then
        DEBUG("cyf-ease : Invalid easing type '" .. ease .. "'")
    else
        easing["time"] = time*60
        easing["time_orig"] = time*60
        easing["input"] = input_move
        easing["end_value"] = end_value
        easing["ease"] = ease
        table.insert(easings,easing)
    end
end
-- wall of functions
  -- sines
    function EaseInOutSine(time)
        return (math.sin(time*math.pi-math.pi/2)+1)/2
    end

    function EaseInSine(time)
        return math.sin(time/2*math.pi-math.pi/2)+1
    end
    function EaseOutSine(time)
        return math.sin(time/2*math.pi)
    end
  -- quad(ratic)s
    function EaseInOutQuad(time)
        return (time < 0.5) and 2*time*time or 1 - math.pow(-2*time+2,2)/2
    end

    function EaseInQuad(time)
        return time * time
    end
    function EaseOutQuad(time)
        return 1-(1-time)*(1-time)
    end
  -- cubics
    function EaseInOutCubic(time)
        return (time < 0.5) and 4*time*time*time or 1 - math.pow(-2 * time + 2, 3) / 2
    end

    function EaseInCubic(time)
        return time * time
    end
    function EaseOutCubic(time)
        return 1 - math.pow(1 - time, 3)
    end

function UpdateEasings()
    for i=#easings,1,-1 do
        local ease = easings[i]
        --DEBUG(easings[1]["time"])
        if ease["time"] == nil then ease["time"] = 0 end
        if ease["time"] > 0 then
            ease["time"] = ease["time"]-1
            local transfer = 0
            local real_t = math.abs(ease["time"]-ease["time_orig"])/ease["time_orig"]
            if ease["ease"] == "inOutSine" then
                transfer = EaseInOutSine(real_t)*ease["end_value"]
            elseif ease["ease"] == "inSine" then
                transfer = EaseInSine(real_t)*ease["end_value"]
            elseif ease["ease"] == "outSine" then
                transfer = EaseOutSine(real_t)*ease["end_value"]
            end
            DEBUG(ease["input"])
            _G[ease["input"]].x = transfer
        else
            table.remove(easings,i)
        end
    end
end