 if (keyboard_check_pressed(global.neoconsole_toggle_key)) 
    scr_neoconsole_enable()

if global.neoconsole_enabled = false 
    exit

if (keyboard_check(vk_backspace) && (string_length(text_currentline) > string_length(text_def))) 
{
    if (erase >= 2) 
    {
        text_currentline = string_copy(text_currentline, 1, string_length(text_currentline)-1)
        erase = 0
    }
    else
        erase++
}
if keyboard_check(vk_up) 
    text_currentline = lastcommand

var command = ""
var arg
arg[0] = ""
var argCount = 0

if (keyboard_check_released(vk_enter) && string_length(text_currentline) > string_length(text_def)) 
{
    lastcommand = text_currentline
    text_currentline = text_currentline + " " 
    var word = ""

    for(var i = string_length(text_def); i < string_length(text_currentline); i++)
    {
        var next_char = string_char_at(text_currentline, i+1)
        if (next_char != " ")
            word += next_char
        else
        {
            if (command == "")  
            {  
                if ds_map_exists(commandsMap, word)  
                {  
                    command = string(ds_map_find_value(commandsMap, word))  
                    word = ""   
                }  
                else  
                {  
                    scr_neoconsole_log(text_currentline)  
                    scr_neoconsole_log("Unknown command.")  
                    command = ""  
                    word = ""  
                    break  
                }  
            }
            else
            {
                arg[argCount] = word
                argCount++
                word = ""
            }
        }
    }

    if (script_exists(asset_get_index(command))) 
    {
        scr_neoconsole_log(text_currentline)
        script_execute_ext(asset_get_index(command), arg)
    }
}

if (keyboard_lastkey != -1)
{
    switch(keyboard_lastkey) 
    {
        case vk_shift:
        case vk_lshift:
        case vk_rshift:
        case vk_control:
        case vk_lcontrol:
        case vk_rcontrol:
        case vk_alt:  
        case vk_lalt:  
        case vk_ralt:
        case vk_up:
        case vk_down:
        case vk_left:
        case vk_right:
        case vk_enter:
        case global.neoconsole_toggle_key:
        case vk_backspace:
            keyboard_lastkey = -1
            keyboard_lastchar = -1
            exit
        break
    }
    text_currentline += keyboard_lastchar 
    keyboard_lastkey = -1
}
