module App.Root where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Type.Proxy (Proxy(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.HTML.Events as HE
import Store.Theme as Theme
import Components.Icons as Icons
import Types.Page as Page
import Pages.Home as Home
import Pages.Developers as Developers
import Pages.General as General
import Pages.Services as Services

type State = 
  { theme :: Theme.ThemeState
  , currentPage :: Page.Page
  }

data Action 
  = Initialize
  | ToggleTheme
  | NavigateTo Page.Page

type Slots = ( )

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
initialState _ = { theme: Theme.initialTheme, currentPage: Page.Home }

render :: State -> H.ComponentHTML Action Slots Aff
render state =
  HH.div
    [ HP.class_ (HH.ClassName "app-root")
    , HP.style "min-height: 100vh; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; margin: 0; padding: 0;"
    ]
    [ -- サイドバー（固定表示）
      HH.aside
        [ HP.class_ (HH.ClassName "sidebar")
        , HP.style $ "background-color: " <> state.theme.bg <> "f0; " <>
                     "color: " <> state.theme.color <> "; " <>
                     "position: fixed; top: 0; left: 0; height: 100vh; width: 200px; z-index: 10; " <>
                     "padding: 24px 16px; " <>
                     "border-right: 1px solid " <> borderColor <> "; " <>
                     "backdrop-filter: blur(10px); " <>
                     "display: flex; flex-direction: column; gap: 24px; " <>
                     "box-shadow: 2px 0 10px rgba(0,0,0,0.1);"
        ]
        [ HH.div
            [ HP.class_ (HH.ClassName "sidebar-header")
            , HP.style "display: flex; justify-content: space-between; align-items: center;"
            ]
            [ HH.h1
                [ HP.class_ (HH.ClassName "logo")
                , HP.style "font-size: 20px; font-weight: bold; margin: 0; cursor: pointer;"
                ]
                [ HH.text "Polytorus" ]
            , HH.button
                [ HP.class_ (HH.ClassName "theme-toggle")
                , HP.style $ "background: none; border: none; cursor: pointer; " <>
                             "padding: 8px; border-radius: 4px; color: " <> state.theme.color
                , HE.onClick \_ -> ToggleTheme
                ]
                [ case state.theme.mode of
                    Theme.Light -> Icons.moonIcon
                    Theme.Dark -> Icons.sunIcon
                ]
            ]
        , HH.nav
            [ HP.class_ (HH.ClassName "sidebar-nav")
            , HP.style "flex: 1;"
            ]
            [ HH.ul
                [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 16px;"
                ]
                [ navItemWithAction Icons.starIcon "ホーム" Page.Home (state.currentPage == Page.Home)
                , navItemWithAction Icons.rocketIcon "開発者向け" Page.ForDevelopers (state.currentPage == Page.ForDevelopers)
                , navItemWithAction Icons.starIcon "一般向け" Page.ForGeneral (state.currentPage == Page.ForGeneral)
                , navItemWithAction Icons.buildingIcon "サービス" Page.Services (state.currentPage == Page.Services)
                , navItemWithIcon Icons.bookIcon "ドキュメント" "https://github.com/PolyTorus/polytorus/blob/main/README.ja.md"
                , navItemWithIcon Icons.githubIcon "GitHub" "https://github.com/PolyTorus/polytorus"
                ]
            ]
        ]
    -- メインコンテンツ（サイドバーの幅を考慮）
    , HH.main
        [ HP.style "flex: 1; margin-left: 200px; padding: 0; overflow-x: hidden;"
        ]
        [ renderCurrentPage state.currentPage ]
    ]
  where
    renderCurrentPage page = case page of
      Page.Home -> Home.homeContent
      Page.ForDevelopers -> Developers.developersContent
      Page.ForGeneral -> General.generalContent
      Page.Services -> Services.servicesContent
    
    borderColor = case state.theme.mode of
      Theme.Dark -> "rgba(255, 255, 255, 0.1)"
      Theme.Light -> "rgba(50, 55, 60, 0.1)"
    
    navItemWithAction icon text page isActive =
      HH.li_
        [ HH.a
            [ HP.style $ "display: flex; align-items: center; gap: 10px; " <>
                         "padding: 10px 12px; border-radius: 8px; " <>
                         "text-decoration: none; color: " <> state.theme.color <> "; " <>
                         "transition: background-color 0.2s ease; " <>
                         "font-weight: 500; font-size: 14px; cursor: pointer; " <>
                         (if isActive then "background-color: rgba(102, 126, 234, 0.2); " else "")
            , HP.class_ (HH.ClassName "nav-item")
            , HE.onClick \_ -> NavigateTo page
            ]
            [ HH.span [ HP.style "display: flex; align-items: center;" ] [ icon ]
            , HH.span_ [ HH.text text ]
            ]
        ]
    
    navItemWithIcon icon text href =
      HH.li_
        [ HH.a
            [ HP.href href
            , HP.style $ "display: flex; align-items: center; gap: 10px; " <>
                         "padding: 10px 12px; border-radius: 8px; " <>
                         "text-decoration: none; color: " <> state.theme.color <> "; " <>
                         "transition: background-color 0.2s ease; " <>
                         "font-weight: 500; font-size: 14px;"
            , HP.class_ (HH.ClassName "nav-item")
            ]
            [ HH.span [ HP.style "display: flex; align-items: center;" ] [ icon ]
            , HH.span_ [ HH.text text ]
            ]
        ]


handleAction :: forall output. Action -> H.HalogenM State Action Slots output Aff Unit
handleAction = case _ of
  Initialize -> pure unit
    
  ToggleTheme -> do
    currentTheme <- H.gets _.theme
    let newMode = case currentTheme.mode of
          Theme.Light -> Theme.Dark
          Theme.Dark -> Theme.Light
        newTheme = Theme.getThemeForMode newMode
    H.modify_ _ { theme = newTheme }
    
  NavigateTo page -> do
    H.modify_ _ { currentPage = page }
