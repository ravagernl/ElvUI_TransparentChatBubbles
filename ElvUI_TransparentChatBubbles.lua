--	=======================================================================================
--	Add-On Name: ElvUI Transparent Chat Bubbles
--	License: MIT
--	Author: Affli
--	Description: Allows the user to give all bubbles a transparency.
--	=======================================================================================

if not ElvUI then return end
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local M = E:GetModule('Misc')

-- default setting
P["chatbubbles"] = {
  ["alpha"] = 0.3 
}

hooksecurefunc(M, 'SkinBubble', function(self,p)
	p.backdrop:SetTexture(.054,.054,.054,E.db.chatbubbles.alpha)
	p.backdrop2:SetTexture(.054,.054,.054,E.db.chatbubbles.alpha)
end)

local function TransBubbles(...)
	for index = 1, select('#', ...) do
		local frame = select(index, ...)

		if frame.isBubblePowered then
			frame.backdrop:SetTexture(.054,.054,.054,E.db.chatbubbles.alpha)
			frame.backdrop2:SetTexture(.054,.054,.054,E.db.chatbubbles.alpha)
		end
	end
end


E.Options.args.general.args["chatbubbles"] = {
	order = 9000,
	type = "group",
	name = "Chat Bubbles",
	guiInline = true,
	args = {
		bubbleAlpha = {
			order = 9000,
			name = "Chat Bubbles Transparency",
			desc = "Changes the transparency of all chat bubbles",
			type = 'range',
			isPercent = true,
			min = 0, max = 1, step = 0.01,
			set = function(info, value)
				E.db.chatbubbles.alpha = value
				TransBubbles(WorldFrame:GetChildren())	
			end,
			get = function(info)
				return E.db.chatbubbles.alpha
			end,
		},
	},
}