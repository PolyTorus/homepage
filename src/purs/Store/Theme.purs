module Store.Theme where

import Prelude

type ThemeState =
  { mode :: ThemeMode
  , bg :: String
  , color :: String
  }

data ThemeMode = Light | Dark

derive instance eqThemeMode :: Eq ThemeMode

-- 新しいカラーパレット
primaryColor :: String
primaryColor = "#32373C"  -- グレー

accentRed :: String
accentRed = "#E60012"     -- 赤アクセント

accentBlue :: String
accentBlue = "#0095d9"    -- ブルーアクセント

-- テーマ色の定義
lightBg :: String
lightBg = "#f5f5f5"  -- 明るいグレー（真っ白ではない）

lightColor :: String
lightColor = primaryColor

darkBg :: String
darkBg = "#32373C"   -- グレー

darkColor :: String
darkColor = "#e9ecef"  -- 真っ白ではない柔らかい白

-- 新しいテーマで使用するアクセント色の取得
getAccentColor :: ThemeMode -> String
getAccentColor Light = accentRed
getAccentColor Dark = accentBlue

-- グラデーション用の色組み合わせ
getGradientColors :: ThemeMode -> { primary :: String, secondary :: String }
getGradientColors Light = { primary: accentRed, secondary: primaryColor }
getGradientColors Dark = { primary: primaryColor, secondary: accentBlue }

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