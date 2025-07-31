module Pages.Developers where

import Prelude
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

-- 開発者向けページ
developersContent :: forall w i. HH.HTML w i
developersContent =
  HH.div
    [ HP.class_ (HH.ClassName "developers-page")
    , HP.style "padding: 2rem; max-width: 1200px; margin: 0 auto;"
    ]
    [ HH.h1
        [ HP.style "font-size: 3rem; font-weight: 700; margin-bottom: 2rem; color: white; text-align: center;"
        ]
        [ HH.text "開発者向けドキュメント" ]
    
    -- アーキテクチャセクション
    , architectureSection
    
    -- API・実装セクション
    , implementationSection
    
    -- クイックスタートセクション
    , quickStartSection
    
    -- テスト環境セクション
    , testingSection
    ]

architectureSection :: forall w i. HH.HTML w i
architectureSection =
  HH.section
    [ HP.class_ (HH.ClassName "architecture")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #333; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-building"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "技術アーキテクチャ" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1.5rem; margin-bottom: 2rem;"
        ]
        [ layerCard "実行層" "WASM スマートコントラクト実行" "execution" "#e74c3c"
        , layerCard "決済層" "オプティミスティックロールアップ" "settlement" "#f39c12"
        , layerCard "合意層" "PoW コンセンサスメカニズム" "consensus" "#27ae60"
        , layerCard "データ可用性層" "Merkle tree とデータ配布" "data-availability" "#3498db"
        ]
    ]

implementationSection :: forall w i. HH.HTML w i
implementationSection =
  HH.section
    [ HP.class_ (HH.ClassName "implementation")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #333; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-cogs"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "実装詳細" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;"
        ]
        [ implementationCard "Rust実装" "高性能なコアライブラリ" "Zero-copy deserialization, async/await, type safety"
        , implementationCard "WebRTC P2P" "分散ネットワーキング" "NAT traversal, direct peer connections, mesh topology"
        , implementationCard "WASM Runtime" "スマートコントラクト実行" "Sandboxed execution, gas metering, deterministic runtime"
        , implementationCard "暗号ライブラリ" "ポスト量子暗号" "Lattice-based signatures, quantum-resistant hashing"
        ]
    ]

quickStartSection :: forall w i. HH.HTML w i
quickStartSection =
  HH.section
    [ HP.class_ (HH.ClassName "quickstart")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #333; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-rocket"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "クイックスタート" ]
    , HH.div
        [ HP.style "max-width: 800px; margin: 0 auto;"
        ]
        [ HH.h3
            [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem; color: #333;"
            ]
            [ HH.text "環境構築" ]
        , HH.pre
            [ HP.style "background: #1a1a1a; color: #f0f0f0; padding: 1.5rem; border-radius: 8px; overflow-x: auto; margin-bottom: 2rem;"
            ]
            [ HH.code_
                [ HH.text "# リポジトリのクローン\ngit clone https://github.com/PolyTorus/polytorus.git\ncd polytorus\n\n# 依存関係のインストール\ncargo build --release\n\n# 開発サーバーの起動\ncargo run start --dev"
                ]
            ]
        , HH.h3
            [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem; color: #333;"
            ]
            [ HH.text "基本的なAPI使用例" ]
        , HH.pre
            [ HP.style "background: #1a1a1a; color: #f0f0f0; padding: 1.5rem; border-radius: 8px; overflow-x: auto; margin-bottom: 2rem;"
            ]
            [ HH.code_
                [ HH.text "use polytorus::{Node, Transaction, Address};\n\n// ノードの初期化\nlet node = Node::new().await?;\n\n// トランザクションの作成\nlet tx = Transaction::new()\n    .from(alice_address)\n    .to(bob_address)\n    .amount(100)\n    .sign(&alice_key)?;\n\n// トランザクションの送信\nnode.broadcast_transaction(tx).await?;"
                ]
            ]
        ]
    ]

testingSection :: forall w i. HH.HTML w i
testingSection =
  HH.section
    [ HP.class_ (HH.ClassName "testing")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #333; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-flask"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "テスト環境" ]
    , HH.div
        [ HP.style "max-width: 800px; margin: 0 auto;"
        ]
        [ HH.p
            [ HP.style "font-size: 1.2rem; color: #666; margin-bottom: 2rem; line-height: 1.6;"
            ]
            [ HH.text "Container Lab E2Eテスト環境で本番環境を再現し、WebRTC P2Pネットワーキング、トランザクション伝播、マルチノード協調をDockerコンテナで簡単にテスト可能。"
            ]
        , HH.pre
            [ HP.style "background: #1a1a1a; color: #f0f0f0; padding: 1.5rem; border-radius: 8px; overflow-x: auto;"
            ]
            [ HH.code_
                [ HH.text "# テストネット用Dockerイメージのビルド\ndocker build -f Dockerfile.testnet -t polytorus:testnet .\n\n# 3ノードテストネットのデプロイ\n./scripts/manual-test.sh start\n\n# ログの確認\ndocker logs polytorus-node-1\n\n# テストの実行\ncargo test --release"
                ]
            ]
        ]
    ]

layerCard :: forall w i. String -> String -> String -> String -> HH.HTML w i
layerCard title description layer color =
  HH.div
    [ HP.style $ "background: white; padding: 2rem; border-radius: 12px; text-align: center; " <>
                 "box-shadow: 0 4px 12px rgba(0,0,0,0.1); border-top: 4px solid " <> color <> ";"
    ]
    [ HH.h3
        [ HP.style $ "font-size: 1.3rem; font-weight: 600; margin-bottom: 0.5rem; color: " <> color <> ";"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #666; font-size: 0.95rem; line-height: 1.5; margin-bottom: 1rem;"
        ]
        [ HH.text description ]
    , HH.code
        [ HP.style "background: rgba(0,0,0,0.1); padding: 0.3rem 0.6rem; border-radius: 4px; font-size: 0.85rem;"
        ]
        [ HH.text $ "crates/" <> layer <> "/" ]
    ]

implementationCard :: forall w i. String -> String -> String -> HH.HTML w i
implementationCard title subtitle details =
  HH.div
    [ HP.style "background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);"
    ]
    [ HH.h3
        [ HP.style "font-size: 1.3rem; font-weight: 600; margin-bottom: 0.5rem; color: #333;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #666; font-weight: 500; margin-bottom: 1rem;"
        ]
        [ HH.text subtitle ]
    , HH.p
        [ HP.style "color: #888; font-size: 0.9rem; line-height: 1.5;"
        ]
        [ HH.text details ]
    ]