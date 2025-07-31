module Main where

import Prelude

import Data.String as String
import Effect (Effect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI component unit body

data Action 
  = ScrollTo String
  | NoOp

type State = 
  { activeSection :: String
  }

component :: forall query input output m. H.Component query input output m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }
  where
  initialState _ = { activeSection: "home" }

  render state =
    HH.div 
      [ HP.class_ $ HH.ClassName "app-root" ]
      [ renderHeader state
      , renderMain
      , renderFooter
      ]

  handleAction = case _ of
    ScrollTo section -> H.modify_ \s -> s { activeSection = section }
    NoOp -> pure unit

renderHeader :: forall m. State -> H.ComponentHTML Action () m
renderHeader state =
  HH.header
    [ HP.style "position: fixed; top: 0; left: 0; right: 0; background: rgba(255, 255, 255, 0.95); backdrop-filter: blur(10px); box-shadow: 0 2px 20px rgba(0,0,0,0.1); z-index: 1000; transition: all 0.3s ease;" ]
    [ HH.nav
        [ HP.style "max-width: 1200px; margin: 0 auto; padding: 1rem 2rem; display: flex; justify-content: space-between; align-items: center;" ]
        [ HH.div
            [ HP.style "display: flex; align-items: center; gap: 0.5rem;" ]
            [ HH.div
                [ HP.style "width: 32px; height: 32px; background: linear-gradient(135deg, #667eea, #764ba2); border-radius: 8px;" ]
                []
            , HH.h1
                [ HP.style "font-size: 1.5rem; font-weight: 700; background: linear-gradient(135deg, #667eea, #764ba2); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;" ]
                [ HH.text "PolyTorus" ]
            ]
        , HH.ul
            [ HP.style "list-style: none; display: flex; gap: 2rem; align-items: center;" ]
            [ renderNavItem "ホーム" "#home" (state.activeSection == "home")
            , renderNavItem "特徴" "#features" (state.activeSection == "features")
            , renderNavItem "アーキテクチャ" "#architecture" (state.activeSection == "architecture")
            , renderNavItem "ドキュメント" "#docs" (state.activeSection == "docs")
            , HH.li_
                [ HH.a
                    [ HP.href "https://github.com/PolyTorus/polytorus"
                    , HP.style "padding: 0.5rem 1.5rem; background: #333; color: white; text-decoration: none; border-radius: 8px; font-weight: 500; transition: all 0.3s ease;"
                    , HP.target "_blank"
                    ]
                    [ HH.text "GitHub" ]
                ]
            ]
        ]
    ]
  where
    renderNavItem label href isActive =
      HH.li_
        [ HH.a
            [ HP.href href
            , HE.onClick \_ -> ScrollTo (String.drop 1 href)
            , HP.style $ "color: " <> (if isActive then "#667eea" else "#666") <> "; text-decoration: none; font-weight: 500; transition: color 0.3s ease; position: relative;"
            ]
            [ HH.text label ]
        ]

renderMain :: forall m. H.ComponentHTML Action () m
renderMain =
  HH.main
    [ HP.style "padding: 80px 2rem 2rem 2rem; max-width: 1200px; margin: 0 auto;" ]
    [ renderHero
    , renderFeatures
    , renderArchitecture
    , renderGetStarted
    ]

