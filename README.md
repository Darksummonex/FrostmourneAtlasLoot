# AtlasLoot Frostmourne

An AtlasLoot Enhanced extension for **WoW 3.3.5a / FrostmourneRebuffed**. Requires AtlasLoot Enhanced **v5.11.04**; this download contains the `AtlasLoot_Frostmourne` module, not the base addon.

## Installation

1. Install AtlasLoot Enhanced and its Crafting, Original WoW, Burning Crusade and Wrath modules.
2. Extract the release ZIP into `Interface/AddOns`. The result must be `Interface/AddOns/AtlasLoot_Frostmourne/AtlasLoot_Frostmourne.toc`.
3. Restart WoW and enable the module. Existing saved settings are preserved.

## Features

- Justice, Valor, Honor and Conquest reward pricing adapted to FrostmourneRebuffed.
- Future Conquest/Triumph/Frost emblem equipment uses Valor and the established equipment-slot price schedule. Later PvP season equipment uses Conquest. These future prices are extrapolated from the current slot schedule, not independently verified against future server vendors.
- Badge of Justice rewards use Justice, with the conversion observed in G'eras screenshots.
- Honor accessories, consumables and faction counterparts, plus heirloom and other vendor corrections.
- T7 raid difficulty mapping: Naxxramas, Sartharion and Malygos use the original 10-player loot for both Normal sizes and original 25-player loot for both Heroic sizes.
- Dungeon epic counterparts appear beneath their original difficulty columns. Long lists scroll within the boss view. Matches require the same item name and item level; boss sources are inferred from those matches, with no copied drop percentages.
- Collections includes **Frostmourne Custom Legendaries** and **Relics of Naxxramas - Logi**. Custom legendary entries show item types; class restrictions are verified from cache or learned when the player opens the item's tooltip.
- Custom Inscription glyphs appear under their class and Major/Minor categories. Mysterious Fortune Card is under Miscellaneous.
- Wartorn item categories and vendor observations are retained per realm.

The broad **Frostmourne Custom Items candidate tab is disabled**. The slot/all query scanner is removed. Direct item-ID lookups remain available.

## Commands

| Command | Action |
| --- | --- |
| `/fml` | Open Frostmourne Custom Legendaries |
| `/fml ITEMID` | Open a known custom item page |
| `/fml logi` | Open Logi's collection |
| `/fml wartorn` | Open Wartorn categories |
| `/fml wartorn status` | Show identified Wartorn item count |
| `/fml vendor` | Inspect the open Wartorn vendor |
| `/fml currency` | Show currency configuration |
| `/fml phase T8` | Create/select a currency profile; new profiles copy current rules |
| `/fml map conquest original` | Restore original Conquest emblem labels and costs |
| `/fml map conquest valor` | Map Conquest emblems to Valor |

`/fml scan` is not included. Wartorn's older tooltip/vendor observation workflow and on-demand verification of visible dungeon pages remain separate features.

## Data and limitations

The retained candidate index contains 12,031 added IDs and 65 changed entries derived from client item metadata. Presence in client data does not establish availability or a boss source. The release includes derived item IDs, names and icon references; it does not include client archives, item caches or character SavedVariables.

Prices are based on player-provided vendor observations and explicit slot-price rules. Unknown material costs are not extrapolated. Item tooltips and most names depend on the server/client cache. A missing response does not establish whether an item is obtainable. Test server updates may require corrections.

## Credits

AtlasLoot Enhanced and its original data belong to their respective authors. This repository contains the Frostmourne extension maintained by Alex / Codex; the base addon is a separate dependency.
