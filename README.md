# Avatar-Editor-2
An in game avatar editor.

## Links
Devforum: https://devforum.roblox.com/t/in-game-avatar-editor-v2/1347497

Roblox Model: https://www.roblox.com/library/7085707174/Avatar-Editor-2

Plugin: https://www.roblox.com/library/7141713563/Avatar-Editor-Plugin

Demo Place: https://www.roblox.com/games/7085560426/Avatar-Editor-2

Demo Vidio: https://www.youtube.com/watch?v=Df1_VpzXGYw

## API
### AvatarEditorServer

```
:CacheSettings(Player: player, dictionary: config)
:CacheOutfits(Player: player, array: outfits)
:ApplyDescriptionFromInfo(Character: character, dictionary: outfits)
:ToHumanoidDescription(dictionary: outfit)
:ToAppearanceInfo(Instance: HumanoidDescription)
:GetSettings(Player: player)
:GetOutfits(Player: player)

.HumanoidDescriptionChanged(Player: player, HumanoidDescription: description)
.CostumeAdded(Player: player, HumanoidDescription: description, dictionary: outfit, number: index)
.CostumeRemoved(Player: player, HumanoidDescription: HumanoidDescription, dictionary: outfit, number: index)
.SettingChanged(Player: player, string: setting, any: value)
.PermissionFailed(Player: player)
```

### AvatarEditorClient
```
:Load()
:Destroy()
:GetAlpha()
:OnRenderStep(number: delta)

.Started()
.Loaded()
.Destroyed()
.PermissionFailed()
```
