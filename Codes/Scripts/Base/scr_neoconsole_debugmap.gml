 // What the fuck does this even do ?
// Needs more research.
// Untested, obviously.

 function scr_neoconsole_debugmap()
{
    if (!variable_global_exists("globalmapDebug"))
        global.globalmapDebug = 0

    global.globalmapDebug = (!global.globalmapDebug)

    if global.globalmapDebug
        scr_neoconsole_log("Map debug is now ON.")
    else
        scr_neoconsole_log("Map debug is now OFF.")
}