# Changelog

## 0.6.1 - 2026-10-15

## Changes

- Remove all extension-provided query, inventory and merchant scanners, including hidden dungeon verification timers. Preserve saved observations and passive learning from player-opened tooltips.
- Credit the project maintainer as **Laraystiri**.
- Group PvP by expansion and use AtlasLoot-style weapon, accessory and armor categories inside Wrath.
- Update Savage/Hateful rewards, matching-ID observed prices, faction parity, and the swapped Hateful Paladin item labels.
- Include 94 confirmed Wartorn starter items with category icons, Level 80 labels and no NPC names in item descriptions.
- Fix mixed-price Conquest icons and Mark of Savagery's item ID/icon.
- Retain custom legendaries, Inscription additions, inline dungeon epic versions and all earlier reward corrections.

## Installation

Replace `Interface/AddOns/AtlasLoot_Frostmourne` with the folder from the ZIP, keep AtlasLoot Enhanced v5.11.04 and its data modules installed, then restart WoW. Saved settings and observations are preserved. This release contains the extension only.

## Validation

Lua 5.1 compilation and targeted checks cover scanner removal, retained observations, passive tooltip learning, PvP layouts, item prices, currency icons, custom legendaries and Inscription. In-game rendering still requires player verification.

## 0.6.0 — 2026-10-15

- Initial GitHub release of the Frostmourne AtlasLoot extension.
- Hide the broad candidate catalogue tab; retain item-ID lookups and open the custom legendary collection with `/fml`.
- Remove slot/all query scanning.
- Add inline dungeon epic counterparts, with difficulty columns and item-level verification.
- Add 25 previously unlisted custom legendary equipment entries, with item types and verified/passively learned class restrictions.
- Add custom Inscription recipes and glyph classification.
- Update Justice, Valor, Honor, Conquest, Badge of Justice and heirloom reward pricing, including faction parity.
- Apply the established slot-price rules to future PvE and PvP equipment vendors.
- Retain T7 difficulty mapping, reported custom drops, Logi rewards, Wartorn categories and per-realm vendor observations.

Validation includes Lua 5.1 compilation and targeted checks for catalogue hiding, reward prices, faction parity, custom legendary registration and Inscription navigation. UI behavior remains subject to in-game testing.
