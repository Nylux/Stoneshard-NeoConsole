 if(global.neoconsole_enabled = true)
{
    draw_set_color(text_background_color) 
    draw_set_alpha(text_background_alpha)
    draw_rectangle(0, 0, hsize, vsize, false)

    draw_set_color(text_line_background) 
    draw_set_alpha(text_line_alpha)
    draw_rectangle(0, vsize-20, hsize, vsize, false)

    draw_set_font(font) 
    draw_set_color(text_primary_color)
    draw_set_alpha(text_primary_alpha)
    draw_set_valign(fa_bottom)
    var text_lines = array_length(text_)

    for(var i = 0; i < text_lines; i++)
    {
        var line_size
        line_size = string_height(string_hash_to_newline(text_[i]))
        draw_text_ext(4, vsize-(i*line_size)-32, string_hash_to_newline(text_[i]), -1, hsize)
    }

    draw_set_color(text_line_color)
    draw_set_alpha(text_line_alpha)
    draw_set_valign(fa_top)
    draw_text(4, vsize-20, string_hash_to_newline(text_currentline + cursor))
}
