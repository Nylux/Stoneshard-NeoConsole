 function scr_neoconsole_npc_animation()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if (global.npc_animation_mode)
    {
        global.npc_animation_mode = 0
        scr_neoconsole_log("NPC Animation mode is now OFF.")
    }
    else
    {
        global.npc_animation_mode = 1
        scr_neoconsole_log("NPC Animation mode is now ON.")
    }
}