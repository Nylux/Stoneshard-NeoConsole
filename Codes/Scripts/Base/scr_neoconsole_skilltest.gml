 function scr_neoconsole_skilltest()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if global.skill_test
    {
        global.skill_test = 0
        scr_neoconsole_log("Enemy skill test mode is now OFF.")
    }
    else
    {
        global.skill_test = 1
        scr_neoconsole_log("Enemy skill test mode is now ON.")
    }
}