renderHero :: forall m. H.ComponentHTML Action () m
renderHero =
  HH.section
    [ HP.id "home"
    , HP.class_ $ HH.ClassName "hero"
    , HP.style "min-height: calc(100vh - 80px); display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding: 4rem 0;"
    ]
    [ HH.h1
        [ HP.style "font-size: 4rem; font-weight: 800; margin-bottom: 1.5rem; background: linear-gradient(135deg, #667eea, #764ba2); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; line-height: 1.2;" ]
        [ HH.text "純国産ブロックチェーン" 
        , HH.br_
        , HH.text "PolyTorus"
        ]
    , HH.p
        [ HP.style "font-size: 1.5rem; color: #666; margin-bottom: 3rem; max-width: 800px; line-height: 1.8;" ]
        [ HH.text "ポスト量子時代に対応した革新的な4層モジュラーブロックチェーンプラットフォーム。柔軟な暗号方式、カスタマイズ可能なアーキテクチャ、完全なレイヤー分離を実現。" ]
    , HH.div
        [ HP.class_ $ HH.ClassName "buttons"
        , HP.style "display: flex; gap: 1.5rem; flex-wrap: wrap; justify-content: center;"
        ]
        [ HH.a
            [ HP.href "https://github.com/PolyTorus/polytorus"
            , HP.style "padding: 1rem 2.5rem; background: linear-gradient(135deg, #667eea, #764ba2); color: white; text-decoration: none; border-radius: 12px; font-weight: 600; font-size: 1.1rem; transition: transform 0.3s ease, box-shadow 0.3s ease; display: inline-block;"
            , HP.target "_blank"
            ]
            [ HH.text "今すぐ始める" ]
        , HH.a
            [ HP.href "#docs"
            , HE.onClick \_ -> ScrollTo "docs"
            , HP.style "padding: 1rem 2.5rem; background: white; color: #667eea; text-decoration: none; border-radius: 12px; font-weight: 600; font-size: 1.1rem; border: 2px solid #667eea; transition: all 0.3s ease; display: inline-block;"
            ]
            [ HH.text "ドキュメントを読む" ]
        ]
    ]

renderFeatures :: forall m. H.ComponentHTML Action () m  
renderFeatures =
  HH.section
    [ HP.id "features"
    , HP.class_ $ HH.ClassName "features"
    , HP.style "padding: 6rem 0; background: white; border-radius: 32px; margin: 2rem 0; box-shadow: 0 20px 60px rgba(0,0,0,0.1);"
    ]
    [ HH.div
        [ HP.style "max-width: 1000px; margin: 0 auto; padding: 0 2rem;" ]
        [ HH.h2
            [ HP.style "font-size: 3rem; font-weight: 700; text-align: center; margin-bottom: 1rem; color: #333;" ]
            [ HH.text "主な特徴" ]
        , HH.p
            [ HP.style "text-align: center; color: #666; font-size: 1.2rem; margin-bottom: 4rem; max-width: 700px; margin-left: auto; margin-right: auto;" ]
            [ HH.text "PolyTorusは次世代のブロックチェーン技術を統合し、スケーラブルで安全なプラットフォームを提供します" ]
        , HH.div
            [ HP.class_ $ HH.ClassName "grid"
            , HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;"
            ]
            [ renderFeatureCard "🔐" "Quantum-Resistant" "ポスト量子暗号技術により、量子コンピュータからの攻撃にも耐性を持つ設計"
            , renderFeatureCard "🧩" "モジュラー設計" "実行層、決済層、合意層、データ可用性層の4層構造で高い柔軟性を実現"
            , renderFeatureCard "⚡" "高性能" "WebRTC P2Pネットワークと最適化されたWASMスマートコントラクト実行環境"
            , renderFeatureCard "🛡️" "セキュリティ重視" "Diamond IOによるスマートコントラクトの難読化と包括的なセキュリティ機能"
            , renderFeatureCard "🌐" "完全分散" "中央集権的な要素を排除した、真の分散型ブロックチェーンプラットフォーム"
            , renderFeatureCard "🔧" "開発者フレンドリー" "充実したドキュメントと開発ツール、アクティブなコミュニティサポート"
            ]
        ]
    ]
  where
    renderFeatureCard icon title description =
      HH.div
        [ HP.class_ $ HH.ClassName "feature-card"
        , HP.style "background: #f8f9fa; padding: 2rem; border-radius: 16px; text-align: center; transition: all 0.3s ease; cursor: pointer;"
        ]
        [ HH.div
            [ HP.style "font-size: 3rem; margin-bottom: 1rem;" ]
            [ HH.text icon ]
        , HH.h3
            [ HP.style "font-size: 1.3rem; font-weight: 600; margin-bottom: 1rem; color: #333;" ]
            [ HH.text title ]
        , HH.p
            [ HP.style "color: #666; line-height: 1.6;" ]
            [ HH.text description ]
        ]

