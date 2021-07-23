local module = {}

module.HOVER_INPUTS = {
	[Enum.UserInputType.MouseMovement] = true,
	[Enum.UserInputType.Touch] = true,
}

module.PAGE_SIZE = 20
module.CACHE_SIZE = 25

module.PRODUCT_INFO_CACHE_SIZE = 500

module.MAX_ACCESSORIES = 10
module.MAX_COSTUME = 50

module.SEARCH_DELAY = 0.5

module.DEFAULT_THEME = "Default"

module.FILTER_USERS = false
module.ALLOWED_USERS = {
	Groups = {
		{
			GroupId = 1200769,
		},
		--{
		--	GroupId = 0,
		--	Rank = 0,
		--},
	},
	Players = {
		1,
		22507135,
	},
	GamePasses = {
		{
			GamePassId = 948137,
		},
		--{
		--	GamePassId = 0,
		--},
	}
}

return module