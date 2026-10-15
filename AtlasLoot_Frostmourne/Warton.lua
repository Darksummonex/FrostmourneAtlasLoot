local _, ns = ...
local wartornSeed={[437835]={["category"]="Trinkets",["icon"]="INV_Misc_Bell_01",["name"]="Je'Tze's Bell",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 15 Mark of Savagery"},[437872]={["category"]="Trinkets",["icon"]="INV_Misc_ArmorKit_21",["name"]="Lavanthor's Talisman",["quality"]=3,["vendorText"]="Amal'thazad: 1650 Honor + 15 Mark of Savagery"},[439229]={["category"]="Trinkets",["icon"]="INV_Trinket_Naxxramas04",["name"]="Embrace of the Spider",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[439276]={["category"]="Shields",["icon"]="INV_Shield_26",["name"]="The Skull of Ruin",["quality"]=4,["vendorText"]="Amal'thazad: 950 Conquest"},[439298]={["category"]="Armor - Waist",["icon"]="INV_Belt_12",["name"]="Waistguard of the Tutor",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest"},[439389]={["category"]="Rings",["icon"]="INV_Jewelry_Ring_52Naxxramas",["name"]="Signet of the Malevolent",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest"},[439401]={["category"]="Rings",["icon"]="INV_Jewelry_Ring_51Naxxramas",["name"]="Circle of Death",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest"},[439470]={["category"]="Necklaces",["icon"]="INV_Jewelry_Necklace_28Naxxramas",["name"]="Medallion of the Disgraced",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest"},[439701]={["category"]="Armor - Feet",["icon"]="INV_Boots_Cloth_05",["name"]="Dawnwalkers",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 5 Mark of Savagery"},[439714]={["category"]="Weapons",["icon"]="INV_Weapon_Shortblade_58",["name"]="Webbed Death",["quality"]=4,["vendorText"]="Amal'thazad: 2450 Conquest + 10 Mark of Savagery"},[439716]={["category"]="Shields",["icon"]="INV_Shield_55",["name"]="Shield of Assimilation",["quality"]=4,["vendorText"]="Amal'thazad: 950 Conquest + 5 Mark of Savagery"},[439717]={["category"]="Armor - Feet",["icon"]="INV_Boots_Plate_06",["name"]="Inexorable Sabatons",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 5 Mark of Savagery"},[439728]={["category"]="Relics",["icon"]="Spell_Nature_SlowingTotem",["name"]="Totem of Misery",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 5 Mark of Savagery"},[439731]={["category"]="Armor - Wrists",["icon"]="INV_Bracer_13",["name"]="Punctilious Bindings",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[439757]={["category"]="Relics",["icon"]="INV_QirajIdol_Strife",["name"]="Idol of Worship",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 5 Mark of Savagery"},[439762]={["category"]="Armor - Waist",["icon"]="INV_Belt_22",["name"]="Torn Web Wrapping",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 5 Mark of Savagery"},[439763]={["category"]="Weapons",["icon"]="INV_Weapon_Hand_09",["name"]="Wraith Strike",["quality"]=4,["vendorText"]="Amal'thazad: 2450 Conquest + 10 Mark of Savagery"},[439764]={["category"]="Armor - Wrists",["icon"]="INV_Bracer_14",["name"]="Bindings of the Hapless Prey",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[439765]={["category"]="Armor - Wrists",["icon"]="INV_Bracer_07",["name"]="Sinner's Bindings",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[439766]={["category"]="Held in off-hand",["icon"]="INV_Offhand_Naxxramas_D_01",["name"]="Matriarch's Spawn",["quality"]=4,["vendorText"]="Amal'thazad: 950 Conquest + 5 Mark of Savagery"},[440065]={["category"]="Necklaces",["icon"]="INV_Jewelry_Necklace_29Naxxramas",["name"]="Fool's Trial",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440074]={["category"]="Rings",["icon"]="INV_Jewelry_Ring_53Naxxramas",["name"]="Strong-Handed Ring",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440075]={["category"]="Rings",["icon"]="INV_Jewelry_Ring_48Naxxramas",["name"]="Ruthlessness",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440080]={["category"]="Rings",["icon"]="INV_Jewelry_Ring_51Naxxramas",["name"]="Lost Jewel",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440187]={["category"]="Armor - Feet",["icon"]="INV_Boots_Plate_03",["name"]="Poignant Sabatons",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 5 Mark of Savagery"},[440189]={["category"]="Weapons",["icon"]="INV_Mace_73",["name"]="Angry Dread",["quality"]=4,["vendorText"]="Amal'thazad: 2450 Conquest + 10 Mark of Savagery"},[440190]={["category"]="Ranged weapons",["icon"]="INV_ThrowingKnife_08",["name"]="Spinning Fate",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 10 Mark of Savagery"},[440191]={["category"]="Relics",["icon"]="INV_Relics_LibramofHope",["name"]="Libram of Radiance",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 5 Mark of Savagery"},[440207]={["category"]="Relics",["icon"]="INV_Shield_56",["name"]="Sigil of Awareness",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 5 Mark of Savagery"},[440255]={["category"]="Trinkets",["icon"]="INV_Trinket_Naxxramas03",["name"]="Dying Curse",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[440256]={["category"]="Trinkets",["icon"]="INV_Trinket_Naxxramas04",["name"]="Grim Toll",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[440260]={["category"]="Armor - Waist",["icon"]="INV_Belt_15",["name"]="Belt of the Tortured",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 5 Mark of Savagery"},[440267]={["category"]="Relics",["icon"]="Spell_Nature_DiseaseCleansingTotem",["name"]="Totem of Hex",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 5 Mark of Savagery"},[440268]={["category"]="Relics",["icon"]="INV_Relics_LibramofTruth",["name"]="Libram of Tolerance",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 5 Mark of Savagery"},[440278]={["category"]="Armor - Waist",["icon"]="INV_Belt_34",["name"]="Girdle of Chivalry",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 5 Mark of Savagery"},[440282]={["category"]="Armor - Wrists",["icon"]="INV_Bracer_02",["name"]="Slime Stream Bands",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440301]={["category"]="Armor - Waist",["icon"]="INV_Belt_10",["name"]="Cincture of Polarity",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 5 Mark of Savagery"},[440318]={["category"]="Armor - Legs",["icon"]="INV_Pants_Plate_21",["name"]="Legplates of Double Strikes",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 5 Mark of Savagery"},[440321]={["category"]="Relics",["icon"]="INV_Relics_IdolofRejuvenation",["name"]="Idol of the Shooting Star",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 5 Mark of Savagery"},[440322]={["category"]="Relics",["icon"]="Spell_Nature_GroundingTotem",["name"]="Totem of Dueling",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 5 Mark of Savagery"},[440324]={["category"]="Armor - Wrists",["icon"]="INV_Bracer_12",["name"]="Bands of Mutual Respect",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440330]={["category"]="Armor - Wrists",["icon"]="INV_Bracer_15",["name"]="Bracers of Unrelenting Attack",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440331]={["category"]="Armor - Legs",["icon"]="INV_Pants_Mail_06",["name"]="Leggings of Failed Escape",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 5 Mark of Savagery"},[440337]={["category"]="Relics",["icon"]="INV_Relics_LibramofHope",["name"]="Libram of Resurgence",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 5 Mark of Savagery"},[440342]={["category"]="Relics",["icon"]="INV_Misc_TheGoldenCheep",["name"]="Idol of Awakening",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest + 5 Mark of Savagery"},[440345]={["category"]="Weapons",["icon"]="INV_Sword_115",["name"]="Broken Promise",["quality"]=4,["vendorText"]="Amal'thazad: 2450 Conquest + 10 Mark of Savagery"},[440371]={["category"]="Trinkets",["icon"]="INV_Trinket_Naxxramas03",["name"]="Bandit's Insignia",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[440373]={["category"]="Trinkets",["icon"]="INV_Trinket_Naxxramas06",["name"]="Extract of Necromantic Power",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[440375]={["category"]="Rings",["icon"]="INV_Jewelry_Ring_50Naxxramas",["name"]="Ring of Decaying Beauty",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440382]={["category"]="Trinkets",["icon"]="INV_Trinket_Naxxramas03",["name"]="Soul of the Dead",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 15 Mark of Savagery"},[440383]={["category"]="Weapons",["icon"]="INV_Weapon_Hand_20",["name"]="Calamity's Grasp",["quality"]=4,["vendorText"]="Amal'thazad: 3400 Conquest + 20 Mark of Savagery"},[440384]={["category"]="Weapons",["icon"]="INV_Axe_99",["name"]="Betrayer of Humanity",["quality"]=4,["vendorText"]="Amal'thazad: 4500 Conquest + 35 Mark of Savagery"},[440385]={["category"]="Ranged weapons",["icon"]="INV_Weapon_Rifle_24",["name"]="Envoy of Mortality",["quality"]=4,["vendorText"]="Amal'thazad: 4400 Conquest + 35 Mark of Savagery"},[440386]={["category"]="Weapons",["icon"]="INV_Weapon_Shortblade_92",["name"]="Sinister Revenge",["quality"]=4,["vendorText"]="Amal'thazad: 3400 Conquest + 20 Mark of Savagery"},[440388]={["category"]="Weapons",["icon"]="INV_Staff_89",["name"]="Journey's End",["quality"]=4,["vendorText"]="Amal'thazad: 4500 Conquest + 35 Mark of Savagery"},[440395]={["category"]="Weapons",["icon"]="INV_Mace_82",["name"]="Torch of Holy Fire",["quality"]=4,["vendorText"]="Amal'thazad: 3400 Conquest + 20 Mark of Savagery"},[440396]={["category"]="Weapons",["icon"]="INV_Sword_130",["name"]="The Turning Tide",["quality"]=4,["vendorText"]="Amal'thazad: 3400 Conquest + 20 Mark of Savagery"},[440398]={["category"]="Armor - Legs",["icon"]="INV_Pants_Cloth_26",["name"]="Leggings of Mortal Arrogance",["quality"]=4,["vendorText"]="Amal'thazad: 2450 Conquest + 15 Mark of Savagery"},[440399]={["category"]="Rings",["icon"]="INV_Jewelry_Ring_51Naxxramas",["name"]="Signet of Manifested Pain",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[440400]={["category"]="Shields",["icon"]="INV_Shield_32",["name"]="Wall of Terror",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 15 Mark of Savagery"},[440401]={["category"]="Shields",["icon"]="INV_Shield_63",["name"]="Voice of Reason",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 15 Mark of Savagery"},[440402]={["category"]="Weapons",["icon"]="INV_Axe_61",["name"]="Last Laugh",["quality"]=4,["vendorText"]="Amal'thazad: 3400 Conquest + 20 Mark of Savagery"},[440403]={["category"]="Cloaks",["icon"]="INV_Misc_Cape_Naxxramas_03",["name"]="Drape of the Deadly Foe",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[440410]={["category"]="Cloaks",["icon"]="INV_Misc_Cape_Naxxramas_01",["name"]="Shadow of the Ghoul",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440432]={["category"]="Trinkets",["icon"]="INV_Offhand_Hyjal_D_01",["name"]="Illustration of the Dragon Soul",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[440433]={["category"]="Rings",["icon"]="INV_Jewelry_Ring_67",["name"]="Wyrmrest Band",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440474]={["category"]="Rings",["icon"]="INV_JEWELRY_RING_78",["name"]="Surge Needle Ring",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[440491]={["category"]="Weapons",["icon"]="INV_Sword_122",["name"]="Hailstorm",["quality"]=4,["vendorText"]="Amal'thazad: 2450 Conquest + 10 Mark of Savagery"},[440532]={["category"]="Trinkets",["icon"]="INV_DataCrystal09",["name"]="Living Ice Crystals",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 30 Mark of Savagery"},[440539]={["category"]="Armor - Chest",["icon"]="INV_Chest_Leather_01",["name"]="Chestguard of the Recluse",["quality"]=4,["vendorText"]="Amal'thazad: 2450 Conquest + 15 Mark of Savagery"},[440541]={["category"]="Armor - Hands",["icon"]="INV_Gauntlets_22",["name"]="Frosted Adroit Handguards",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 15 Mark of Savagery"},[440549]={["category"]="Armor - Feet",["icon"]="INV_Boots_Leather_02",["name"]="Boots of the Renewed Flight",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 15 Mark of Savagery"},[440558]={["category"]="Armor - Feet",["icon"]="INV_Boots_Cloth_16",["name"]="Arcanic Tramplers",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 15 Mark of Savagery"},[440560]={["category"]="Armor - Legs",["icon"]="INV_Pants_Cloth_24",["name"]="Leggings of the Wanton Spellcaster",["quality"]=4,["vendorText"]="Amal'thazad: 2450 Conquest + 15 Mark of Savagery"},[440561]={["category"]="Armor - Waist",["icon"]="INV_Belt_10",["name"]="Leash of Heedless Magic",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 15 Mark of Savagery"},[440591]={["category"]="Armor - Feet",["icon"]="INV_Boots_Plate_06",["name"]="Melancholy Sabatons",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 15 Mark of Savagery"},[440705]={["category"]="Relics",["icon"]="INV_Relics_LibramofGrace",["name"]="Libram of Renewal",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest"},[440706]={["category"]="Relics",["icon"]="INV_Relics_LibramofHope",["name"]="Libram of Reciprocation",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest"},[440707]={["category"]="Relics",["icon"]="INV_Relics_LibramofTruth",["name"]="Libram of Obstruction",["quality"]=4,["vendorText"]="Amal'thazad: 700 Conquest"},[440719]={["category"]="Rings",["icon"]="INV_Jewelry_Ring_68",["name"]="Band of Channeled Magic",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[443993]={["category"]="Rings",["icon"]="INV_Jewelry_Ring_66",["name"]="Greatring of Collision",["quality"]=4,["vendorText"]="Amal'thazad: 1250 Conquest + 5 Mark of Savagery"},[443994]={["category"]="Armor - Legs",["icon"]="INV_Pants_Plate_21",["name"]="Belabored Legplates",["quality"]=4,["vendorText"]="Amal'thazad: 2200 Conquest + 5 Mark of Savagery"},[444005]={["category"]="Cloaks",["icon"]="INV_Misc_Cape_Naxxramas_02",["name"]="Pennant Cloak",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[444006]={["category"]="Armor - Head",["icon"]="INV_HELMET_95",["name"]="Obsidian Greathelm",["quality"]=4,["vendorText"]="Amal'thazad: 2450 Conquest + 15 Mark of Savagery"},[444008]={["category"]="Armor - Wrists",["icon"]="INV_Bracer_17",["name"]="Unsullied Cuffs",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[444011]={["category"]="Armor - Legs",["icon"]="INV_PANTS_MAIL_25",["name"]="Leggings of the Honored",["quality"]=4,["vendorText"]="Amal'thazad: 2450 Conquest + 15 Mark of Savagery"},[444661]={["category"]="Necklaces",["icon"]="INV_Jewelry_Amulet_05",["name"]="Wyrmrest Necklace of Power",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[444662]={["category"]="Necklaces",["icon"]="INV_Jewelry_Talisman_09",["name"]="Life-Binder's Locket",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[444664]={["category"]="Necklaces",["icon"]="INV_Jewelry_Necklace_34",["name"]="Favor of the Dragon Queen",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[444665]={["category"]="Necklaces",["icon"]="INV_Jewelry_Necklace_02",["name"]="Nexus War Champion Beads",["quality"]=4,["vendorText"]="Amal'thazad: 1650 Conquest + 15 Mark of Savagery"},[469967]={["category"]="Trinkets",["icon"]="INV_Inscription_TarotGreatness",["name"]="Gladiator's Ferocity",["quality"]=4,["vendorText"]="Amal'thazad: 3400 Honor + 15 Mark of Savagery"},[469968]={["category"]="Trinkets",["icon"]="INV_Inscription_TarotGreatness",["name"]="Gladiator's Insight",["quality"]=4,["vendorText"]="Amal'thazad: 3400 Honor + 15 Mark of Savagery"},[469969]={["category"]="Trinkets",["icon"]="INV_Inscription_TarotGreatness",["name"]="Gladiator's Might",["quality"]=4,["vendorText"]="Amal'thazad: 3400 Honor + 15 Mark of Savagery"},[469970]={["category"]="Trinkets",["icon"]="INV_Inscription_TarotGreatness",["name"]="Gladiator's Grace",["quality"]=4,["vendorText"]="Amal'thazad: 3400 Honor + 15 Mark of Savagery"}}
local items
local keys={}
local dirty=false
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
    INVTYPE_RELIC="Relics",
    INVTYPE_BODY="Shirts", INVTYPE_TABARD="Tabards",
}
local categoryIcons={
 ["Other"]="INV_Misc_Bag_10",
 ["Armor - Chest"]="INV_Chest_Plate04",["Armor - Feet"]="INV_Boots_Plate_01",
 ["Armor - Hands"]="INV_Gauntlets_04",["Armor - Head"]="INV_Helmet_29",
 ["Armor - Legs"]="INV_Pants_04",["Armor - Shoulders"]="INV_Shoulder_05",
 ["Armor - Waist"]="INV_Belt_22",["Armor - Wrists"]="INV_Bracer_07",
 ["Cloaks"]="INV_Misc_Cape_11",["Held in off-hand"]="INV_Misc_Book_09",
 ["Necklaces"]="INV_Jewelry_Necklace_01",["Trinkets"]="INV_Trinket_Naxxramas04",
 ["Weapons"]="INV_Sword_27",["Ranged weapons"]="INV_Weapon_Bow_07",
 ["Relics"]="INV_Misc_Idol_03",["Rings"]="INV_Jewelry_Ring_04",
 ["Shields"]="INV_Shield_05",["Shirts"]="INV_Shirt_White_01",["Tabards"]="INV_Shirt_GuildTabard_01",
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
        root[1]={1,"","INV_Misc_QuestionMark","=ds=No Wartorn items identified yet","=ds=Hover an item to learn its Wartorn tag"}
    end
    for group,category in ipairs(names) do
        local ids=categories[category]; table.sort(ids)
        local prefix="FMWartonG"..group.."P"
        root[group]={group,prefix..1,categoryIcons[category] or items[ids[1]].icon or "INV_Misc_Coin_01","=q1="..category,"=ds=Level 80"}
        local pages=math.ceil(#ids/30)
        for page=1,pages do
            local rows={Back="FMWartonMenu1"}
            if page>1 then rows.Prev=prefix..(page-1) end
            if page<pages then rows.Next=prefix..(page+1) end
            for position=1,30 do
                local id=ids[(page-1)*30+position]
                if id then
                    local item=items[id]
                    if item.vendorText and ns.RenameTokens then item.vendorText=ns.RenameTokens(item.vendorText):gsub(" Arena"," Conquest") end
                    rows[#rows+1]={position,tostring(id),item.icon or "INV_Misc_QuestionMark",
                        "=q"..(item.quality or 1).."="..item.name,"=ds="..(item.vendorText and (item.vendorText:match("^.-:%s*(.+)$") or item.vendorText) or "Wartorn / PvP Reward")}
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
function ns.InitWarton()
    if items then return end
    if not AtlasLootFrostmourneDB then AtlasLootFrostmourneDB={realms={}} end
    local db=AtlasLootFrostmourneDB
    db.realms=db.realms or {}
    local realm=GetRealmName()
    db.realms[realm]=db.realms[realm] or {}
    items=db.realms[realm]
    if realm=="Frostmourne" then
        for id,seed in pairs(wartornSeed) do
            if not items[id] then
                local copy={}; for key,value in pairs(seed) do copy[key]=value end
                items[id]=copy
            end
        end
    end
    if items[440207] and items[440207].category=="Other" then items[440207].category="Relics" end
    local pvp=AtlasLoot_Data.PVPMENU
    if pvp then
        local used,exists={},false
        for _,row in ipairs(pvp) do used[row[1]]=true; if row[2]=="FMWartonMenu1" then exists=true end end
        if not exists then
            for position=1,30 do if not used[position] then
                pvp[#pvp+1]={position,"FMWartonMenu1","INV_Jewelry_TrinketPVP_01","=q1=Wartorn","=ds=Level 80"}
                break
            end end
        end
    end
    Rebuild()
    local function Observe(tip)
        if Learn(tip) then Rebuild() end
    end
    for _,tip in ipairs({GameTooltip,ItemRefTooltip,ShoppingTooltip1,ShoppingTooltip2}) do
        tip:HookScript("OnTooltipSetItem",Observe)
        tip:HookScript("OnShow",Observe)
    end
end

function ns.WartonCommand(message)
    if message:match("status%s*$") then
        DEFAULT_CHAT_FRAME:AddMessage("Wartorn: "..Rebuild().." confirmed items saved for this realm.")
    else Rebuild(); ns.Open("FMWartonMenu1") end
end

-- Sanitized, player-observed merchant snapshots; no account or character data.
local pvpVendorSeed={["31864"]={["items"]={{["category"]="Armor - Chest",["cost"]={["copper"]=0,["currencies"]={},["quantity"]=1,["stock"]=-1,["text"]="2200 Honor"},["icon"]="INV_CHEST_PLATE_23",["id"]=40782,["name"]="Hateful Gladiator's Scaled Chestpiece",["quality"]=4},{["category"]="Armor - Hands",["cost"]={["copper"]=0,["currencies"]={},["quantity"]=1,["stock"]=-1,["text"]="1650 Honor"},["icon"]="INV_GAUNTLETS_62",["id"]=40802,["name"]="Hateful Gladiator's Scaled Gauntlets",["quality"]=4},{["category"]="Armor - Head",["cost"]={["copper"]=0,["currencies"]={},["quantity"]=1,["stock"]=-1,["text"]="2200 Honor"},["icon"]="INV_Helmet_124",["id"]=40821,["name"]="Hateful Gladiator's Scaled Helm",["quality"]=4},{["category"]="Armor - Legs",["cost"]={["copper"]=0,["currencies"]={},["quantity"]=1,["stock"]=-1,["text"]="2200 Honor"},["icon"]="INV_PANTS_PLATE_27",["id"]=40842,["name"]="Hateful Gladiator's Scaled Legguards",["quality"]=4},{["category"]="Armor - Shoulders",["cost"]={["copper"]=0,["currencies"]={},["quantity"]=1,["stock"]=-1,["text"]="1650 Honor"},["icon"]="INV_SHOULDER_62",["id"]=40861,["name"]="Hateful Gladiator's Scaled Shoulders",["quality"]=4},{["category"]="Armor - Chest",["cost"]={["copper"]=0,["currencies"]={},["quantity"]=1,["stock"]=-1,["text"]="2200 Honor"},["icon"]="INV_CHEST_PLATE_23",["id"]=40904,["name"]="Hateful Gladiator's Ornamented Chestguard",["quality"]=4},{["category"]="Armor - Hands",["cost"]={["copper"]=0,["currencies"]={},["quantity"]=1,["stock"]=-1,["text"]="1650 Honor"},["icon"]="INV_GAUNTLETS_62",["id"]=40925,["name"]="Hateful Gladiator's Ornamented Gloves",["quality"]=4},{["category"]="Armor - Head",["cost"]={["copper"]=0,["currencies"]={},["quantity"]=1,["stock"]=-1,["text"]="2200 Honor"},["icon"]="INV_Helmet_124",["id"]=40931,["name"]="Hateful Gladiator's Ornamented Headcover",["quality"]=4},{["category"]="Armor - Legs",["cost"]={["copper"]=0,["currencies"]={},["quantity"]=1,["stock"]=-1,["text"]="2200 Honor"},["icon"]="INV_PANTS_PLATE_27",["id"]=40937,["name"]="Hateful Gladiator's Ornamented Legplates",["quality"]=4},{["category"]="Armor - Shoulders",["cost"]={["copper"]=0,["currencies"]={},["quantity"]=1,["stock"]=-1,["text"]="1650 Honor"},["icon"]="INV_SHOULDER_62",["id"]=40961,["name"]="Hateful Gladiator's Ornamented Spaulders",["quality"]=4}},["name"]="Xazi Smolderpipe",["npcID"]=31864,["zone"]="Dalaran"}}
local function PvpDB()
    AtlasLootFrostmourneDB=AtlasLootFrostmourneDB or {}
    local db=AtlasLootFrostmourneDB
    db.pvpVendors=db.pvpVendors or {}
    local realm=GetRealmName()
    db.pvpVendors[realm]=db.pvpVendors[realm] or {}
    if realm=="Frostmourne" then
        local function Copy(value)
            if type(value)~="table" then return value end
            local result={}; for key,entry in pairs(value) do result[key]=Copy(entry) end
            return result
        end
        for key,vendor in pairs(pvpVendorSeed) do
            if not db.pvpVendors[realm][key] then db.pvpVendors[realm][key]=Copy(vendor) end
        end
    end
    return db.pvpVendors[realm]
end
function ns.ApplyScannedPvpPrices()
    if not AtlasLoot_Data then return 0 end
    local observed={}
    for _,vendor in pairs(PvpDB()) do
        for _,item in ipairs(vendor.items or {}) do
            local previous=observed[item.id]
            if item.cost and item.cost.text and item.cost.text~="cost unavailable" and (not previous or (vendor.scannedAt or 0)>(previous.time or 0)) then
                observed[item.id]={item=item,time=vendor.scannedAt or 0}
            end
        end
    end
    local updated=0
    for key,rows in pairs(AtlasLoot_Data) do
        local pvp=type(key)=="string" and (key:lower():match("^pvp") or key:match("^Arena") or key:match("^Wrathful") or key:match("^FMUpdatedPvp") or key:match("^FMDeadly") or key:match("^FMHateful"))
        if pvp and type(rows)=="table" then
            for _,row in ipairs(rows) do
                local entry=observed[tonumber(row[2])]
                -- Unpriced raid-drop references and unrelated catalogues stay unpriced.
                if entry and type(row[6])=="string" and row[6]~="" then
                    local item=entry.item
                    local price=item.cost.text:gsub(" Arena"," Conquest"):gsub("(%d+)%s+Honor","%1 #faction#")
                    if ns.RenameTokens then price=ns.RenameTokens(price) end
                    if (item.cost.quantity or 1)>1 then price=price.." / "..item.cost.quantity.." items" end
                    row[6]=price;updated=updated+1
                end
            end
        end
    end
    return updated
end
function ns.RebuildPvpVendors()
    if not AtlasLoot_Data then return end
    -- Retain observed prices without creating a separate vendor browser.
    for key,rows in pairs(AtlasLoot_Data) do
        if type(rows)=="table" then
            for index=#rows,1,-1 do
                local target=rows[index][2]
                if type(target)=="string" and target:match("^FMPvpVendors") then table.remove(rows,index) end
            end
        end
    end
    local count=ns.ApplyScannedPvpPrices()
    local refresh=AtlasLootItemsFrame and AtlasLootItemsFrame.refresh
    if refresh and AtlasLootItemsFrame:IsShown() and AtlasLoot_ShowItemsFrame then
        AtlasLoot_ShowItemsFrame(refresh[1],refresh[2],"",refresh[4])
    end
    return count
end
