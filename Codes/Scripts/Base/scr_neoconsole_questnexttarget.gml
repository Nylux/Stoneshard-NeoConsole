 function scr_neoconsole_questnexttarget()
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    if (scr_quest_next_target(argument[0]))
        scr_neoconsole_log("Quest's target updated.")
    else
    {
        scr_neoconsole_log("Execution Exception :")
        scr_neoconsole_log("Quest's key " + argument[0] +" not found.")
        return;
    }

}