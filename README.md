# Create Your Frisk easing library
## HOW TO USE
- include your file in the `EncounterStarting()`
- **call `AddEasing()` with the object name as a string (aka if you wanted to move a sprite named spr, you would input "spr")**
**time is in seconds, end_value is explanitory, ease is one of the EASE_TYPEs (check the source code if needed)**
**dir is one of the EASE_MODE_ENUM**
- make an `Update()` function in your encounter file
- call `UpdateEasings()` every frame

## LICENSE
- Credit would be appreciated, but you dont need to
- If you want to see the details, open up the LICENSE file

## EASINGS
- All easings sourced from [easings.net](https://easings.net/)
- Would recommend for finding the perfect easing

## HOW TO MAKE YOUR OWN EASING
- Pass in a string of your easing (in the ease type) (for example "ExampleEasing")
- Define a function with that Ease[name] (anywhere) (example "EasingExampleEasing") (the function takes in time and returns a value between 0-1)
- And you are done!
  
## HOW TO MAKE YOUR OWN EASING MODE
- Pass in the dir a string of your direction (ex. "ExampleDir")
- Define a function named EaseDir[name] (ex. "EaseDirExampleDir")
- And you are done!
