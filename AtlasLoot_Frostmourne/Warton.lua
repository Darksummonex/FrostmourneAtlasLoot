local _, ns = ...
local items, driver, scanner
local pending, scanQueue, keys = {}, {}, {}
local dirty, elapsed = false, 0
local merchantOpen, merchantGUID, merchantRun
local QueueMerchant
local slots = {
    INVTYPE_HEAD="Armor - Head", INVTYPE_SHOULDER="Armor - Shoulders",
    INVTYPE_CHEST="Armor - Chest", INVTYPE_ROBE="Armor - Chest",
    INVTYPE_WAIST="Armor - Waist", INVTYPE_LEGS="Armor - Legs", INVTYPE_FEET="Armor - Feet",
    INVTYPE_WRIST="Armor - Wrists", INVTYPE_HAND="Armor - Hands",
    INVTYPE_FINGER="Rings", INVTYPE_TRINKET="Trinkets", INVTYPE_NECK="Necklaces",
    INVTYPE_CLOAK="Cloaks", INVTYPE_SHIELD="Shields", INVTYPE_HOLDABLE="Held in off-hand",
    INVTYPE_WEAPON="Weapons", INVTYPE_2HWEAPON="Weapons", INVTYPE_WEAPONMAINHAND="Weapons",
    INVTYPE_WEAPONOFFHAND="Weapons", INVTYPE_RANGED="Ranged weapons",
    INVTYPE_RANGEDRIGHT="Ranged weapons", INVTYPE_THROWN="Ranged weapons",
    INVTYPE_BODY="Shirts", INVTYPE_TABARD="Tabards",
}
local function ID(link) return type(link)=="string" and tonumber(link:match("item:(%d+)")) end
local function Marked(tip)
    local name = tip:GetName()
    if not name then return false end
    for i=1,tip:NumLines() do
        for _,side in ipairs({"Left","Right"}) do
            local line = _G[name.."Text"..side..i]
            local text = line and line:GetText()
            if text then
                text = text:gsub("|c%x%x%x%x%x%x%x%x",""):gsub("|r",""):match("^%s*(.-)%s*$")
                if text:lower()=="warton" or text:lower()=="wartorn" then return true end
            end
        end
    end
    return false
end
ns.IsWartonTooltip = Marked
local function Learn(tip, fallback)
    local _, link = tip:GetItem()
    link=link or fallback
    local id = ID(link)
    if not id or not Marked(tip) then return end
    local name, _, quality, _, _, _, _, _, equip, icon = GetItemInfo(link)
    if not name then return end
    local category = slots[equip] or "Other"
    local previous = items[id]
    if previous and previous.name==name and previous.category==category and previous.quality==quality then return id end
    items[id] = {name=name, quality=quality, category=category,
        vendors=previous and previous.vendors,
        icon=type(icon)=="string" and (icon:match("[Ii]nterface\\[Ii]cons\\(.+)") or "INV_Misc_QuestionMark") or "INV_Misc_QuestionMark"}
    dirty = true
    return id
