 // Not sure what the weather info does ?
// Needs more research.

 function scr_neoconsole_weather()
{    
    if (argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    switch argument[0]
    {
        case "rain":
            if (!(ds_map_find_value(global.weatherDataMap, "active")))
            {
                scr_weatherEnable()
                scr_neoconsole_log("Enabled rain.")
            }
            else
                scr_neoconsole_log("It's already raining.")
            break
        
        case "clear":
            if (ds_map_find_value(global.weatherDataMap, "active"))
            {
                scr_weatherDisable()
                with (o_shader_start)
                    saturationRain = 0
                scr_neoconsole_log("Weather cleared.")
            }
            else
                scr_neoconsole_log("Weather is already cleared.")
            break

        case "info":
            if (global.weatherInfo)
            {
                global.weatherInfo = 0
                scr_neoconsole_log("Weather information is now OFF.")
            }
            else
            {
                global.weatherInfo = 1
                scr_neoconsole_log("Weather information is now ON.")
            }
            break

        default:
            scr_neoconsole_log("Weather " + argument[0] + " not found.")
            break
    }
}