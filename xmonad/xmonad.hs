import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myTerminal = "urxvt"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/tom/.xmobarrc"
    xmonad $ defaultConfig
        { terminal = myTerminal,
          focusFollowsMouse = myFocusFollowsMouse,
          manageHook = manageDocks <+> manageHook defaultConfig,
          layoutHook = avoidStruts $ layoutHook defaultConfig,
          logHook = dynamicLogWithPP xmobarPP
              { ppOutput = hPutStrLn xmproc,
                ppTitle = xmobarColor "green" "" . shorten 50
              }
        } `additionalKeys`
        [ ((mod1Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock"),
          ((mod1Mask .|. shiftMask, xK_s), spawn "/usr/bin/screenshot scr")]
