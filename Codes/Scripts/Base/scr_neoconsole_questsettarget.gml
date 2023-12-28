 function scr_neoconsole_questsettarget()
{
    if (argument_count < 3)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    
    var _value = string_to_real(argument[2])

    if (scr_quest_set_progress(argument[0], argument[1], _value))
        scr_neoconsole_log("Quest " + argument[0] + " updated to target " + argument[1])
    else
    {
        scr_neoconsole_log("Execution Exception :")
        scr_neoconsole_log("Incorrect quest data.")
        return;
    }
}