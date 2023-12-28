using System.Diagnostics.CodeAnalysis;
using ModShardLauncher;
using ModShardLauncher.Mods;
using UndertaleModLib.Models;
using System.IO;

namespace NeoConsole;

[SuppressMessage("Interoperability", "CA1416:Validate platform compatibility")]
public class NeoConsole : Mod
{
    public override string Name => "NeoConsole";
    public override string Author => "Nylux";
    public override string Description => "Enables a developer console to cheat or test things with.";
    public override string Version => "1.0.0";
    

    public override void PatchMod()
    {
        ModLoader.InsertDecompiledCode("var o_neoconsole = asset_get_index(\"o_neoconsole\")", "ScriptEngine_create", 1);
        LoadNeoConsoleScripts();
        InitNeoConsole();
        //IsolateInput();
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
        // STAGE 4 : POST
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
        ModLoader.InsertDecompiledCode(ModFiles.GetCode("nc_sessionDataInit.gml"), "gml_GlobalScript_scr_sessionDataInit", 51);
        ModLoader.InsertDecompiledCode(ModFiles.GetCode("nc_persistentRoomController.gml"), "gml_Object_persistentRoomController_Other_11", 19);
        ModLoader.InsertDecompiledCode(ModFiles.GetCode("nc_dataLoader.gml"), "gml_Object_o_dataLoader_Other_10", 7);
        
        
        // Adding o_neoconsole's Create Event
        ModLoader.AddCode(ModFiles.GetCode("nc_createEvent.gml"), "gml_Object_o_neoconsole_Create_0");
        var create = new UndertaleGameObject.Event();
        create.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = ModLoader.GetCode("gml_Object_o_neoconsole_Create_0")
        });
        oNeoconsole.Events[0].Add(create);

        
        // Adding o_neoconsole's Destroy Event
        ModLoader.AddCode(ModFiles.GetCode("nc_destroyEvent.gml"), "gml_Object_o_neoconsole_Destroy_0");
        var destroy = new UndertaleGameObject.Event();
        destroy.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = ModLoader.GetCode("gml_Object_o_neoconsole_Destroy_0")
        });
        oNeoconsole.Events[1].Add(destroy);
        

        // Adding o_neoconsole's Alarm 0 Event
        ModLoader.AddCode(ModFiles.GetCode("nc_alarm0Event.gml"), "gml_Object_o_neoconsole_Alarm_0");
        var alarm0 = new UndertaleGameObject.Event();
        alarm0.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = ModLoader.GetCode("gml_Object_o_neoconsole_Alarm_0")
        });
        oNeoconsole.Events[2].Add(alarm0);
        

        // Adding o_neoconsole's Step Event
        ModLoader.AddCode(ModFiles.GetCode("nc_stepEvent.gml"), "gml_Object_o_neoconsole_Step_0");
        var step = new UndertaleGameObject.Event();
        step.EventSubtypeStep = EventSubtypeStep.Step;
        step.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = ModLoader.GetCode("gml_Object_o_neoconsole_Step_0")
        });
        oNeoconsole.Events[3].Add(step);

        
        // Adding o_neoconsole's DrawGUI Event
        ModLoader.AddCode(ModFiles.GetCode("nc_drawGUIEvent.gml"), "gml_Object_o_neoconsole_DrawGUI_0");
        var drawGui = new UndertaleGameObject.Event();
        drawGui.EventSubtypeDraw = EventSubtypeDraw.DrawGUI;
        drawGui.Actions.Add(new UndertaleGameObject.EventAction()
        {
            CodeId = ModLoader.GetCode("gml_Object_o_neoconsole_DrawGUI_0")
        });
        oNeoconsole.Events[8].Add(drawGui);
    }

    /// <summary>
    /// Hooks the menus and actions that can prevent NeoConsole from using input as text. (REQUIRES DISASSEMBLY EDITING, WHICH IS UNSUPPORTED RN)
    /// </summary>
    public void IsolateInput()
    {
        ModLoader.ReplaceDecompiledCode("if (!global.consoleEnabled && !global.neoconsole_enabled)", "gml_GlobalScript_scr_is_pressed_key", 2);
        ModLoader.ReplaceDecompiledCode("if (!global.consoleEnabled && !global.neoconsole_enabled)", "gml_GlobalScript_scr_is_key", 2);
        ModLoader.ReplaceDecompiledCode("if (!global.consoleEnabled && !global.neoconsole_enabled)", "gml_GlobalScript_scr_keyboard_control", 4);
        ModLoader.ReplaceDecompiledCode("if (!global.consoleEnabled && !global.neoconsole_enabled)", "gml_Object_oCamera_Step_1", 12);
        ModLoader.ReplaceDecompiledCode("if (!global.consoleEnabled && !global.neoconsole_enabled)", "gml_Object_o_Attitude_Step_1", 1);
        ModLoader.ReplaceDecompiledCode("if (!global.consoleEnabled && !global.neoconsole_enabled)", "gml_Object_o_music_button_Step_1", 0);
        
        ModLoader.ReplaceDecompiledCode("if global.consoleEnabled || global.neoconsole_enabled", "gml_Object_o_inv_switch_Other_10", 12);
        
        /*
        File.WriteAllText(Directory.GetCurrentDirectory() + "\\assembly1.txt", ModLoader.GetDisassemblyCode("gml_Object_o_button_actionkey_Step_1"));
        var text = File.ReadAllText(Directory.GetCurrentDirectory() + "\\assembly1.txt");
        text = text.Replace("bf [2]", "bf [800]\n\npushglb.v global.neoconsole_enabled\nconv.v.b\nnot.b\nb [801]\n\n:[800]\npush.e 0\n\n:[801]\nbf [2]\n");
        File.WriteAllText(Directory.GetCurrentDirectory() + "\\assembly1.txt", text);
        ModLoader.SetDisassemblyCode(File.ReadAllText(Directory.GetCurrentDirectory() + "\\assembly1.txt"), "gml_Object_o_button_actionkey_Step_1");
        */
        
        //ModLoader.ReplaceDecompiledCode("if (!global.consoleEnabled && !global.neoconsole_enabled)", "gml_Object_o_player_Step_0", 240);
    }
}