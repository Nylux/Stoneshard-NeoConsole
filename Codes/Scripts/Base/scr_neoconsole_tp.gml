 // Needs a rewrite. NOT STANDALONE.
// Relies on a global var provided by the original console.
// Doesn't work, because the original script didn't work either.
// Temporarily replaced with a tp to mouse cursor function.

/*
 function scr_neoconsole_tp()
 {
     if (argument[0] != "")
     {
         scr_neoconsole_log("Invalid number of arguments.")
         return;
     }

     if global.is_teleporting
     {
         global.is_teleporting = 0
         scr_neoconsole_log("Teleporting is now OFF.")
     }
     else
     {
         global.is_teleporting = 1
         scr_neoconsole_log("Teleporting is now ON.")
     }
 }
*/

 function scr_neoconsole_tp()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    with(instance_create(scr_round_cell(mouse_x), scr_round_cell(mouse_y), o_teleport))
        owner = o_player 
}