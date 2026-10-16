# AtlasLoot Frostmourne

AtlasLoot Enhanced extension for **WoW 3.3.5a / FrostmourneRebuffed**, maintained by **Laraystiri**. Requires AtlasLoot Enhanced **v5.11.04**. The base addon is a separate dependency.

## Install or update

Extract the release ZIP into `Interface/AddOns`, replacing the existing `AtlasLoot_Frostmourne` folder. Keep AtlasLoot and its Crafting, Original WoW, Burning Crusade and Wrath modules installed. Restart WoW after updating. Saved settings and previously observed item data are preserved.

## Features

- PvP Rewards grouped into Classic, Burning Crusade and Wrath. Within Wrath, seasonal weapons share the PvP Weapons category; accessories and material-specific armor follow AtlasLoot's original organization.
- Corrected Justice, Valor, Honor and Conquest prices, faction counterparts, heirlooms, and Badge of Justice rewards. Mixed costs show Conquest and Mark of Savagery icons.
- Future PvE/PvP equipment uses the established equipment-slot price schedule. These future prices are extrapolated, not independently verified against future server vendors. Unconfirmed material quantities are not extrapolated.
- Saved vendor observations update matching existing PvP purchase entries by item ID. There is no separate scanned-vendor category, and unmatched observations remain saved without duplicate listings.
- 94 confirmed Wartorn starter items with category icons and Level 80 subtitles. Item descriptions show costs without NPC names.
- Dungeon epic counterparts appear below their original difficulty columns, with scrolling for long lists. Matches require the same name and item level; boss sources are inferred from those matches and do not inherit drop percentages. Verification uses already available item data without hidden queries.
- Collections includes 25 previously unlisted custom legendary equipment items and Relics of Naxxramas - Logi. Legendary rows include item types and verified/passively learned class restrictions.
- Custom Inscription glyphs are placed under their class and Major/Minor categories. Mysterious Fortune Card is in Miscellaneous.
- T7 difficulty mapping: Naxxramas, Sartharion and Malygos use original 10-player loot for both Normal sizes and original 25-player loot for both Heroic sizes.

The broad custom-item candidate tab is hidden. **Automatic item-query, inventory and merchant scanners are removed.** Wartorn tags and legendary class restrictions can still be learned from tooltips the player opens. AtlasLoot's Query Server button also queries extension dungeon rows when clicked; it stops when you leave the page.

## Commands

| Command | Action |
| --- | --- |
| `/fml` | Open Frostmourne Custom Legendaries |
| `/fml ITEMID` | Open a known custom item page |
| `/fml logi` | Open Logi's collection |
| `/fml wartorn` | Open Wartorn categories |
| `/fml wartorn status` | Show saved Wartorn item count |
| `/fml currency` | Show currency configuration |
| `/fml phase T8` | Create/select a currency profile; new profiles copy current rules |
| `/fml map conquest original` | Restore original Conquest emblem labels and costs |
| `/fml map conquest valor` | Map Conquest emblems to Valor |

Scan and vendor-scan commands are retired. Existing saved vendor observations remain usable as price data.

## Data and limitations

The retained candidate index contains 12,031 added IDs and 65 changed entries derived from client metadata. Presence in client data does not establish availability or a boss source. The release includes derived item IDs, names and icon references, not client archives, item caches, account data or character SavedVariables.

Prices come from player-provided observations and explicit slot-price rules. Server updates may require corrections. Item names, tooltips and unverified class restrictions depend on available client data. A missing response does not establish whether an item is obtainable.

## Credits

Frostmourne extension maintained by **Laraystiri**, with Codex assistance. AtlasLoot Enhanced and its original data belong to their respective authors.
