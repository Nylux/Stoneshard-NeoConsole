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
    public override string Version => "1.3.0";
    public override string TargetVersion => "0.8.2.10";


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
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_0log.gml"), "scr_neoconsole_log");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_1help.gml"), "scr_neoconsole_help");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_enable.gml"), "scr_neoconsole_enable");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_init.gml"), "scr_neoconsole_init");
        
        // STAGE 2 : REQUIRED
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_s2r_nan.gml"), "scr_neoconsole_s2r_nan");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_UI_visible.gml"), "scr_neoconsole_UI_visible");
        
        // STAGE 3 : BASE
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_actionsLog.gml"), "scr_neoconsole_actionslog");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_allskills.gml"), "scr_neoconsole_allskills");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_boost.gml"), "scr_neoconsole_boost");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_buff.gml"), "scr_neoconsole_buff");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_butcher.gml"), "scr_neoconsole_butcher");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_clear.gml"), "scr_neoconsole_clear");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_condition.gml"), "scr_neoconsole_condition");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_consolesize.gml"), "scr_neoconsole_consolesize");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_damage.gml"), "scr_neoconsole_damage");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_debugmap.gml"), "scr_neoconsole_debugmap");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_devcam.gml"), "scr_neoconsole_devcam");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_devinfo.gml"), "scr_neoconsole_devinfo");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_drop.gml"), "scr_neoconsole_drop");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_dsDebugger.gml"), "scr_neoconsole_dsDebugger");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_enemyinfo.gml"), "scr_neoconsole_enemyinfo");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_exit.gml"), "scr_neoconsole_exit");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_fadeinfo.gml"), "scr_neoconsole_fadeinfo");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_find.gml"), "scr_neoconsole_find");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_fog.gml"), "scr_neoconsole_fog");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_getassetid.gml"), "scr_neoconsole_getassetid");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_getobjectname.gml"), "scr_neoconsole_getobjectname");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_getseed.gml"), "scr_neoconsole_getseed");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_getxp.gml"), "scr_neoconsole_getxp");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_globalset.gml"), "scr_neoconsole_globalset");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_godmode.gml"), "scr_neoconsole_godmode");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_injury.gml"), "scr_neoconsole_injury");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_killboss.gml"), "scr_neoconsole_killboss");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_load.gml"), "scr_neoconsole_load");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_locate_traps.gml"), "scr_neoconsole_locate_traps");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_mapstat.gml"), "scr_neoconsole_mapstat");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_minimap.gml"), "scr_neoconsole_minimap");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_nocd.gml"), "scr_neoconsole_nocd");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_nodeathmode.gml"), "scr_neoconsole_nodeathmode");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_npc_animation.gml"), "scr_neoconsole_npc_animation");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_overlay.gml"), "scr_neoconsole_overlay");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_preset.gml"), "scr_neoconsole_preset");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_psy.gml"), "scr_neoconsole_psy");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_questnexttarget.gml"), "scr_neoconsole_questnexttarget");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_questsettarget.gml"), "scr_neoconsole_questsettarget");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_reputation.gml"), "scr_neoconsole_reputation");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_room.gml"), "scr_neoconsole_room");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_save.gml"), "scr_neoconsole_save");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_setatr.gml"), "scr_neoconsole_setatr");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_setcaravan.gml"), "scr_neoconsole_setcaravan");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_sethp.gml"), "scr_neoconsole_sethp");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_setmp.gml"), "scr_neoconsole_setmp");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_sightplacelist.gml"), "scr_neoconsole_sightplacelist");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_skilltest.gml"), "scr_neoconsole_skilltest");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_spawn.gml"), "scr_neoconsole_spawn");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_spriteorigin.gml"), "scr_neoconsole_spriteorigin");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_time_scale.gml"), "scr_neoconsole_time_scale");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_tp.gml"), "scr_neoconsole_tp");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_warp.gml"), "scr_neoconsole_warp");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_weather.gml"), "scr_neoconsole_weather");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_gold.gml"), "scr_neoconsole_gold");
        
        // STAGE 4 : POST
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_lvl.gml"), "scr_neoconsole_lvl");
        Msl.AddFunction(ModFiles.GetCode("scr_neoconsole_time_change.gml"), "scr_neoconsole_time_change");
    }

    /// <summary>
    /// Implements NeoConsole's Logic and Rendering
    /// </summary>
    public void InitNeoConsole()
    {
        // Creating o_neoconsole gameobject 
        UndertaleGameObject oNeoconsole = Msl.AddObject("o_neoconsole");
        oNeoconsole.Persistent = true;
        oNeoconsole.Visible = true;
        
        // Spawning o_neoconsole and keeping it persistently loaded
        Msl.InsertGMLString(ModFiles.GetCode("nc_sessionDataInit.gml"), "gml_GlobalScript_scr_sessionDataInit", 51);
        Msl.InsertGMLString(ModFiles.GetCode("nc_persistentRoomController.gml"), "gml_Object_persistentRoomController_Other_11", 19);
        Msl.InsertGMLString(ModFiles.GetCode("nc_dataLoader.gml"), "gml_Object_o_dataLoader_Other_10", 7);
        
        
        // Adding o_neoconsole's Create Event
        Msl.AddCode(ModFiles.GetCode("nc_createEvent.gml"), "gml_Object_o_neoconsole_Create_0");
        var create = new UndertaleGameObject.Event();
        create.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = Msl.GetUMTCodeFromFile("gml_Object_o_neoconsole_Create_0")
        });
        oNeoconsole.Events[0].Add(create);

        
        // Adding o_neoconsole's Destroy Event
        Msl.AddCode(ModFiles.GetCode("nc_destroyEvent.gml"), "gml_Object_o_neoconsole_Destroy_0");
        var destroy = new UndertaleGameObject.Event();
        destroy.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = Msl.GetUMTCodeFromFile("gml_Object_o_neoconsole_Destroy_0")
        });
        oNeoconsole.Events[1].Add(destroy);
        

        // Adding o_neoconsole's Alarm 0 Event
        Msl.AddCode(ModFiles.GetCode("nc_alarm0Event.gml"), "gml_Object_o_neoconsole_Alarm_0");
        var alarm0 = new UndertaleGameObject.Event();
        alarm0.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = Msl.GetUMTCodeFromFile("gml_Object_o_neoconsole_Alarm_0")
        });
        oNeoconsole.Events[2].Add(alarm0);
        

        // Adding o_neoconsole's Step Event
        Msl.AddCode(ModFiles.GetCode("nc_stepEvent.gml"), "gml_Object_o_neoconsole_Step_0");
        var step = new UndertaleGameObject.Event();
        step.EventSubtypeStep = EventSubtypeStep.Step;
        step.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = Msl.GetUMTCodeFromFile("gml_Object_o_neoconsole_Step_0")
        });
        oNeoconsole.Events[3].Add(step);

        
        // Adding o_neoconsole's DrawGUI Event
        Msl.AddCode(ModFiles.GetCode("nc_drawGUIEvent.gml"), "gml_Object_o_neoconsole_DrawGUI_0");
        var drawGui = new UndertaleGameObject.Event();
        drawGui.EventSubtypeDraw = EventSubtypeDraw.DrawGUI;
        drawGui.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = Msl.GetUMTCodeFromFile("gml_Object_o_neoconsole_DrawGUI_0")
        });
        oNeoconsole.Events[8].Add(drawGui);
    }

    /// <summary>
    /// Hooks the menus and actions that can prevent NeoConsole from using input as text and accidentally trigger actions while typing.
    /// </summary>
    public void IsolateInput()
    {
        // GML Injections
        
        Msl.LoadGML("gml_GlobalScript_scr_is_pressed_key").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();
        
        Msl.LoadGML("gml_GlobalScript_scr_is_key").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();

        Msl.LoadGML("gml_GlobalScript_scr_keyboard_control").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();
        
        Msl.LoadGML("gml_Object_oCamera_Step_1").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();
        
        Msl.LoadGML("gml_Object_o_Attitude_Step_1").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();
        
        Msl.LoadGML("gml_Object_o_music_button_Step_1").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();
        
        Msl.LoadGML("gml_Object_o_inv_switch_Other_10").MatchFrom("if global.consoleEnabled")
            .ReplaceBy("if global.consoleEnabled || global.neoconsole_enabled").Save();

        Msl.LoadGML("gml_Object_o_abilities_Step_1").MatchFrom("if (!global.consoleEnabled)")
            .ReplaceBy("if (!global.consoleEnabled && !global.neoconsole_enabled)").Save();


        // Assembly Injections

        Msl.LoadAssemblyAsString("gml_Object_o_button_actionkey_Step_1")
            .MatchBelow(":[0]", 10)
            .ReplaceBy(ModFiles, "actionKeyStep.asm")
            // .Peek()
            .Save();

        Msl.LoadAssemblyAsString("gml_Object_o_player_Step_0")
            .MatchBelow("pushglb.v global.consoleEnabled", 4)
            .ReplaceBy(ModFiles, "playerStep.asm") // Make sure the `bf` instruction at the end targets the ** same label consoleEnabled targets + 1 **
            // .Peek()
            .Save();
    }
}
