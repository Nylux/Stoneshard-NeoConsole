 function scr_neoconsole_getseed()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    scr_neoconsole_log(string(global.seed))
}