global.neoconsole_enabled = 0 
global.neoconsole_toggle_key = vk_f2
text_ = ""
text_def = ">. " 
text_[0] = ""
text_currentline = text_def 
erase = -1
lastcommand = ""
cursor = "|" 
cursor_blink_delay = 15 
alarm[0] = cursor_blink_delay
font = f_dmg_eu 
hsize = window_get_width() 
vsize = window_get_height() 
text_background_color = c_black 
text_background_alpha = 0.6 
text_primary_color = c_white 
text_primary_alpha = 0.9 
text_line_color = c_white 
text_line_alpha = 0.6 
text_line_background = c_black 
commandsMap = ds_map_create()
helpSyntaxMap = ds_map_create()
helpUsageMap = ds_map_create()
scr_neoconsole_init() 
scr_neoconsole_log("[NeoConsole] " + string(ds_map_size(commandsMap)) + " scripts loaded.")
scr_neoconsole_log("[NeoConsole] " + string(ds_map_size(helpUsageMap)) + " helps loaded.")
scr_neoconsole_log("[NeoConsole] Made with a lot of pain by Nylux.")
scr_neoconsole_log("[NeoConsole] Powered by Modshard Launcher.")
