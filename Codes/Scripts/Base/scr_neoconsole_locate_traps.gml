 function scr_neoconsole_locate_traps()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    
    with (o_trap)
        locate = 1
    scr_neoconsole_log("Located " + string(instance_number(o_trap)) + " traps.")
}