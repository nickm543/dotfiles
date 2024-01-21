---------------------------
-- Default awesome theme --
---------------------------
home = os.getenv("HOME")
color = {
            CYAN = '#00FFFF',
           BLACK = '#000000',
        DARKCYAN = '#04B4AE',
        DARKBLUE = '#000099',
            GREY = '#222222',
          YELLOW = '#FFFF00',
             RED = '#FF0000',
         MAGENTA = '#FA58F4',
            GREY = '#585858',
          ORANGE = '#FF6600',
         BORANGE = '#FF3100',
             SKY = '#3399FF',
           GREEN = '#00FF00',
           WHITE = '#FFFFFF'
}

theme = {}
         --theme.font = "sans 8"
           theme.font = "Terminus 8"
      theme.bg_normal = "#00000099" --TRANSPARENCY
       theme.bg_focus = color.CYAN
      theme.bg_urgent = "#FF0080"
    theme.bg_minimize = "#010101"     --GRIS
         theme.fg_top = "#FA58F4"
    --theme.fg_normal = "#FFFF00"     --AMARILLO
      theme.fg_normal = color.GREY
     --theme.fg_focus = "#F8F8FF"
     --theme.fg_focus = "#00FFFF" --CYAN FUERTE
       theme.fg_focus = color.BLACK
      theme.fg_urgent = color.BLACK
    theme.fg_minimize = "#222222"
   theme.border_width = "1"
  theme.border_normal = color.BLACK
   theme.border_focus = color.BLACK
  theme.border_marked = "#91231c"
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.tasklist_bg_focus = "#9900CC"
theme.tasklist_bg_focus = color.BLACK
theme.tasklist_fg_focus = color.SKY
theme.tasklist_fg_normal= "#FFFF00"

theme.mouse_finder_timeout = 3
-- Display the taglist squares
   theme.taglist_squares_sel = "/usr/share/awesome/themes/default/taglist/squarefw.png"
 theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"
theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floatingw.png"
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_border_color = "#111000"
   theme.menu_bg_normal = color.BLACK
   theme.menu_fg_normal = color.GREY
    theme.menu_fg_focus = color.BLACK
    theme.menu_bg_focus = color.CYAN
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
--theme.menu_submenu_icon = home .. "/.config/awesome/images/flecha-sig.png"
      theme.menu_height = "21"
       theme.menu_width = "120"
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"
-- Define the image to load
             --theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
              --theme.titlebar_close_button_focus = "/usr/share/awesome/themes/default/titlebar/close_focus.png"
    --theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
     --theme.titlebar_ontop_button_focus_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
      --theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
       --theme.titlebar_ontop_button_focus_active = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"
   --theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
    --theme.titlebar_sticky_button_focus_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
     --theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
      --theme.titlebar_sticky_button_focus_active = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"
 --theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
  --theme.titlebar_floating_button_focus_inactive = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
   --theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
    --theme.titlebar_floating_button_focus_active = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"
--theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
 --theme.titlebar_maximized_button_focus_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
  --theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
   --theme.titlebar_maximized_button_focus_active = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"
-- You can use your own layout icons like this:
--
     theme.layout_fairh = "/usr/share/awesome/themes/default/layouts/fairhw.png"
     theme.layout_fairv = "/usr/share/awesome/themes/default/layouts/fairvw.png"
  theme.layout_floating = "/usr/share/awesome/themes/default/layouts/floatingw.png"
 theme.layout_magnifier = "/usr/share/awesome/themes/default/layouts/magnifierw.png"
       theme.layout_max = "/usr/share/awesome/themes/default/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/default/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/default/layouts/tilebottomw.png"
  theme.layout_tileleft = "/usr/share/awesome/themes/default/layouts/tileleftw.png"
      theme.layout_tile = "/usr/share/awesome/themes/default/layouts/tilew.png"
   theme.layout_tiletop = "/usr/share/awesome/themes/default/layouts/tiletopw.png"
    theme.layout_spiral = "/usr/share/awesome/themes/default/layouts/spiralw.png"
   theme.layout_dwindle = "/usr/share/awesome/themes/default/layouts/dwindlew.png"
     theme.awesome_icon = "/home/w4rlock/.config/awesome/themes/archLogo.png"

          theme.project = home .. "/.config/awesome/images/project.png"
      theme.udisks_glue = home .. "/.config/awesome/images/usb_icon.png"
              theme.usb = home .. "/.config/awesome/images/usb.png"
            theme.cdrom = home .. "/.config/awesome/images/cdrom.png"
          theme.editors = home .. "/.config/awesome/menu/vim.png"
            theme.tools = home .. "/.config/awesome/menu/tools.png"
    theme.calendar_icon = home .. "/.config/awesome/images/calendar.png"
--     theme.awesome_icon = home .. "/.config/awesome/images/menu.gif"
--theme.wallpaper_cmd = { "awsetbg /home/w4rlock/myPictures/archLinuxWallpaper/Zangetsu_loves_Archie_by_paul_sebastian.png" }
              wallpaper = "awsetbg  " .. home .."/.config/awesome/images/wallpaper.png"
    theme.wallpaper_cmd = { wallpaper}

return theme
--vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
