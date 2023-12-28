 // Will need a rewrite eventually.
// Relies on original console's global var.
// NOT STANDALONE.

 function scr_neoconsole_nodeathmode()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if (global.playerNoDeathMode)
    {
        global.playerNoDeathMode = 0
        scr_neoconsole_log("No Death Mode is now OFF.")
    }
    else
    {
        global.playerNoDeathMode = 1
        scr_neoconsole_log("No Death Mode is now ON.")
    }
}
