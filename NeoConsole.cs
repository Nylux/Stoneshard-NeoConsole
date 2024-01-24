using System.Diagnostics.CodeAnalysis;
using ModShardLauncher;
using ModShardLauncher.Mods;
using UndertaleModLib.Models;

namespace NeoConsole;

[SuppressMessage("Interoperability", "CA1416:Validate platform compatibility")]
public class NeoConsole : Mod
{
    public override string Name => "NeoConsole";
    public override string Author => "Nylux";
    public override string Description => "Enables a developer console to cheat, test things with or debug your mods.";
    public override string Version => "1.2.3";
    

    public override void PatchMod()
    { 
        LoadNeoConsoleScripts();
        InitNeoConsole();
        IsolateInput();
    }

    /// <summary>
    /// Adds all of NeoConsole's Scripts (aka console commands)
    /// </summary>
    public void LoadNeoConsoleScripts()
    {
        // STAGE 1 : CORE
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_0log.gml"), "scr_neoconsole_log");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_1help.gml"), "scr_neoconsole_help");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_enable.gml"), "scr_neoconsole_enable");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_init.gml"), "scr_neoconsole_init");
        
        // STAGE 2 : REQUIRED
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_s2r_nan.gml"), "scr_neoconsole_s2r_nan");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_UI_visible.gml"), "scr_neoconsole_UI_visible");
        
        // STAGE 3 : BASE
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_actionsLog.gml"), "scr_neoconsole_actionslog");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_allskills.gml"), "scr_neoconsole_allskills");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_boost.gml"), "scr_neoconsole_boost");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_buff.gml"), "scr_neoconsole_buff");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_butcher.gml"), "scr_neoconsole_butcher");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_clear.gml"), "scr_neoconsole_clear");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_condition.gml"), "scr_neoconsole_condition");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_consolesize.gml"), "scr_neoconsole_consolesize");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_damage.gml"), "scr_neoconsole_damage");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_debugmap.gml"), "scr_neoconsole_debugmap");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_devcam.gml"), "scr_neoconsole_devcam");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_devinfo.gml"), "scr_neoconsole_devinfo");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_drop.gml"), "scr_neoconsole_drop");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_dsDebugger.gml"), "scr_neoconsole_dsDebugger");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_enemyinfo.gml"), "scr_neoconsole_enemyinfo");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_exit.gml"), "scr_neoconsole_exit");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_fadeinfo.gml"), "scr_neoconsole_fadeinfo");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_find.gml"), "scr_neoconsole_find");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_fog.gml"), "scr_neoconsole_fog");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_getassetid.gml"), "scr_neoconsole_getassetid");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_getobjectname.gml"), "scr_neoconsole_getobjectname");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_getseed.gml"), "scr_neoconsole_getseed");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_getxp.gml"), "scr_neoconsole_getxp");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_globalset.gml"), "scr_neoconsole_globalset");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_godmode.gml"), "scr_neoconsole_godmode");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_injury.gml"), "scr_neoconsole_injury");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_killboss.gml"), "scr_neoconsole_killboss");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_load.gml"), "scr_neoconsole_load");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_locate_traps.gml"), "scr_neoconsole_locate_traps");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_mapstat.gml"), "scr_neoconsole_mapstat");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_minimap.gml"), "scr_neoconsole_minimap");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_nocd.gml"), "scr_neoconsole_nocd");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_nodeathmode.gml"), "scr_neoconsole_nodeathmode");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_npc_animation.gml"), "scr_neoconsole_npc_animation");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_overlay.gml"), "scr_neoconsole_overlay");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_preset.gml"), "scr_neoconsole_preset");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_psy.gml"), "scr_neoconsole_psy");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_questnexttarget.gml"), "scr_neoconsole_questnexttarget");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_questsettarget.gml"), "scr_neoconsole_questsettarget");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_reputation.gml"), "scr_neoconsole_reputation");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_room.gml"), "scr_neoconsole_room");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_save.gml"), "scr_neoconsole_save");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_setatr.gml"), "scr_neoconsole_setatr");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_setcaravan.gml"), "scr_neoconsole_setcaravan");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_sethp.gml"), "scr_neoconsole_sethp");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_setmp.gml"), "scr_neoconsole_setmp");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_sightplacelist.gml"), "scr_neoconsole_sightplacelist");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_skilltest.gml"), "scr_neoconsole_skilltest");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_spawn.gml"), "scr_neoconsole_spawn");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_spriteorigin.gml"), "scr_neoconsole_spriteorigin");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_time_scale.gml"), "scr_neoconsole_time_scale");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_tp.gml"), "scr_neoconsole_tp");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_warp.gml"), "scr_neoconsole_warp");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_weather.gml"), "scr_neoconsole_weather");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_gold.gml"), "scr_neoconsole_gold");
        
        // STAGE 4 : POST
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_lvl.gml"), "scr_neoconsole_lvl");
        ModLoader.AddFunction(ModFiles.GetCode("scr_neoconsole_time_change.gml"), "scr_neoconsole_time_change");
    }

    /// <summary>
    /// Implements NeoConsole's Logic and Rendering
    /// </summary>
    public void InitNeoConsole()
    {
        // Creating o_neoconsole gameobject 
        UndertaleGameObject oNeoconsole = ModLoader.AddObject("o_neoconsole");
        oNeoconsole.Persistent = true;
        
        // Spawning o_neoconsole and keeping it persistently loaded
        ModLoader.InsertGMLString(ModFiles.GetCode("nc_sessionDataInit.gml"), "gml_GlobalScript_scr_sessionDataInit", 51);
        ModLoader.InsertGMLString(ModFiles.GetCode("nc_persistentRoomController.gml"), "gml_Object_persistentRoomController_Other_11", 19);
        ModLoader.InsertGMLString(ModFiles.GetCode("nc_dataLoader.gml"), "gml_Object_o_dataLoader_Other_10", 7);
        
        
        // Adding o_neoconsole's Create Event
        ModLoader.AddCode(ModFiles.GetCode("nc_createEvent.gml"), "gml_Object_o_neoconsole_Create_0");
        var create = new UndertaleGameObject.Event();
        create.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = ModLoader.GetUMTCodeFromFile("gml_Object_o_neoconsole_Create_0")
        });
        oNeoconsole.Events[0].Add(create);

        
        // Adding o_neoconsole's Destroy Event
        ModLoader.AddCode(ModFiles.GetCode("nc_destroyEvent.gml"), "gml_Object_o_neoconsole_Destroy_0");
        var destroy = new UndertaleGameObject.Event();
        destroy.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = ModLoader.GetUMTCodeFromFile("gml_Object_o_neoconsole_Destroy_0")
        });
        oNeoconsole.Events[1].Add(destroy);
        

        // Adding o_neoconsole's Alarm 0 Event
        ModLoader.AddCode(ModFiles.GetCode("nc_alarm0Event.gml"), "gml_Object_o_neoconsole_Alarm_0");
        var alarm0 = new UndertaleGameObject.Event();
        alarm0.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = ModLoader.GetUMTCodeFromFile("gml_Object_o_neoconsole_Alarm_0")
        });
        oNeoconsole.Events[2].Add(alarm0);
        

        // Adding o_neoconsole's Step Event
        ModLoader.AddCode(ModFiles.GetCode("nc_stepEvent.gml"), "gml_Object_o_neoconsole_Step_0");
        var step = new UndertaleGameObject.Event();
        step.EventSubtypeStep = EventSubtypeStep.Step;
        step.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = ModLoader.GetUMTCodeFromFile("gml_Object_o_neoconsole_Step_0")
        });
        oNeoconsole.Events[3].Add(step);

        
        // Adding o_neoconsole's DrawGUI Event
        ModLoader.AddCode(ModFiles.GetCode("nc_drawGUIEvent.gml"), "gml_Object_o_neoconsole_DrawGUI_0");
        var drawGui = new UndertaleGameObject.Event();
        drawGui.EventSubtypeDraw = EventSubtypeDraw.DrawGUI;
        drawGui.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = ModLoader.GetUMTCodeFromFile("gml_Object_o_neoconsole_DrawGUI_0")
        });
        oNeoconsole.Events[8].Add(drawGui);
    }

    /// <summary>
    /// Hooks the menus and actions that can prevent NeoConsole from using input as text.
    /// </summary>
    public void IsolateInput()
    {
        // GML Injections
        
        ModLoader.LoadGML("gml_GlobalScript_scr_is_pressed_key").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();
        
        ModLoader.LoadGML("gml_GlobalScript_scr_is_key").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();

        ModLoader.LoadGML("gml_GlobalScript_scr_keyboard_control").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();
        
        ModLoader.LoadGML("gml_Object_oCamera_Step_1").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();
        
        ModLoader.LoadGML("gml_Object_o_Attitude_Step_1").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();
        
        ModLoader.LoadGML("gml_Object_o_music_button_Step_1").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();
        
        ModLoader.LoadGML("gml_Object_o_inv_switch_Other_10").MatchFrom("if global.consoleEnabled")
            .ReplaceBy("if global.consoleEnabled || global.neoconsole_enabled").Save();


        // Assembly Injections

        ModLoader.LoadAssemblyAsString("gml_Object_o_button_actionkey_Step_1")
            .MatchBelow(":[0]", 10)
            .ReplaceBy(ModFiles, "actionKeyStep.asm")
            // .Peek()
            .Save();

        ModLoader.LoadAssemblyAsString("gml_Object_o_player_Step_0")
            .MatchBelow("pushglb.v global.consoleEnabled", 4)
            .ReplaceBy(ModFiles, "playerStep.asm") // Make sure the `bf` instruction at the end targets the ** same label consoleEnabled targets + 1 **
            // .Peek()
            .Save();
    }
}