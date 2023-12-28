 // REQUIRES scr_neoconsole_fog() AND scr_neoconsole_npc_animation()

 function scr_neoconsole_spriteorigin()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if global.spriteOriginEditor
    {
        if (!global.fog)
            scr_neoconsole_fog("")
        if global.is_teleporting
            global.is_teleporting = 0
        
        global.spriteOriginEditor = 0
        instance_destroy(o_spriteOriginEditor)
        scr_neoconsole_log("Sprite origin editor is now OFF.")
        scr_neoconsole_npc_animation("")
    }
    else
    {
        if global.fog
            scr_neoconsole_fog("")
        if !global.is_teleporting
            global.is_teleporting = 1

        global.spriteOriginEditor = 1
        instance_create_depth(-50, -50, 0, o_spriteOriginEditor)
        scr_neoconsole_log("Sprite origin editor is now ON.")
        scr_neoconsole_npc_animation("")
    }
}