 function scr_neoconsole_clear()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    else
    {
        while (array_length(text_) > 0)
            array_pop(text_)
    }
}