end
local function VendorCost(index)
    local _,_,price,quantity,stock,_,extended=GetMerchantItemInfo(index)
    local parts, costs = {}, {}
    if price and price>0 then parts[#parts+1]=string.format("%gg",price/10000) end
    if extended and GetMerchantItemCostInfo then
        local first,second,third=GetMerchantItemCostInfo(index)
        local count=first or 0
        if second~=nil or third~=nil then
            count=third or 0
            if first and first>0 then parts[#parts+1]=first.." Honor" end
            if second and second>0 then parts[#parts+1]=second.." Arena" end
        end
        for currency=1,count do
            local texture,amount,link,name=GetMerchantItemCostItem(index,currency)
            local currencyID=ID(link)
            name=(ns.CurrencyNames and ns.CurrencyNames[currencyID]) or name or (link and link:match("%[(.-)%]")) or "currency"
            parts[#parts+1]=tostring(amount or "?").." "..name
            costs[#costs+1]={id=currencyID,texture=texture,amount=amount,link=link,name=name}
        end
    end
    return {copper=price,quantity=quantity,stock=stock,currencies=costs,
        text=price==nil and "cost unavailable" or (#parts>0 and table.concat(parts," + ") or (extended and "cost unavailable" or "free"))}
end
local function SaveVendor(id,index)
    if not merchantOpen or UnitGUID("npc")~=merchantGUID then return end
    local item=items[id]
    if not item then return end
    local vendor=UnitName("npc") or "Vendor"
    local guid=merchantGUID
    local npcID=guid and (tonumber(guid:match("^Creature%-%d+%-%d+%-%d+%-%d+%-(%d+)")) or (guid:match("^0x") and tonumber(guid:sub(7,12),16)))
    local key=tostring(npcID or guid or vendor)
    local cost=VendorCost(index)
    item.vendors=item.vendors or {}
    item.vendors[key]={name=vendor,npcID=npcID,guid=guid,zone=GetRealZoneText and GetRealZoneText(),cost=cost}
    item.vendorText=vendor..": "..cost.text..((cost.quantity or 1)>1 and (" / "..cost.quantity.." items") or "")
    dirty=true
end
local function Put(key, rows, title, menu)
    AtlasLoot_Data[key] = rows
    AtlasLoot_TableNames[key] = {title, menu and "Menu" or "AtlasLootFrostmourne"}
    keys[#keys+1] = key
end
local function Rebuild()
    for _,key in ipairs(keys) do AtlasLoot_Data[key]=nil; AtlasLoot_TableNames[key]=nil end
    keys = {}
    local categories, names, count = {}, {}, 0
    for id,item in pairs(items) do
        local category = item.category or "Other"
        if not categories[category] then categories[category]={}; names[#names+1]=category end
        categories[category][#categories[category]+1] = id; count=count+1
    end
    table.sort(names)
    local root = {Back="PVPMENU"}
    Put("FMWartonMenu1",root,"PvP Rewards - Wartorn",true)
    if #names==0 then
        root[1]={1,"","INV_Misc_QuestionMark","=ds=No Wartorn items identified yet","=ds=Hover items or use /fml wartorn scan"}
    end
    for group,category in ipairs(names) do
        local ids=categories[category]; table.sort(ids)
        local prefix="FMWartonG"..group.."P"
        root[group]={group,prefix..1,"INV_Misc_QuestionMark","=q1="..category,"=ds="..#ids.." Wartorn items"}
        local pages=math.ceil(#ids/30)
        for page=1,pages do
            local rows={Back="FMWartonMenu1"}
            if page>1 then rows.Prev=prefix..(page-1) end
            if page<pages then rows.Next=prefix..(page+1) end
            for position=1,30 do
                local id=ids[(page-1)*30+position]
                if id then
                    local item=items[id]
                    if item.vendorText and ns.RenameTokens then item.vendorText=ns.RenameTokens(item.vendorText) end
                    rows[#rows+1]={position,tostring(id),item.icon or "INV_Misc_QuestionMark",
                        "=q"..(item.quality or 1).."="..item.name,"=ds="..(item.vendorText or "Wartorn / PvP Reward")}
                end
            end
            Put(prefix..page,rows,"Wartorn - "..category.." ("..page.."/"..pages..")")
        end
    end
    dirty=false
    local refresh=AtlasLootItemsFrame and AtlasLootItemsFrame.refresh
    if refresh and type(refresh[1])=="string" and refresh[1]:match("^FMWarton") and AtlasLootItemsFrame:IsShown() and AtlasLoot_ShowItemsFrame then
        AtlasLoot_ShowItemsFrame(AtlasLoot_Data[refresh[1]] and refresh[1] or "FMWartonMenu1",refresh[2],"",refresh[4])
    end
    return count
end
ns.RebuildWarton = Rebuild
local function Update(self, dt)
    for tip in pairs(pending) do
        pending[tip]=nil
        local id=Learn(tip)
        if id and merchantOpen then
            for index=1,GetMerchantNumItems() do if ID(GetMerchantItemLink(index))==id then SaveVendor(id,index); break end end
        end
    end
    elapsed=elapsed+dt
    if #scanQueue>0 and elapsed>=.1 then
        elapsed=0
        local link=table.remove(scanQueue)
        scanner:ClearLines(); scanner:SetOwner(UIParent,"ANCHOR_NONE")
        if type(link)=="table" then
            if merchantOpen and UnitGUID("npc")==link.guid then
                scanner:SetMerchantItem(link.index)
                local id=Learn(scanner,GetMerchantItemLink(link.index))
                if id then SaveVendor(id,link.index); merchantRun.matched=merchantRun.matched+1 end
                merchantRun.checked=merchantRun.checked+1
            end
        else scanner:SetHyperlink(link); Learn(scanner) end
        scanner:Hide()
    end
    if dirty then Rebuild() end
    if not next(pending) and #scanQueue==0 then
        self:SetScript("OnUpdate",nil)
        if merchantRun then
            DEFAULT_CHAT_FRAME:AddMessage("Wartorn vendor scan: "..merchantRun.checked.." checked, "..merchantRun.matched.." Wartorn-tagged items saved. If none matched, hover a vendor item to capture its visible tag.")
            merchantRun=nil
        end
    end
end
QueueMerchant=function()
    if not merchantOpen then DEFAULT_CHAT_FRAME:AddMessage("Open the vendor shop first."); return end
    scanQueue={}; merchantGUID=UnitGUID("npc")
    merchantRun={checked=0,matched=0}
    for index=GetMerchantNumItems(),1,-1 do scanQueue[#scanQueue+1]={index=index,guid=merchantGUID} end
    driver:SetScript("OnUpdate",Update)
end
local function InventoryScan()
    scanQueue={}
    local seen={}
    local function Add(link)
        local id=ID(link)
        if id and not seen[id] then seen[id]=true; scanQueue[#scanQueue+1]=link end
    end
    for slot=1,19 do Add(GetInventoryItemLink("player",slot)) end
    for bag=0,4 do for slot=1,GetContainerNumSlots(bag) do Add(GetContainerItemLink(bag,slot)) end end
    driver:SetScript("OnUpdate",Update)
    DEFAULT_CHAT_FRAME:AddMessage("Wartorn: checking "..#scanQueue.." equipped/bag items. Hover items to identify their Warton marker directly.")
end
function ns.InitWarton()
    if items then return end
    if not AtlasLootFrostmourneDB then AtlasLootFrostmourneDB={realms={}} end
    local db=AtlasLootFrostmourneDB
    db.realms=db.realms or {}
    local realm=GetRealmName()
    db.realms[realm]=db.realms[realm] or {}
    items=db.realms[realm]
    local pvp=AtlasLoot_Data.PVPMENU
    if pvp then
        local used,exists={},false
        for _,row in ipairs(pvp) do used[row[1]]=true; if row[2]=="FMWartonMenu1" then exists=true end end
        if not exists then
            for position=1,30 do if not used[position] then
                pvp[#pvp+1]={position,"FMWartonMenu1","INV_Jewelry_TrinketPVP_01","=q1=Wartorn","=ds=PvP Rewards - equipment categories"}
                break
            end end
        end
    end
    Rebuild()
    driver=CreateFrame("Frame")
    driver:RegisterEvent("MERCHANT_SHOW"); driver:RegisterEvent("MERCHANT_UPDATE"); driver:RegisterEvent("MERCHANT_CLOSED")
    driver:SetScript("OnEvent",function(_,event)
        if event=="MERCHANT_CLOSED" then merchantOpen=false; scanQueue={}; merchantRun=nil
        elseif event=="MERCHANT_SHOW" then merchantOpen=true; QueueMerchant()
        elseif merchantOpen and not merchantRun then QueueMerchant() end
    end)
    scanner=CreateFrame("GameTooltip","FMWartonScanTooltip",UIParent,"GameTooltipTemplate")
    scanner:SetOwner(UIParent,"ANCHOR_NONE"); scanner:Hide()
    for _,tip in ipairs({GameTooltip,ItemRefTooltip,ShoppingTooltip1,ShoppingTooltip2}) do
        tip:HookScript("OnTooltipSetItem",function(t) pending[t]=true; driver:SetScript("OnUpdate",Update) end)
        tip:HookScript("OnShow",function(t) pending[t]=true; driver:SetScript("OnUpdate",Update) end)
        tip:HookScript("OnTooltipCleared",function(t) pending[t]=nil end)
    end
end
function ns.WartonCommand(message)
    if message:match("vendor%s*$") or (message:match("scan%s*$") and merchantOpen) then QueueMerchant()
    elseif message:match("scan%s*$") then InventoryScan()
    elseif message:match("status%s*$") then
        DEFAULT_CHAT_FRAME:AddMessage("Wartorn: "..Rebuild().." tooltip-confirmed items saved for this realm.")
    else Rebuild(); ns.Open("FMWartonMenu1") end
end
