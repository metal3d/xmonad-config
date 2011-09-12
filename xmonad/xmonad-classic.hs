import XMonad
import XMonad.Config.Azerty
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Grid



-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what's being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Keybinding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- My Layouts...
myLayouts =  Tall 1 0.03 0.5  ||| Full ||| GridRatio (4/3) ||| GridRatio (2/3) 


-- my startup
myStartup :: X ()
myStartup = do
    spawn "~/bin/xmonad-startup"

-- Main configuration, override the defaults to your liking.
myConfig = azertyConfig { 
--    terminal           = "urxvt -depth 32 -tr -tint rgb:2222/2222/2222 +sb -fg white -bg rgba:0000/0000/0000/7777 -fade 15 -fadecolor black -pr black -pr2 white"
    terminal    =   "xterm -bg black -fg white +sb -u8 -lc -en UTF-8"
    , logHook = dynamicLog
    , startupHook = myStartup
    , layoutHook = myLayouts
 }

