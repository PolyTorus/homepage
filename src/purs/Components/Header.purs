module Components.Header where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Store.Theme as Theme

type State = 
  { theme :: Theme.ThemeState
  , isHovered :: Boolean
  }

data Action 
  = Initialize
  | ToggleTheme
  | SetHover Boolean

component :: forall query input output. H.Component query input output Aff
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval H.defaultEval
        { handleAction = handleAction
        , initialize = Just Initialize
        }
    }

initialState :: forall input. input -> State
initialState _ = { theme: Theme.initialTheme, isHovered: false }

render :: State -> H.ComponentHTML Action () Aff
render state =
  HH.div_
    [ -- ホバーエリア（左端20px幅の不可視エリア）
      HH.div
        [ HP.class_ (HH.ClassName "hover-trigger")
        , HP.style "position: fixed; top: 0; left: 0; width: 20px; height: 100vh; z-index: 15; background: transparent;"
        , HE.onMouseEnter \_ -> SetHover true
        ]
        []
    -- サイドバーのヒント表示（非ホバー時に表示）
    , if not state.isHovered then
        HH.div
          [ HP.class_ (HH.ClassName "sidebar-hint")
          , HP.style $ "position: fixed; top: 50%; left: 0; transform: translateY(-50%); " <>
                       "background: " <> state.theme.bg <> "e0; " <>
                       "color: " <> state.theme.color <> "; " <>
                       "padding: 8px 12px 8px 8px; border-radius: 0 8px 8px 0; " <>
                       "z-index: 5; cursor: pointer; " <>
                       "box-shadow: 2px 0 10px rgba(0,0,0,0.1); " <>
                       "backdrop-filter: blur(10px); " <>
                       "border: 1px solid " <> borderColor <> "; " <>
                       "transition: all 0.3s ease;"
          , HE.onMouseEnter \_ -> SetHover true
          ]
          [ HH.text "☰" ]
      else
        HH.text ""
    , HH.aside
        [ HP.class_ (HH.ClassName "sidebar")
        , HP.style $ "background-color: " <> state.theme.bg <> "f0; " <>
                     "color: " <> state.theme.color <> "; " <>
                     "position: fixed; top: 0; left: " <> sidebarPosition <> "; height: 100vh; width: 280px; z-index: 10; " <>
                     "padding: 32px 24px; " <>
                     "border-right: 1px solid " <> borderColor <> "; " <>
                     "backdrop-filter: blur(10px); " <>
                     "display: flex; flex-direction: column; gap: 32px; " <>
                     "box-shadow: 2px 0 10px rgba(0,0,0,0.1); " <>
                     "transition: left 0.3s ease;"
        , HE.onMouseEnter \_ -> SetHover true
        , HE.onMouseLeave \_ -> SetHover false
        ]
    [ HH.div
        [ HP.class_ (HH.ClassName "sidebar-header")
        , HP.style "display: flex; justify-content: space-between; align-items: center;"
        ]
        [ HH.h1
            [ HP.class_ (HH.ClassName "logo")
            , HP.style "font-size: 24px; font-weight: bold; margin: 0; cursor: pointer;"
            ]
            [ HH.text "Polytorus" ]
        , HH.button
            [ HP.class_ (HH.ClassName "theme-toggle")
            , HP.style $ "background: none; border: none; cursor: pointer; " <>
                         "padding: 8px; border-radius: 4px; color: " <> state.theme.color
            , HE.onClick \_ -> ToggleTheme
            ]
            [ HH.text $ themeIcon state.theme.mode ]
        ]
    , HH.nav
        [ HP.class_ (HH.ClassName "sidebar-nav")
        , HP.style "flex: 1;"
        ]
        [ HH.ul
            [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 16px;"
            ]
            [ navItem "🌟" "特徴" "#features"
            , navItem "🏛️" "アーキテクチャ" "#architecture"
            , navItem "🚀" "始めよう" "#get-started"
            , navItem "📚" "ドキュメント" "https://github.com/PolyTorus/polytorus/blob/main/README.ja.md"
            , navItem "💻" "GitHub" "https://github.com/PolyTorus/polytorus"
            ]
        ]
    ]
    ]
  where
    sidebarPosition = if state.isHovered then "0" else "-260px"
    
    navItem icon text href =
      HH.li_
        [ HH.a
            [ HP.href href
            , HP.style $ "display: flex; align-items: center; gap: 12px; " <>
                         "padding: 12px 16px; border-radius: 8px; " <>
                         "text-decoration: none; color: " <> state.theme.color <> "; " <>
                         "transition: background-color 0.2s ease; " <>
                         "font-weight: 500;"
            , HP.class_ (HH.ClassName "nav-item")
            ]
            [ HH.span [ HP.style "font-size: 18px;" ] [ HH.text icon ]
            , HH.span_ [ HH.text text ]
            ]
        ]
    
    borderColor = case state.theme.mode of
      Theme.Dark -> "rgba(255, 255, 255, 0.1)"
      Theme.Light -> "rgba(50, 55, 60, 0.1)"
    
    themeIcon mode = case mode of
      Theme.Dark -> "☀️"
      Theme.Light -> "🌙"

handleAction :: forall output. Action -> H.HalogenM State Action () output Aff Unit
handleAction = case _ of
  Initialize -> pure unit
    
  ToggleTheme -> do
    currentTheme <- H.gets _.theme
    let newMode = case currentTheme.mode of
          Theme.Light -> Theme.Dark
          Theme.Dark -> Theme.Light
        newTheme = Theme.getThemeForMode newMode
    H.modify_ _ { theme = newTheme }
    
  SetHover isHovered -> do
    H.modify_ \s -> s { isHovered = isHovered }