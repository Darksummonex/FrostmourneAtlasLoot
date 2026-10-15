local _, ns = ...
local sources = {badges="Badge of Justice",heroism="Emblem of Heroism",valor="Emblem of Valor",conquest="Emblem of Conquest",triumph="Emblem of Triumph",frost="Emblem of Frost"}
ns.CurrencyGeneration = 1
local function Config()
    if not AtlasLootFrostmourneDB then AtlasLootFrostmourneDB={realms={}} end
    local db=AtlasLootFrostmourneDB
    if not db.currency then
        db.currency={phase="T7",ids={justice=40752,valor=40753},phases={T7={heroism="justice",valor="valor"}}}
    end
    local cfg=db.currency
    -- User-requested default for future PvE phases; later manual edits remain reversible.
    if cfg.futureVendorVersion~=1 then
        for _,phase in pairs(cfg.phases) do
            phase.conquest="valor"; phase.triumph="valor"; phase.frost="valor"
        end
        cfg.futureVendorVersion=1
    end
    -- Backfill existing phase profiles; explicit original/Valor choices remain intact.
    for _,phase in pairs(cfg.phases) do if phase.badges==nil then phase.badges="justice" end end
    if not ns.CurrencyNames or ns.CurrencyNames[cfg.ids.justice]~="Justice" or ns.CurrencyNames[cfg.ids.valor]~="Valor" then
        ns.CurrencyNames={[cfg.ids.justice]="Justice",[cfg.ids.valor]="Valor"}
    end
    return cfg
end
ns.CurrencyConfig=Config
function ns.RareGemsEnabled()
    local cfg=Config()
    return cfg.phases[cfg.phase].gems~="epic"
end
function ns.ResolveCurrencyText(text)
    if type(text)~="string" then return text end
    local cfg=Config()
    local map=cfg.phases[cfg.phase]
    for source,original in pairs(sources) do
        local dest=map[source]
        if dest=="justice" or dest=="valor" then
            local label=dest=="justice" and "Justice" or "Valor"
            text=text:gsub(original,label):gsub("#eof"..source.."#",label)
            if source=="badges" then text=text:gsub("#heroic#",label) end
        end
    end
    return text
end
function ns.CurrencyIcon(currency)
    if currency=="conquest" then
        local region=_G.PVPFrameArenaPointsIcon
        local icon=region and region.GetTexture and region:GetTexture()
        if type(icon)~="string" or icon=="" then icon="Interface\\PVPFrame\\PVP-ArenaPoints-Icon" end
        return "|T"..icon..":14|t"
    end
    local cfg=Config()
    local icon=GetItemIcon and GetItemIcon(cfg.ids[currency])
    if type(icon)~="string" or icon=="" then icon="Interface\\Icons\\INV_Misc_QuestionMark" end
    return "|T"..icon..":14|t"
end
local installed=false
function ns.InstallCurrencyIcons()
    if installed or type(AtlasLoot_FixText)~="function" then return end
    local original=AtlasLoot_FixText
    AtlasLoot_FixText=function(text)
        local fixed=original(ns.ResolveCurrencyText(text))
        if type(fixed)~="string" then return fixed end
        fixed=fixed:gsub("#fmitem(%d+)#",function(id)
            local icon=GetItemIcon and GetItemIcon(tonumber(id))
            if type(icon)~="string" or icon=="" then icon="Interface\\Icons\\INV_Misc_QuestionMark" end
            return "|T"..icon..":14|t"
        end)
        -- Refresh icons rather than duplicating them when text is formatted twice.
        fixed=fixed:gsub("|T[^|]-|t%s*(Justice)","%1"):gsub("|T[^|]-|t%s*(Valor)","%1")
        fixed=fixed:gsub("%f[%a]Justice%f[%A]",function() return ns.CurrencyIcon("justice").." Justice" end)
        fixed=fixed:gsub("%f[%a]Valor%f[%A]",function() return ns.CurrencyIcon("valor").." Valor" end)
        -- Restrict this to a complete price so Emblem of Conquest and item names stay intact.
        if fixed:match("^%d+%s+Conquest$") then
            fixed=fixed:gsub("Conquest$",function() return ns.CurrencyIcon("conquest").." Conquest" end)
        end
        return fixed
    end
    installed=true
end
local function Refresh()
    ns.CurrencyGeneration=ns.CurrencyGeneration+1
    Config()
    if ns.ApplyTokenNames then ns.ApplyTokenNames() end
    if ns.RebuildWarton then ns.RebuildWarton() end
    local refresh=AtlasLootItemsFrame and AtlasLootItemsFrame.refresh
    if refresh and AtlasLootItemsFrame:IsShown() and AtlasLoot_ShowItemsFrame then
        AtlasLoot_ShowItemsFrame(refresh[1],refresh[2],"",refresh[4])
    end
end
function ns.CurrencyCommand(message)
    local cfg=Config()
    local phase=message:match("^%s*phase%s+([%w_-]+)%s*$")
    local source,dest=message:match("^%s*map%s+(%a+)%s+(%a+)%s*$")
    local currency,id=message:match("^%s*currency%s+(%a+)%s+(%d+)%s*$")
    local gems=message:match("^%s*gems%s+(%a+)%s*$")
    if phase and #phase<=20 then
        if not cfg.phases[phase] then
            cfg.phases[phase]={}
            for k,v in pairs(cfg.phases[cfg.phase]) do cfg.phases[phase][k]=v end
        end
        cfg.phase=phase; Refresh()
    elseif gems=="rare" or gems=="epic" then
        cfg.phases[cfg.phase].gems=gems; Refresh()
    elseif source and sources[source] and (dest=="justice" or dest=="valor" or dest=="original") then
        cfg.phases[cfg.phase][source]=dest; Refresh()
    elseif (currency=="justice" or currency=="valor") and tonumber(id)>0 then
        id=tonumber(id)
        local other=currency=="justice" and "valor" or "justice"
        if id==cfg.ids[other] then DEFAULT_CHAT_FRAME:AddMessage("Justice and Valor must use different item IDs."); return end
        cfg.ids[currency]=id; Refresh()
    else
        DEFAULT_CHAT_FRAME:AddMessage("Currency settings: /fml phase T7 | /fml map conquest valor | /fml map conquest original | /fml currency justice 40752 | /fml currency valor 40753. New phases copy the current rules; no later-phase conversions are assumed.")
    end
    DEFAULT_CHAT_FRAME:AddMessage("Active phase: "..cfg.phase..". Justice item "..cfg.ids.justice.."; Valor item "..cfg.ids.valor..".")
end
local events=CreateFrame("Frame")
events:RegisterEvent("PLAYER_LOGIN")
events:SetScript("OnEvent",function() Config(); ns.InstallCurrencyIcons() end)
