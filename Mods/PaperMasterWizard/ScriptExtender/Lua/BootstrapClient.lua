Ext.Require("NP_ListWizard.lua")
Ext.Require("NP_ListSorcerer.lua")
Ext.Require("NP_ListEldknight.lua")

local modGuid = "2f2fcc24-6c70-43f8-944b-2cf032f8aff9"
local subClassGuid = "fab18e55-107a-45e8-a92f-0b394919addb"
local BootStrap = {}

-- If SCF is loaded, use it to load Subclass into Progressions. Otherwise, DIY.
if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
  local subClasses = {
    HavsglimtChronurgyMagic = {
      modGuid = modGuid,
      subClassGuid = subClassGuid,
      class = "wizard",
      subClassName = "Paper Master"
    }
  }

  local function OnStatsLoaded()
    Mods.SubclassCompatibilityFramework = Mods.SubclassCompatibilityFramework or {}
    Mods.SubclassCompatibilityFramework.API = Mods.SubclassCompatibilityFramework.Api or {}
    Mods.SubclassCompatibilityFramework.API.InsertSubClasses(subClasses)
  end

  Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)
-- If SCF isn't installed, insert class into Progression if another mod overwrites the Progression
else
  local function InsertSubClass(arr)
    table.insert(arr, subClassGuid)
  end

  local function DetectSubClass(arr)
    for _, value in pairs(arr) do
      if value == subClassGuid then
        return true
      end
    end
  end

  function BootStrap.loadSubClass(arr)
    print("Rhys was here")
    if arr ~= nil then
      local found = DetectSubClass(arr)
      if not found then
        InsertSubClass(arr)
      end
    end
  end

  BootStrap.loadSubClass(Ext.Definition.Get("25842d23-b188-4c87-9085-aacb6eb35761", "Progression").SubClasses)
end