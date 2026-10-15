local _, ns = ...
local applied = false
local selectorInstalled = false
function ns.InstallNaxxSelector()
    if selectorInstalled or not hooksecurefunc or not AtlasLoot_ShowItemsFrame or not AtlasLoot10Man25ManSwitch then return end
    local button=AtlasLoot10Man25ManSwitch
    local originalClick=button:GetScript("OnClick")
    button:SetScript("OnClick",function(self,...)
        if not self.fmNaxxPage then
            if originalClick then return originalClick(self,...) end
            return
        end
        local refresh=AtlasLootItemsFrame.refresh
        if not refresh then return end
        local heroic=not self.fmNaxxHeroic
        AtlasLoot.db.profile.Bigraid=false
        AtlasLoot.db.profile.BigraidHeroic=false
        AtlasLoot.db.profile.HeroicMode=heroic
        AtlasLoot_ShowItemsFrame(self.fmNaxxPage..(heroic and "HEROIC" or ""),refresh[2],"",refresh[4])
    end)
    hooksecurefunc("AtlasLoot_ShowItemsFrame",function(dataID)
        button.fmNaxxPage=nil
        if type(dataID)~="string" or not (dataID:match("^Naxx80") or dataID:match("^Sartharion") or dataID:match("^Malygos")) then return end
        local base=dataID:gsub("HEROIC",""):gsub("25Man","")
        if not AtlasLoot_Data[base] or not AtlasLoot_Data[base.."HEROIC"] then return end
        local heroic=dataID:find("HEROIC",1,true)~=nil
        button.fmNaxxPage=base; button.fmNaxxHeroic=heroic
        button:SetText(heroic and "Show Normal Loot" or "Show Heroic Loot")
        button:Show()
        AtlasLootItemsFrame_Heroic:Hide()
        local registry=AtlasLoot_TableNames[base]
        if registry and AtlasLoot_BossName then AtlasLoot_BossName:SetText(registry[1].." - "..(heroic and "Heroic" or "Normal")) end
    end)
    selectorInstalled=true
end
local function IsT7(key)
    return key:match("^Naxx80") or key:match("^Sartharion") or key:match("^Malygos")
end
local function Clone(value)
    if type(value) ~= "table" then return value end
    local copy = {}
    for k,v in pairs(value) do copy[k] = Clone(v) end
    if ns.CopyCurrencyOrigin then ns.CopyCurrencyOrigin(value,copy) end
    return copy
end
function ns.ApplyT7Mapping()
    if applied or not AtlasLoot_Data or not AtlasLoot_TableNames then return end
    local normal, large = {}, {}
    for key,rows in pairs(AtlasLoot_Data) do
        if type(key)=="string" and IsT7(key) and not key:find("HEROIC",1,true) and not key:find("25Man",1,true) then
            if AtlasLoot_Data[key.."25Man"] then
                normal[key] = rows
                large[key] = AtlasLoot_Data[key.."25Man"]
            end
        end
    end
    if not next(normal) then return end
    local function Variant(source, map)
        local rows=Clone(source)
        for _,field in ipairs({"Next","Prev","Back"}) do if rows[field] and map[rows[field]] then rows[field]=map[rows[field]] end end
        return rows
    end
    local normal25, heroic10, heroic25 = {}, {}, {}
    for key in pairs(normal) do
        normal25[key]=key.."25Man"
        heroic10[key.."25Man"]=key.."HEROIC"
        heroic25[key.."25Man"]=key.."25ManHEROIC"
    end
    local count=0
    for key,rows in pairs(normal) do
        local registry=AtlasLoot_TableNames[key] or {key,"AtlasLootWotLK"}
        AtlasLoot_Data[key.."25Man"] = Variant(rows,normal25)
        AtlasLoot_Data[key.."HEROIC"] = Variant(large[key],heroic10)
        AtlasLoot_Data[key.."25ManHEROIC"] = Variant(large[key],heroic25)
        AtlasLoot_TableNames[key.."HEROIC"] = {registry[1],"AtlasLootFrostmourne"}
        AtlasLoot_TableNames[key.."25ManHEROIC"] = {registry[1],"AtlasLootFrostmourne"}
        count=count+1
    end
    applied=true
    ns.T7MappedPages=count
    if ns.ApplyNaxxBossDrops then ns.ApplyNaxxBossDrops() end
end
local events=CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_LOGIN")
events:SetScript("OnEvent",function(self,event,name)
    if event=="PLAYER_LOGIN" or name=="AtlasLoot_WrathoftheLichKing" then
        ns.InstallNaxxSelector()
        ns.ApplyT7Mapping()
        if applied then self:UnregisterEvent("ADDON_LOADED"); self:UnregisterEvent("PLAYER_LOGIN") end
    end
end)
