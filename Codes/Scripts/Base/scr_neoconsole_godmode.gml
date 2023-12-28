 // Will need a rewrite eventually.
// Relies on original console's global vars.
// NOT STANDALONE.

 function scr_neoconsole_godmode()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if (global.playerGodMode)
    {
        global.playerGodMode = 0
        global.playerNoPain = 0
        global.is_nocd = 0
        scr_neoconsole_log("God Mode is now OFF.")
    }
    else
    {
        global.playerGodMode = 1
        global.playerNoPain = 1
        global.is_nocd = 1
        scr_neoconsole_log("God Mode is now ON.")
    }
}