renderArchitecture :: forall m. H.ComponentHTML Action () m
renderArchitecture =
  HH.section
    [ HP.id "architecture"
    , HP.class_ $ HH.ClassName "architecture"
    , HP.style "padding: 6rem 0;"
    ]
    [ HH.div
        [ HP.style "max-width: 1000px; margin: 0 auto; padding: 0 2rem;" ]
        [ HH.h2
            [ HP.style "font-size: 3rem; font-weight: 700; text-align: center; margin-bottom: 1rem; color: white;" ]
            [ HH.text "4層モジュラーアーキテクチャ" ]
        , HH.p
            [ HP.style "text-align: center; color: rgba(255,255,255,0.9); font-size: 1.2rem; margin-bottom: 4rem; max-width: 700px; margin-left: auto; margin-right: auto;" ]
            [ HH.text "各層が独立して動作し、必要に応じてカスタマイズ可能な革新的な設計" ]
        , HH.div
            [ HP.class_ $ HH.ClassName "grid"
            , HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 1.5rem;"
            ]
            [ renderLayerCard "実行層" "WASM スマートコントラクト実行" "#667eea"
            , renderLayerCard "決済層" "Optimistic Rollup 処理" "#764ba2"
            , renderLayerCard "合意層" "Proof-of-Work コンセンサス" "#667eea"
            , renderLayerCard "データ可用性層" "Merkle Tree とデータ分散" "#764ba2"
            ]
        , HH.div
            [ HP.style "margin-top: 4rem; background: rgba(255,255,255,0.1); padding: 2rem; border-radius: 16px; backdrop-filter: blur(10px);" ]
            [ HH.h3
                [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem; color: white;" ]
                [ HH.text "Container Lab E2Eテスト環境" ]
            , HH.p
                [ HP.style "color: rgba(255,255,255,0.9); line-height: 1.8; margin-bottom: 1.5rem;" ]
                [ HH.text "本番環境を再現する包括的なテスト環境を提供。WebRTC P2Pネットワーキング、トランザクション伝播、マルチノード協調をDockerコンテナで簡単にテスト可能。" ]
            , HH.pre
                [ HP.style "background: rgba(0,0,0,0.3); padding: 1.5rem; border-radius: 8px; overflow-x: auto; color: #f0f0f0; font-size: 0.9rem;" ]
                [ HH.code_
                    [ HH.text "# テストネット用Dockerイメージのビルド\n"
                    , HH.text "docker build -f Dockerfile.testnet -t polytorus:testnet .\n\n"
                    , HH.text "# 3ノードテストネットのデプロイ\n"
                    , HH.text "./scripts/manual-test.sh start"
                    ]
                ]
            ]
        ]
    ]
  where
    renderLayerCard title description color =
      HH.div
        [ HP.class_ $ HH.ClassName "layer-card"
        , HP.style $ "background: white; padding: 2rem; border-radius: 16px; text-align: center; box-shadow: 0 10px 30px rgba(0,0,0,0.1); transition: all 0.3s ease; cursor: pointer; border-top: 4px solid " <> color <> ";"
        ]
        [ HH.h3
            [ HP.style $ "font-size: 1.3rem; font-weight: 600; margin-bottom: 0.5rem; color: " <> color <> ";" ]
            [ HH.text title ]
        , HH.p
            [ HP.style "color: #666; font-size: 0.95rem; line-height: 1.5;" ]
            [ HH.text description ]
        ]

renderGetStarted :: forall m. H.ComponentHTML Action () m
renderGetStarted =
  HH.section
    [ HP.id "docs"
    , HP.class_ $ HH.ClassName "get-started"
    , HP.style "padding: 6rem 0; background: white; border-radius: 32px; margin: 2rem 0; box-shadow: 0 20px 60px rgba(0,0,0,0.1);"
    ]
    [ HH.div
        [ HP.style "max-width: 800px; margin: 0 auto; padding: 0 2rem;" ]
        [ HH.h2
            [ HP.style "font-size: 3rem; font-weight: 700; text-align: center; margin-bottom: 3rem; color: #333;" ]
            [ HH.text "クイックスタート" ]
        , HH.div
            [ HP.style "background: #f8f9fa; padding: 2rem; border-radius: 16px; margin-bottom: 2rem;" ]
            [ HH.h3
                [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem; color: #333;" ]
                [ HH.text "必要環境" ]
            , HH.ul
                [ HP.style "list-style: none; color: #666; line-height: 2;" ]
                [ HH.li_ [ HH.text "✓ Rust 1.70以降（推奨：最新の安定版）" ]
                , HH.li_ [ HH.text "✓ Cargo（Rustに同梱）" ]
                , HH.li_ [ HH.text "✓ Git" ]
                , HH.li_ [ HH.text "✓ Linux、macOS、またはWSL2を使ったWindows" ]
                ]
            ]
        , HH.div
            [ HP.style "margin-bottom: 3rem;" ]
            [ HH.h3
                [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem; color: #333;" ]
                [ HH.text "インストール" ]
            , HH.pre
                [ HP.style "background: #1a1a1a; padding: 1.5rem; border-radius: 8px; overflow-x: auto; color: #f0f0f0;" ]
                [ HH.code_
                    [ HH.text "git clone https://github.com/PolyTorus/polytorus.git\n"
                    , HH.text "cd polytorus\n"
                    , HH.text "cargo build --release"
                    ]
                ]
            ]
        , HH.div
            [ HP.style "text-align: center;" ]
            [ HH.a
                [ HP.href "https://github.com/PolyTorus/polytorus/blob/main/README.ja.md"
                , HP.style "display: inline-block; padding: 1rem 2.5rem; background: linear-gradient(135deg, #667eea, #764ba2); color: white; text-decoration: none; border-radius: 12px; font-weight: 600; font-size: 1.1rem; transition: transform 0.3s ease, box-shadow 0.3s ease;"
                , HP.target "_blank"
                ]
                [ HH.text "詳細なドキュメントを見る" ]
            ]
        ]
    ]

renderFooter :: forall m. H.ComponentHTML Action () m
renderFooter =
  HH.footer
    [ HP.style "padding: 4rem 2rem; text-align: center; color: rgba(255,255,255,0.8);" ]
    [ HH.div
        [ HP.style "max-width: 1200px; margin: 0 auto;" ]
        [ HH.div
            [ HP.style "display: flex; justify-content: center; gap: 2rem; margin-bottom: 2rem; flex-wrap: wrap;" ]
            [ HH.a
                [ HP.href "https://github.com/PolyTorus/polytorus"
                , HP.style "color: white; text-decoration: none;"
                , HP.target "_blank"
                ]
                [ HH.text "GitHub" ]
            , HH.a
                [ HP.href "https://github.com/PolyTorus/polytorus/blob/main/README.ja.md"
                , HP.style "color: white; text-decoration: none;"
                , HP.target "_blank"
                ]
                [ HH.text "ドキュメント" ]
            , HH.a
                [ HP.href "https://github.com/PolyTorus/polytorus/issues"
                , HP.style "color: white; text-decoration: none;"
                , HP.target "_blank"
                ]
                [ HH.text "Issues" ]
            ]
        , HH.p
            [ HP.style "font-size: 0.9rem; opacity: 0.8;" ]
            [ HH.text "© 2025 PolyTorus Project. All rights reserved." ]
        ]
    ]