 function scr_neoconsole_log()
{
    if (string(object_get_name(self.object_index)) == "o_neoconsole") 
    {
        for (var i = (array_length(text_) - 1); i >= 0; i--) 
            text_[(i + 1)] = text_[i]
        text_[0] = "" 
        for (i = 0; i < argument_count; i++) 
            text_[0] += (string(argument[i]) + " ")
        text_currentline = text_def 
    }
    else
        scr_actionsLogUpdate("scr_neoconsole_log was called from an unexpected object : " + string(object_get_name(self.object_index)) + ".")
}
