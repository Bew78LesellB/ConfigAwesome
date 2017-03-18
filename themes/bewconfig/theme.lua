--------------------------------
--  "untitled" awesome theme  --
--    By Bew78LesellB (bew)   --
--------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main

local theme = {}

theme.name = "bewconfig"

theme.wallpaper_dir = "/home/lesell_b/wallpapers/"

--TODO: move in class Wallpaper
-- always return a table (can be empty)
local function getWallpapers()
	local cmd = "find " .. theme.wallpaper_dir .. " -type f -name '*.png' -o -name '*.jpg'"
	local output = io.popen(cmd)
	if not output then
		return {}
	end

	local walls = {}
	for wallPath in output:lines() do
		if not walls[wallPath] then
			table.insert(walls, wallPath)
			walls[wallPath] = #walls
		end
	end

	output:close()
	return walls
end

theme.wallpapers = getWallpapers()

do
	local random_wall_idx = math.random(1, #theme.wallpapers)
	theme.wallpaper = theme.wallpapers[random_wall_idx]
end
-- }}}



-- {{{ Local Vars
local path = require("awful.util").getdir("config") .. "/themes/" .. theme.name
theme.path = path

local bg_theme = "#252525"
-- }}}



-- {{{ Styles
--theme.font      = "sans 8"

theme.font      = "DejaVuSansMonoForPowerline Nerd Font 8"

-- {{{ Colors
theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#F0DFAF"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = bg_theme
theme.bg_focus   = "#009688"
theme.bg_urgent  = bg_theme
theme.bg_systray = theme.bg_normal
-- }}}



-- {{{ Icons
theme.icon = {}
function theme.addIcon(folder, name)
	if name == nil then
		name = folder
		folder = nil
	end
	local ipath = path .. "/icon/" .. (folder and folder .. "/") .. name .. ".png"
	if folder ~= nil then
		if theme.icon[folder] == nil then
			theme.icon[folder] = {}
		end
		theme.icon[folder][name] = ipath
	else
		theme.icon[name] = ipath
	end
	return ipath
end

function theme.getIcon(folder, name)
	if name == nil then
		name = folder
		folder = nil
	end
	if folder ~= nil and theme.icon[folder] ~= nil then
		return theme.icon[folder][name]
	else
		return theme.icon[name]
	end
end

theme.addIcon( "emergency", "rcEdit" )
theme.addIcon( "emergency", "rcReload" )




theme.client_default_opacity = 0.85



-- {{{ Borders
theme.border_width  = 5
theme.border_normal = bg_theme
theme.border_normal = "#202020"

--theme.border_focus  = "#FF9800" -- light orange
--theme.border_focus  = "#FF5722" -- Deep orange (500)
theme.border_focus  = "#33B5E5" -- Android Blue
theme.border_marked = "#CC9393"

theme.border_normal_when_locked = theme.border_normal
theme.border_focus_when_locked = "#c62828"

--theme.useless_gaps = "30"
theme.useless_gap_width = 30
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = bg_theme
theme.titlebar_bg_normal = bg_theme
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_bg_focus = "#009688"

theme.taglist_fg_empty = "#555555"
-- }}}

-- {{{ Menu
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Layout
theme.layout_tile       = theme.addIcon("layouts", "tile")
theme.layout_tileleft   = theme.addIcon("layouts", "tileleft")
theme.layout_tilebottom = theme.addIcon("layouts", "tilebottom")
theme.layout_tiletop    = theme.addIcon("layouts", "tiletop")
theme.layout_fairv      = theme.addIcon("layouts", "fairv")
theme.layout_fairh      = theme.addIcon("layouts", "fairh")
theme.layout_spiral     = theme.addIcon("layouts", "spiral")
theme.layout_dwindle    = theme.addIcon("layouts", "dwindle")
theme.layout_max        = theme.addIcon("layouts", "max")
theme.layout_fullscreen = theme.addIcon("layouts", "fullscreen")
theme.layout_magnifier  = theme.addIcon("layouts", "magnifier")
theme.layout_floating   = theme.addIcon("layouts", "floating")

theme.layout_treesome   = theme.addIcon("layouts", "treesome")
-- }}}

return theme
