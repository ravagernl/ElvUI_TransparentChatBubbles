-- =======================================================================================
-- Add-On Name: ElvUI Transparent Chat Bubbles
--     License: MIT
--      Author: Affli
-- Description: Allows the user to give all bubbles a transparency.
-- =======================================================================================


local ADDON_NAME, ETM = ...

if not ElvUI then return end
local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local M = E:GetModule('Misc');
local NP = E:GetModule("NamePlates");

-- Install
P["chatbubbles"] = {
  ["alpha"] = 0.5 
}

hooksecurefunc(M, 'SkinBubble', function(self,p)
	p.backdrop:SetTexture(.054,.054,.054,E.db.chatbubbles.alpha)
	p.backdrop2:SetTexture(.054,.054,.054,E.db.chatbubbles.alpha)
end)

function TransBubbles(...)
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
	
	
       --   E.db.chatbubbles.alpha = value
       -- for _,f in pairs(E.CreatedMovers) do
       --     if f.Created then
       --      f.mover:SetAlpha(E.db.movers.alpha)
       --     end
       --   end
        end,
      get = function(info)
          return E.db.chatbubbles.alpha
        end,
    },
  },
}


--[==[
The MIT License (MIT)
Copyright (c) 2012 Reuben DeLeon

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]==]