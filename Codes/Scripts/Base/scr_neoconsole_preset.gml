 function scr_neoconsole_preset()
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    scr_preset_create(0, 0, argument[0], scr_pressetGet("preset_encounter"))
    scr_neoconsole_log("Creating preset " + argument[0] + "...")
}