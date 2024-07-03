if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
  local lists = {
    ListAddition = {
      modGuid = "2f2fcc24-6c70-43f8-944b-2cf032f8aff9",
      TargetList = "485a68b4-c678-4888-be63-4a702efbe391",
      ListType = "SpellList",
      ListItems = {
        "Projectile_PaperArrow",
        "Projectile_CardStorm",
      }
    },
  }

  local function OnStatsLoaded()
    Mods.SubclassCompatibilityFramework.Api.InsertToList(lists)
  end
  Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)
end