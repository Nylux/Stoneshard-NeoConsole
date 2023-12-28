 function scr_neoconsole_mapstat()
{
    var _dungeon = 0
    var _settlement = 0
    var _pointOfInterest = 0
    var _ghoulDen = 0
    var _harpyNest = 0
    var _hornetHive = 0
    var _deerHuntingGrounds = 0
    var _boarHuntingGrounds = 0
    var _bearHuntingGrounds = 0
    var _wolfHuntingGrounds = 0
    var _mooseHuntingGrounds = 0
    var _bisonHuntingGrounds = 0
    var _saigaHuntingGrounds = 0
    var _bigLocation = 0
    var _crawlerBurrow = 0
    var _banditcamp = 0
    var _banditcampMid = 0
    var _banditcampSteppe = 0
    var _dungeonBastion = 0
    var _dungeonCrypt = 0
    var _dungeonCatacombs = 0
    var _randomEncounter = 0
    var _roadCart = 0
    var _roadAltar = 0

    var _size = ds_map_size(global.locationMap)
    var _key = ds_map_find_first(global.locationMap)

    for (var _i = 0; _i < _size; _i++)
    {
        var _location = ds_map_find_value(global.locationMap, _key)
        switch _location.type
        {
            case "PointOfInterest":
                _pointOfInterest++
                break
            case "RandomEncounter":
                _randomEncounter++
                break
            case "Settlement":
                _settlement++
                break
            case "Dungeon":
                _dungeon++
                break
        }

        switch _location.class
        {
            case "Banditcamp":
            case "AbadoneBanditcamp":
                _banditcamp++
                break
            case "GhoulDen":
                _ghoulDen++
                break
            case "HarpyNest":
                _harpyNest++
                break
            case "HornetHive":
                _hornetHive++
                break
            case "CrawlerBurrow":
                _crawlerBurrow++
                break
            case "DeerHuntingGrounds":
                _deerHuntingGrounds++
                break
            case "BoarHuntingGrounds":
                _boarHuntingGrounds++
                break
            case "BearHuntingGrounds":
                _bearHuntingGrounds++
                break
            case "WolfHuntingGrounds":
                _wolfHuntingGrounds++
                break
            case "MooseHuntingGrounds":
                _mooseHuntingGrounds++
                break
            case "BisonHuntingGrounds":
                _bisonHuntingGrounds++
                break
            case "SaigaHuntingGrounds":
                _saigaHuntingGrounds++
                break
            case "Location":
                _bigLocation++
                break
            case "Bastion":
                _dungeonBastion++
                break
            case "Crypt":
                _dungeonCrypt++
                break
            case "Catacombs":
                _dungeonCatacombs++
                break
            case "RoadCart":
                _roadCart++
                break
            
            case "RoadAltar":
                _roadAltar++
                break
        }

        _key = ds_map_find_next(global.locationMap, _key)
    }

    for (var _x = 0; _x < global.worldWidth; _x++)
    {
        for (var _y = 0; _y < global.worldHeight; _y++)
        {
            if (ds_map_find_value(ds_grid_get(global.terrainGrid, _x, _y), "Class") == "Banditcamp")
            {
                var _biome = ds_map_find_value(ds_grid_get(global.terrainGrid, _x, _y), "Biome")
                switch _biome
                {
                    case "Middle":
                    case "Pine":
                        _banditcampMid++
                        break
                    case "Steppe":
                        _banditcampSteppe++
                        break
                }
            }
        }
    }

    scr_neoconsole_log("GlType_Dungeon: " + string(_dungeon))
    scr_neoconsole_log("    GlClass_Dungeon_Bastion: " + string(_dungeonBastion))
    scr_neoconsole_log("    GlClass_Dungeon_Crypt: " + string(_dungeonCrypt))
    scr_neoconsole_log("    GlClass_Dungeon_Catacombs: " + string(_dungeonCatacombs))
    scr_neoconsole_log("GlType_POI: " + string(_pointOfInterest))
    scr_neoconsole_log("    GlClass_POI_Banditcamp " + string(_banditcamp))
    scr_neoconsole_log("        Middle & Pine: " + string(_banditcampMid))
    scr_neoconsole_log("        Steppe: " + string(_banditcampSteppe))
    scr_neoconsole_log("    GlClass_POI_GhoulDen: " + string(_ghoulDen))
    scr_neoconsole_log("    GlClass_POI_HarpyNest: " + string(_harpyNest))
    scr_neoconsole_log("    GlClass_POI_HornetHive: " + string(_hornetHive))
    scr_neoconsole_log("    GlClass_POI_CrawlerBurrow: " + string(_crawlerBurrow))
    scr_neoconsole_log("    GlClass_POI_DeerHuntingGrounds: " + string(_deerHuntingGrounds))
    scr_neoconsole_log("    GlClass_POI_BoarHuntingGrounds: " + string(_boarHuntingGrounds))
    scr_neoconsole_log("    GlClass_POI_WolfHuntingGrounds: " + string(_wolfHuntingGrounds))
    scr_neoconsole_log("    GlClass_POI_MooseHuntingGrounds: " + string(_mooseHuntingGrounds))
    scr_neoconsole_log("    GlClass_POI_BisonHuntingGrounds: " + string(_bisonHuntingGrounds))
    scr_neoconsole_log("    GlClass_POI_SaigaHuntingGrounds: " + string(_saigaHuntingGrounds))
    scr_neoconsole_log("    GlClass_POI_Location: " + string(_bigLocation))
    scr_neoconsole_log("GlType_RandomEncounter: " + string(_randomEncounter))
    scr_neoconsole_log("    GlClass_RandomEncounter_RoadCart: " + string(_roadCart))
    scr_neoconsole_log("    GlClass_RandomEncounter_RoadAltar: " + string(_roadAltar))
    scr_neoconsole_log("GlType_Settlement: " + string(_settlement))
}