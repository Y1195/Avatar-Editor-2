local module = {}

module.Category = {}
module.Category.Featured = 0
module.Category.All = 1
module.Category.Collectibles = 2
module.Category.Clothing = 3
module.Category.BodyParts = 4
module.Category.Gear = 5
module.Category.Accessories = 11
module.Category.AvatarAnimations = 12
module.Category.CommunityCreations = 13


module.CreatorType = {}
module.CreatorType.User = 1
module.CreatorType.Group = 2


module.Genres = {}
module.Genres.TownAndCity = 1
module.Genres.Medieval = 2
module.Genres.SciFi = 3
module.Genres.Fighting = 4
module.Genres.Horror = 5
module.Genres.Naval = 6
module.Genres.Adventure = 7
module.Genres.Sports = 8
module.Genres.Comedy = 9
module.Genres.Western = 10
module.Genres.Military = 11
-- 12
module.Genres.Building = 13
module.Genres.FPS = 14
module.Genres.RPG = 15


module.SortAggregation = {}
module.SortAggregation.PastDay = 1
-- 2
module.SortAggregation.PastWeek = 3
module.SortAggregation.PastMonth = 4
module.SortAggregation.AllTime = 5


module.SortType = {}
module.SortType.Relevance = 0
module.SortType.Favorited = 1
module.SortType.Sales = 2
module.SortType.Updated = 3
module.SortType.PriceAsc = 4
module.SortType.PriceDesc = 5


module.Subcategory = {}
module.Subcategory.Featured = 0
module.Subcategory.All = 1
module.Subcategory.Collectibles = 2
module.Subcategory.Clothing = 3
module.Subcategory.BodyParts = 4
module.Subcategory.Gear = 5
-- 6-8
module.Subcategory.Hats = 9
module.Subcategory.Faces = 10
module.Subcategory.Shirts = 12
module.Subcategory.TShirts = 13
module.Subcategory.Pants = 14
module.Subcategory.Heads = 15
-- 16-18
module.Subcategory.Accessories = 19
module.Subcategory.HairAccessories = 20
module.Subcategory.FaceAccessories = 21
module.Subcategory.NeckAccessories = 22
module.Subcategory.ShoulderAccessories = 23
module.Subcategory.FrontAccessories = 24
module.Subcategory.BackAccessories = 25
module.Subcategory.WaistAccessories = 26
module.Subcategory.AvatarAnimations = 27
-- 28-36
module.Subcategory.Bundles = 37
module.Subcategory.AnimationBundles = 38
module.Subcategory.EmoteAnimations = 39
module.Subcategory.CommunityCreations = 40
module.Subcategory.Melee = 41
module.Subcategory.Ranged = 42
module.Subcategory.Explosive = 43
module.Subcategory.PowerUp = 44
module.Subcategory.Navigation = 45
module.Subcategory.Musical = 46
module.Subcategory.Social = 47
module.Subcategory.Building = 48
module.Subcategory.Transport = 49


module.AssetType = {}
module.AssetType.None = 0

module.AssetType["T-Shirt"] = 2
module.AssetType.Hat = 8
module.AssetType.Shirt = 11
module.AssetType.Pants = 12
module.AssetType.Head = 17
module.AssetType.Face = 18
module.AssetType.Gear = 19
module.AssetType.Arms = 25
module.AssetType.Legs = 26
module.AssetType.Torso = 27
module.AssetType.RightArm = 28
module.AssetType.LeftArm = 29
module.AssetType.LeftLeg = 30
module.AssetType.RightLeg = 31
module.AssetType.HairAccessory = 41
module.AssetType.FaceAccessory = 42
module.AssetType.NeckAccessory = 43
module.AssetType.ShoulderAccessory = 44
module.AssetType.FrontAccessory = 45
module.AssetType.BackAccessory = 46
module.AssetType.WaistAccessory = 47
module.AssetType.ClimbAnimation = 48
module.AssetType.DeathAnimation = 49
module.AssetType.FallAnimation = 50
module.AssetType.IdleAnimation = 51
module.AssetType.JumpAnimation = 52
module.AssetType.RunAnimation = 53
module.AssetType.SwimAnimation = 54
module.AssetType.WalkAnimation = 55
module.AssetType.PoseAnimation = 56
module.AssetType.EmoteAnimation = 61


function module.GetOptionName(section, value)
	for k, v in pairs(module[section]) do
		if v == value then
			return k
		end
	end
end


return module