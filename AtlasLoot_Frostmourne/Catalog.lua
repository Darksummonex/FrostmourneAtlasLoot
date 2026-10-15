local _, ns = ...
local title = "Frostmourne Custom Items"
local registered, itemCount, pageCount = false, 0, 0
local lookup = {}
local function MenuKey(page) return "FMCatalogMenu" .. page end
local function PageKey(group, page) return "FMCatalogG" .. group .. "P" .. page end
local function Register()
    if registered then return true end
    if not AtlasLoot_Data or not AtlasLoot_TableNames or not AtlasLoot_DewDropDown then return false end
    local groups = ns.Groups
    local menuPages = math.max(1, math.ceil(#groups / 30))
    for menuPage = 1, menuPages do
        local key = MenuKey(menuPage)
        local rows = {}
        AtlasLoot_Data[key] = rows
        AtlasLoot_TableNames[key] = {title .. " - client candidates", "Menu"}
        if menuPage > 1 then rows.Prev = MenuKey(menuPage - 1) end
        if menuPage < menuPages then rows.Next = MenuKey(menuPage + 1) end
    end
    for groupIndex, group in ipairs(groups) do
        local menuPage = math.floor((groupIndex - 1) / 30) + 1
        local position = (groupIndex - 1) % 30 + 1
        local menu = AtlasLoot_Data[MenuKey(menuPage)]
        menu[position] = {position, PageKey(groupIndex, 1), "INV_Misc_QuestionMark",
            "=q1=" .. group.name .. " - " .. group.kind,
            "=ds=" .. #group.items .. " candidates; sources unverified"}
        local pages = math.ceil(#group.items / 30)
        for page = 1, pages do
            local key = PageKey(groupIndex, page)
            local rows = {Back = MenuKey(menuPage)}
            if page > 1 then rows.Prev = PageKey(groupIndex, page - 1) end
            if page < pages then rows.Next = PageKey(groupIndex, page + 1) end
            for offset = 1, 30 do
                local item = group.items[(page - 1) * 30 + offset]
                if item then
                    local id = item[1]
                    rows[#rows + 1] = {offset, tostring(id), item[2], "=ds=Item #" .. id,
                        "=ds=Source / obtainability unverified"}
                    lookup[id] = key
                    itemCount = itemCount + 1
                end
            end
            AtlasLoot_Data[key] = rows
            AtlasLoot_TableNames[key] = {title .. ": " .. group.name .. " - " .. group.kind .. " (" .. page .. "/" .. pages .. ")", "AtlasLootFrostmourne"}
            pageCount = pageCount + 1
        end
    end
    -- Candidate catalogue is hidden from the release menu; retain direct item lookups.
    registered = true
    if ns.InitWarton then ns.InitWarton() end
    if ns.RegisterReportedDrops then ns.RegisterReportedDrops() end
    -- Do not query thousands of item IDs. AtlasLoot resolves only displayed items.
    ns.Groups = nil
    return true
end
ns.Register = Register
ns.Lookup = lookup
ns.Counts = function() return itemCount, pageCount end
local function Open(key)
    if not Register() or not AtlasLootDefaultFrame or not AtlasLoot_DewDropClick then return end
    AtlasLootDefaultFrame:Show()
    AtlasLoot_DewDropClick(key, title, "Table")
end
ns.Open = Open
local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_LOGIN")
events:SetScript("OnEvent", function(self)
    if Register() then self:UnregisterEvent("PLAYER_LOGIN") end
end)
SLASH_FROSTMOURNECATALOG1 = "/fml"
SlashCmdList.FROSTMOURNECATALOG = function(message)
    if not Register() then
        DEFAULT_CHAT_FRAME:AddMessage(title .. ": AtlasLoot is not ready.")
        return
    end
    if message and ns.CurrencyCommand and (message:match("^%s*phase") or message:match("^%s*map%s") or message:match("^%s*currency") or message:match("^%s*gems")) then
        ns.CurrencyCommand(message)
        return
    end
    if message and message:match("^%s*logi%s*$") and AtlasLoot_Data.FMLogi1 then Open("FMLogi1"); return end
    if message and message:match("^%s*vendor%s*$") and ns.WartonCommand then
        ns.WartonCommand("warton vendor")
        return
    end
    if message and (message:match("^%s*wartorn") or message:match("^%s*warton")) and ns.WartonCommand then
        ns.WartonCommand(message)
        return
    end
    local id = tonumber((message or ""):match("^%s*(%d+)%s*$"))
    if id then
        if ns.ReportedLookup and ns.ReportedLookup[id] then Open(ns.ReportedLookup[id])
        elseif lookup[id] then Open(lookup[id])
        else DEFAULT_CHAT_FRAME:AddMessage(title .. ": item " .. id .. " is not in the client-difference catalogue.") end
    elseif message and message:match("^%s*status%s*$") then
        DEFAULT_CHAT_FRAME:AddMessage(string.format("%s: %d candidates / %d pages. Client presence does not confirm drops. /fml ITEMID opens an item page.", title, itemCount, pageCount))
    elseif AtlasLoot_Data.FMCustomLegendaries1 then Open("FMCustomLegendaries1")
    else DEFAULT_CHAT_FRAME:AddMessage("Use /fml ITEMID, /fml logi, /fml wartorn, or /fml currency.") end
end
