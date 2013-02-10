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

	local a = E.db.chatbubbles.alpha

	if p.backdrop then
		p.backdrop:SetTexture(.054,.054,.054,a)
	end
	p.backdrop2:SetTexture(.054,.054,.054,a)
	p.text:SetShadowColor(0, 0, 0, 1 - a)
	p.text:SetShadowOffset(0, 0)

	if a == 0 then
		p.text:FontTemplate(nil, 14, 'THICKOUTLINE')
		p.bordertop:Hide()
		p.borderbottom:Hide()
		p.borderleft:Hide()
		p.borderright:Hide()
	else
		p.text:FontTemplate(nil, 14, 'OUTLINE')
		p.bordertop:Show()
		p.borderbottom:Show()
		p.borderleft:Show()
		p.borderright:Show()
	end
	
end)

local function TransBubbles(alpha, ...)
	for index = 1, select('#', ...) do
		local frame = select(index, ...)

		if frame.isBubblePowered then
			if frame.backdrop then
				frame.backdrop:SetTexture(.054,.054,.054, alpha)
			end
			frame.backdrop2:SetTexture(.054,.054,.054, alpha)
			frame.text:SetShadowColor(0, 0, 0, 1 - alpha)
			if alpha == 0 then
				frame.text:FontTemplate(nil, 14, 'THICKOUTLINE')
				frame.bordertop:Hide()
				frame.borderbottom:Hide()
				frame.borderleft:Hide()
				frame.borderright:Hide()
			else
				p.text:FontTemplate(nil, 14, 'OUTLINE')
				frame.bordertop:Show()
				frame.borderbottom:Show()
				frame.borderleft:Show()
				frame.borderright:Show()
			end
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
			desc = "Changes the transparency of all chat bubbles. Set to 0 to also disable borders.",
			type = 'range',
			isPercent = true,
			min = 0, max = 1, step = 0.01,
			set = function(info, value)
				E.db.chatbubbles.alpha = value
				TransBubbles(value, WorldFrame:GetChildren())	
			end,
			get = function(info)
				return E.db.chatbubbles.alpha
			end,
		},
	},
}
