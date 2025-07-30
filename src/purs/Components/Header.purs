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
  }

data Action 
  = Initialize
  | ToggleTheme

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
initialState _ = { theme: Theme.initialTheme }

render :: State -> H.ComponentHTML Action () Aff
render state =
  HH.header
    [ HP.class_ (HH.ClassName "header")
    , HP.style $ "background-color: " <> state.theme.bg <> "f0; " <>
                 "color: " <> state.theme.color <> "; " <>
                 "position: fixed; top: 0; width: 100%; z-index: 10; " <>
                 "padding: 16px 32px; " <>
                 "border-bottom: 1px solid " <> borderColor <> "; " <>
                 "backdrop-filter: blur(10px); " <>
                 "display: flex; justify-content: space-between; align-items: center;"
    ]
    [ HH.h1
        [ HP.class_ (HH.ClassName "logo")
        , HP.style "font-size: 30px; font-weight: bold; margin: 0; cursor: pointer;"
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
  where
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