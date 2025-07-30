module App.Root where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Type.Proxy (Proxy(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Components.Header as Header

type State = { }

data Action = Initialize

type Slots = 
  ( header :: forall query. H.Slot query Void Unit
  )

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
initialState _ = { }

render :: State -> H.ComponentHTML Action Slots Aff
render _ =
  HH.div
    [ HP.class_ (HH.ClassName "app-root")
    , HP.style "min-height: 100vh; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);"
    ]
    [ HH.slot_ (Proxy :: Proxy "header") unit Header.component unit
    , HH.main
        [ HP.style "padding-top: 100px; padding: 100px 2rem 2rem 2rem; max-width: 1200px; margin: 0 auto;"
        ]
        [ heroSection
        , featuresSection
        , architectureSection
        , getStartedSection
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
    [ HP.class_ (HH.ClassName "features")
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
    [ HP.class_ (HH.ClassName "architecture")
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