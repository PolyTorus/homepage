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

type State = 
  { sidebarHovered :: Boolean
  , theme :: Theme.ThemeState
  }

data Action 
  = Initialize
  | SetSidebarHover Boolean
  | ToggleTheme

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
initialState _ = { sidebarHovered: false, theme: Theme.initialTheme }

render :: State -> H.ComponentHTML Action Slots Aff
render state =
  HH.div
    [ HP.class_ (HH.ClassName "app-root")
    , HP.style "min-height: 100vh; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); position: relative;"
    ]
    [ -- ホバーエリア（左端20px幅の不可視エリア）
      HH.div
        [ HP.class_ (HH.ClassName "hover-trigger")
        , HP.style "position: fixed; top: 0; left: 0; width: 20px; height: 100vh; z-index: 15; background: transparent;"
        , HE.onMouseEnter \_ -> SetSidebarHover true
        ]
        []
    -- サイドバーのヒント表示（非ホバー時に表示）
    , if not state.sidebarHovered then
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
          , HE.onMouseEnter \_ -> SetSidebarHover true
          ]
          [ HH.text "☰" ]
      else
        HH.text ""
    -- サイドバー
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
        , HE.onMouseEnter \_ -> SetSidebarHover true
        , HE.onMouseLeave \_ -> SetSidebarHover false
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
    -- メインコンテンツ（サイドバーの状態に応じて移動）
    , HH.main
        [ HP.style $ "padding: 2rem; max-width: 1200px; overflow-x: hidden; width: 100%; " <>
                     "margin-left: " <> contentMarginLeft <> "; " <>
                     "margin-right: " <> contentMarginRight <> "; " <>
                     "transition: margin-left 0.3s ease;"
        ]
        [ heroSection
        , featuresSection
        , architectureSection
        , getStartedSection
        ]
    ]
  where
    sidebarPosition = if state.sidebarHovered then "0" else "-260px"
    contentMarginLeft = if state.sidebarHovered then "280px" else "auto"
    contentMarginRight = if state.sidebarHovered then "auto" else "auto"
    
    borderColor = case state.theme.mode of
      Theme.Dark -> "rgba(255, 255, 255, 0.1)"
      Theme.Light -> "rgba(50, 55, 60, 0.1)"
    
    themeIcon mode = case mode of
      Theme.Dark -> "☀️"
      Theme.Light -> "🌙"
    
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

heroSection :: forall w i. HH.HTML w i
heroSection =
  HH.section
    [ HP.class_ (HH.ClassName "hero")
    , HP.style "text-align: center; padding: 4rem 0; color: white;"
    ]
    [ HH.h1 
        [ HP.style "font-size: 4rem; font-weight: bold; margin-bottom: 1rem; text-shadow: 2px 2px 4px rgba(0,0,0,0.3);" ] 
        [ HH.text "PolyTorus" ]
    , HH.p 
        [ HP.style "font-size: 1.5rem; margin-bottom: 2rem; opacity: 0.9;" ] 
        [ HH.text "次世代モジュラーブロックチェーンプラットフォーム" ]
    , HH.p 
        [ HP.style "font-size: 1.2rem; margin-bottom: 3rem; opacity: 0.8;" ] 
        [ HH.text "ポスト量子時代に対応した革新的な4層アーキテクチャ" ]
    , HH.div
        [ HP.style "display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;"
        ]
        [ HH.a
            [ HP.href "https://github.com/PolyTorus/polytorus"
            , HP.style "background: rgba(255,255,255,0.2); color: white; padding: 1rem 2rem; border-radius: 8px; text-decoration: none; font-weight: bold; backdrop-filter: blur(10px);"
            ]
            [ HH.text "🚀 GitHub で見る" ]
        , HH.a
            [ HP.href "#get-started"
            , HP.style "background: rgba(255,255,255,0.9); color: #333; padding: 1rem 2rem; border-radius: 8px; text-decoration: none; font-weight: bold;"
            ]
            [ HH.text "📖 始める" ]
        ]
    ]

featuresSection :: forall w i. HH.HTML w i
featuresSection =
  HH.section
    [ HP.id "features"
    , HP.class_ (HH.ClassName "features")
    , HP.style "padding: 4rem 0; background: rgba(255,255,255,0.95); border-radius: 16px; margin: 2rem 0; backdrop-filter: blur(10px);"
    ]
    [ HH.h2 
        [ HP.style "text-align: center; font-size: 2.5rem; margin-bottom: 3rem; color: #333;" ] 
        [ HH.text "🌟 主な特徴" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; padding: 0 2rem;"
        ]
        [ featureCard "🛡️" "量子耐性セキュリティ" "ポスト量子暗号技術により、未来の量子コンピュータ攻撃から保護"
        , featureCard "🏗️" "モジュラーアーキテクチャ" "実行・決済・合意・データ層の完全分離により、カスタマイズ可能な設計"
        , featureCard "⚡" "WASM スマートコントラクト" "高性能なWebAssemblyベースのスマートコントラクト実行環境"
        , featureCard "🌐" "WebRTC P2P ネットワーク" "分散型ピアツーピアネットワーキングによる堅牢な通信"
        , featureCard "💼" "HD ウォレット統合" "階層決定論的ウォレットによる安全な資産管理"
        , featureCard "🧪" "Container Lab テスト" "本格的なE2Eテスト環境でのネットワーク検証"
        ]
    ]

