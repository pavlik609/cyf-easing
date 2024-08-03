easings = {}
ease_types = {["inOutSine"] = EaseInOutSine}
-- [REFERENCE - input_move] [NUMBER - time] (in seconds) [NUMBER - end_value] for all of the functions
function AddEasing(input_move,time,end_value,ease) 
    local easing = {}
    if ease_types[ease] == nil then
        Debug("cyf-ease : Invalid easing type '" .. ease .. "'")
    else
        easing["time"] = time*60
        easing["input"] = input_move
        easing["end_value"] = end_value
        easing["func"] = ease_types[ease]
        table.insert(easings,easing)
    end
end
function EaseInOutSine(input_move,time,end_value)
    input_move = (math.sin(time*math.pi)+1)*end_value
end

function UpdateEasings()
    for i=#easings,1 do
        local ease = easings[i]
        if ease["time"] > 0 then
            ease["time"] = ease["time"]-1
            ease["func"](ease["input"],ease["time"],ease["end_value"])
        else
            table.remove(easings,ease)
        end
    end
end