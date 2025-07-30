module Store.Theme where

import Prelude

type ThemeState =
  { mode :: ThemeMode
  , bg :: String
  , color :: String
  }

data ThemeMode = Light | Dark

derive instance eqThemeMode :: Eq ThemeMode

lightBg :: String
lightBg = "#fdfeff"

lightColor :: String
lightColor = "#32373c"

darkBg :: String
darkBg = "#1a202c"

darkColor :: String
darkColor = "#fdfeff"

initialTheme :: ThemeState
initialTheme =
  { mode: Light
  , bg: lightBg
  , color: lightColor
  }

getThemeForMode :: ThemeMode -> ThemeState
getThemeForMode mode = case mode of
  Light -> { mode: Light, bg: lightBg, color: lightColor }
  Dark -> { mode: Dark, bg: darkBg, color: darkColor }