easings = {}
EASE_TYPES = {IN_OUT_SINE = "InOutSine",IN_SINE = "InSine",OUT_SINE = "InOutSine",
IN_OUT_QUAD  = "InOutQuad" ,IN_QUAD  = "InQuad" ,OUT_QUAD  = "OutQuad" ,
IN_OUT_CUBIC = "InOutCubic",IN_CUBIC = "InCubic",OUT_CUBIC = "OutCubic",
IN_OUT_QUART = "InOutQuart",IN_QUART = "InQuart",OUT_QUART = "OutQuart",
IN_OUT_QUINT = "InOutQuint",IN_QUINT = "InQuint",OUT_QUINT = "OutQuint",
IN_OUT_EXPO  = "InOutExpo" ,IN_EXPO  = "InExpo" ,OUT_EXPO  = "OutExpo" ,
IN_OUT_CIRC  = "InOutCirc" ,IN_CIRC  = "InCirc" ,OUT_CIRC  = "OutCirc" ,
IN_OUT_BACK  = "InOutBack" ,IN_BACK  = "InBack" ,OUT_BACK  = "OutBack" ,
IN_OUT_ELAST="InOutElastic",IN_ELAST="InElastic",OUT_ELAST="OutElastic",
IN_OUT_BOUNCE="InOutBounce",IN_BOUNCE="InBounce",OUT_BOUNCE="OutBounce",}
backConst = 1.70158
backConst2 = backConst + 1
backConst3 = backConst * 1.525
elastConst = (2 * math.pi) / 3
elastConst2 = (2 * math.pi) / 4.5
bounceConst = 7.5625
bounceConst2 = 2.75
-- [REFERENCE - input_move] [NUMBER - time] (in seconds) [NUMBER - end_value] for all of the functions
function AddEasing(input_move,time,end_value,ease) 
    local easing = {}
    easing["time"] = time*60
    easing["time_orig"] = time*60
    easing["input"] = input_move
    easing["end_value"] = end_value
    easing["ease"] = ease
    table.insert(easings,easing)
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
        return time * time * time
    end
    function EaseOutCubic(time)
        return 1 - math.pow(1 - time, 3)
    end


  -- quarts
    function EaseInOutQuart(time)
        return (time < 0.5) and 8 * time * time * time * time or 1 - math.pow(-2 * time + 2, 4) / 2
    end
    function EaseInQuart(time)
        return time * time * time * time
    end
    function EaseOutQuart(time)
        return  1 - Math.pow(1 - time, 4)
    end
    

  -- quints
    function EaseInOutQuint(time)
        return (time < 0.5) and 16 * math.pow(time,5) or 1 - math.pow(-2 * time + 2, 5) / 2
    end
    function EaseInQuint(time)
        return time * time * time * time * time
    end
    function EaseOutQuint(time)
        return  1 - Math.pow(1 - time, 5)
    end


  -- expos
    function EaseInOutExpo(time)
        return (time < 0.5) and 16 * math.pow(time,5) or 1 - math.pow(-2 * time + 2, 5) / 2
    end
    function EaseInExpo(time)
        return math.pow(2, 10 * time - 10)
    end
    function EaseOutExpo(time)
        return 1 - math.pow(2, -10 * time)
    end


  -- circs
    function EaseInOutCirc(time)
        return (time < 0.5) and (1 - math.sqrt(1 - math.pow(2 * time, 2))) / 2 or (math.sqrt(1 - math.pow(-2 * time + 2, 2)) + 1) / 2
    end
    function EaseInCirc(time)
        return 1 - math.sqrt(1 - math.pow(time, 2))
    end
    function EaseOutCirc(time)
        return math.sqrt(1 - math.pow(time - 1, 2))
    end


  -- backs
    function EaseInOutBack(time)
        return (time < 0.5) and (math.pow(2 * time, 2) * ((backConst3 + 1) * 2 * time - backConst3)) / 2 or (math.pow(2 * time - 2, 2) * ((backConst3 + 1) * (time * 2 - 2) + backConst3) + 2) / 2
    end
    function EaseInBack(time)
        return backConst2 * time * time * time - backConst * time * time;
    end
    function EaseOutBack(time)
        return 1 + backConst2 * math.pow(time - 1, 3) + backConst * math.pow(time - 1, 2);
    end

  -- elasts
    function EaseInOutElastic(time)
        return (time < 0.5) and -(math.pow(2, 20 * time - 10) * math.sin((20 * time - 11.125) * elastConst2)) / 2 or (math.pow(2, -20 * time + 10) * math.sin((20 * time - 11.125) * elastConst2)) / 2 + 1;
    end
    function EaseInElastic(time)
        return -math.pow(2, 10 * time - 10) * math.sin((time * 10 - 10.75) * elastConst);
    end
    function EaseOutElastic(time)
        return math.pow(2, -10 * time) * math.sin((time * 10 - 0.75) * elastConst) + 1;
    end

-- bounces
    function EaseInOutBounce(time)
        return (time < 0.5) and (1 - EaseOutBounce(1 - 2 * time)) / 2 or (1 + EaseOutBounce(2 * time - 1)) / 2
    end
    function EaseInBounce(time)
        return 1 - EaseOutBounce(1 - time)
    end
    function EaseOutBounce(time)
      
        if time < (1 / bounceConst2) then
            return bounceConst * time * time
        elseif time < (2 / bounceConst2) then
            time = time - (1.5 / bounceConst2)
            return bounceConst * (time) * time + 0.75
        elseif time < (2.5 / bounceConst2) then
            time = time - (2.25/ bounceConst2)
            return bounceConst * (time) * time + 0.9375
        else 
            time = time - (2.625 / bounceConst2)
            return bounceConst * (time) * time + 0.984375
        end
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
            local fn_name = "Ease" .. ease["ease"]
            if _G[fn_name] ~= nil then
                _G[ease["input"]].x = _G[fn_name](real_t)*ease["end_value"]
            else
                DEBUG("cyf-ease : Invalid easing type '" .. ease["ease"] .. "'")
            end
        else
            table.remove(easings,i)
        end
    end
end