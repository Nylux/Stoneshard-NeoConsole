 // Needs a rewrite. NOT STANDALONE.
// Relies on a global var provided by the original console.
// Should probably also check for skills already on cooldown and remove cooldown from them.

 function scr_neoconsole_nocd()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if global.is_nocd
    {
        global.is_nocd = 0
        scr_neoconsole_log("No Cooldown mode is now OFF.")
    }
    else
    {
        global.is_nocd = 1
        scr_neoconsole_log("No Cooldown mode is now ON.")
    }
}