local awful = require("awful")
local wibox = require("wibox")

local function addSpacing(spacing)
	local top = spacing.top or 0
	local right = spacing.right or 0
	local bottom = spacing.bottom or 0
	local left = spacing.left or 0

	return {
		widget = wibox.container.margin,
		top = top,
		right = right,
		bottom = bottom,
		left = left,
	}
end

return {
	createStatusBar = function(s)
		s.mywibox = awful.wibar({ position = "top", screen = s, height = 30 })

		-- Add widgets to the wibox
		s.mywibox:setup({
			{
				layout = wibox.layout.align.horizontal,
				expand = "none",
				{ -- Left widgets
					layout = wibox.layout.fixed.horizontal,
					addSpacing({ left = 8 }),
					mylauncher,
					addSpacing({ right = 10 }),
					s.mylayoutbox,
				},
				-- s.mytasklist, -- Middle widget
				{ layout = wibox.layout.align.horizontal, s.mytaglist },
				{ -- Right widgets
					layout = wibox.layout.fixed.horizontal,
					-- mykeyboardlayout,
					-- wibox.widget.systray(),
					mytextclock,
				},
			},
			top = 5,
			bottom = 5,
			widget = wibox.container.margin,
		})
	end,
}