featureCard :: forall w i. String -> String -> String -> HH.HTML w i
featureCard icon title description =
  HH.div
    [ HP.style "background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); text-align: center;"
    ]
    [ HH.div 
        [ HP.style "font-size: 3rem; margin-bottom: 1rem;" ] 
        [ HH.text icon ]
    , HH.h3 
        [ HP.style "font-size: 1.5rem; margin-bottom: 1rem; color: #333;" ] 
        [ HH.text title ]
    , HH.p 
        [ HP.style "color: #666; line-height: 1.6;" ] 
        [ HH.text description ]
    ]

architectureSection :: forall w i. HH.HTML w i
architectureSection =
  HH.section
    [ HP.id "architecture"
    , HP.class_ (HH.ClassName "architecture")
    , HP.style "padding: 4rem 0; color: white;"
    ]
    [ HH.h2 
        [ HP.style "text-align: center; font-size: 2.5rem; margin-bottom: 3rem;" ] 
        [ HH.text "🏛️ 4層モジュラーアーキテクチャ" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1.5rem; max-width: 1000px; margin: 0 auto;"
        ]
        [ layerCard "1" "実行層" "WASM スマートコントラクト実行" "execution" "#e74c3c"
        , layerCard "2" "決済層" "オプティミスティックロールアップ" "settlement" "#f39c12"
        , layerCard "3" "合意層" "PoW コンセンサスメカニズム" "consensus" "#27ae60"
        , layerCard "4" "データ可用性層" "Merkle tree とデータ配布" "data-availability" "#3498db"
        ]
    ]

layerCard :: forall w i. String -> String -> String -> String -> String -> HH.HTML w i
layerCard number title description layer color =
  HH.div
    [ HP.style $ "background: " <> color <> "; padding: 2rem; border-radius: 12px; text-align: center; position: relative; overflow: hidden;"
    ]
    [ HH.div 
        [ HP.style "position: absolute; top: -20px; right: -20px; font-size: 6rem; opacity: 0.2; font-weight: bold;" ] 
        [ HH.text number ]
    , HH.h3 
        [ HP.style "font-size: 1.5rem; margin-bottom: 1rem; position: relative; z-index: 1;" ] 
        [ HH.text title ]
    , HH.p 
        [ HP.style "margin-bottom: 1rem; position: relative; z-index: 1;" ] 
        [ HH.text description ]
    , HH.code 
        [ HP.style "background: rgba(0,0,0,0.2); padding: 0.5rem; border-radius: 4px; font-size: 0.9rem; position: relative; z-index: 1;" ] 
        [ HH.text $ "crates/" <> layer <> "/" ]
    ]

getStartedSection :: forall w i. HH.HTML w i
getStartedSection =
  HH.section
    [ HP.id "get-started"
    , HP.class_ (HH.ClassName "get-started")
    , HP.style "padding: 4rem 0; background: rgba(255,255,255,0.95); border-radius: 16px; margin: 2rem 0;"
    ]
    [ HH.h2 
        [ HP.style "text-align: center; font-size: 2.5rem; margin-bottom: 3rem; color: #333;" ] 
        [ HH.text "🚀 始めよう" ]
    , HH.div
        [ HP.style "max-width: 800px; margin: 0 auto; padding: 0 2rem;"
        ]
        [ HH.h3 
            [ HP.style "font-size: 1.5rem; margin-bottom: 1rem; color: #333;" ] 
            [ HH.text "インストール" ]
        , HH.pre
            [ HP.style "background: #2c3e50; color: #ecf0f1; padding: 1.5rem; border-radius: 8px; overflow-x: auto; margin-bottom: 2rem;"
            ]
            [ HH.code_
                [ HH.text "git clone https://github.com/PolyTorus/polytorus.git\ncd polytorus\ncargo build --release" ]
            ]
        , HH.h3 
            [ HP.style "font-size: 1.5rem; margin-bottom: 1rem; color: #333;" ] 
            [ HH.text "基本的な使い方" ]
        , HH.pre
            [ HP.style "background: #2c3e50; color: #ecf0f1; padding: 1.5rem; border-radius: 8px; overflow-x: auto; margin-bottom: 2rem;"
            ]
            [ HH.code_
                [ HH.text "# ノード起動\ncargo run start\n\n# 送金実行\ncargo run send --from alice --to bob --amount 100\n\n# ステータス確認\ncargo run status" ]
            ]
        , HH.div
            [ HP.style "text-align: center; margin-top: 2rem;"
            ]
            [ HH.a
                [ HP.href "https://github.com/PolyTorus/polytorus/blob/main/README.ja.md"
                , HP.style "display: inline-block; background: #3498db; color: white; padding: 1rem 2rem; border-radius: 8px; text-decoration: none; font-weight: bold;"
                ]
                [ HH.text "📚 詳細ドキュメント" ]
            ]
        ]
    ]

handleAction :: forall output. Action -> H.HalogenM State Action Slots output Aff Unit
handleAction = case _ of
  Initialize -> pure unit
  
  SetSidebarHover isHovered -> do
    H.modify_ \s -> s { sidebarHovered = isHovered }
    
  ToggleTheme -> do
    currentTheme <- H.gets _.theme
    let newMode = case currentTheme.mode of
          Theme.Light -> Theme.Dark
          Theme.Dark -> Theme.Light
        newTheme = Theme.getThemeForMode newMode
    H.modify_ _ { theme = newTheme }