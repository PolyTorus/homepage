module Pages.Developers where

import Prelude
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Store.Theme as Theme

-- 開発者向けページ
developersContent :: forall w i. Theme.ThemeState -> HH.HTML w i
developersContent theme =
  HH.div
    [ HP.class_ (HH.ClassName "developers-page")
    , HP.style "padding: 2rem; max-width: 1200px; margin: 0 auto;"
    ]
    [ HH.h1
        [ HP.style $ "font-size: 3rem; font-weight: 700; margin-bottom: 2rem; color: " <> theme.color <> "; text-align: center;"
        ]
        [ HH.text "技術仕様とアーキテクチャ" ]
    
    -- アーキテクチャセクション
    , architectureSection
    
    -- 技術的な独自性
    , uniquenessSection
    
    -- API・実装セクション
    , implementationSection
    
    -- クイックスタートセクション
    , quickStartSection
    
    -- テスト環境セクション
    , testingSection
    
    -- エンタープライズ向けサービス
    , enterpriseSection
    ]

architectureSection :: forall w i. HH.HTML w i
architectureSection =
  HH.section
    [ HP.class_ (HH.ClassName "architecture")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-building"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "モジュラー設計" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1.5rem; margin-bottom: 2rem;"
        ]
        [ layerCard "P2Pネットワーク層" "WebRTC による直接通信" "network" "#e74c3c"
        , layerCard "データ同期層" "CRDTによる状態管理" "sync" "#f39c12"
        , layerCard "実行層" "Rustベースの処理エンジン" "execution" "#27ae60"
        , layerCard "ストレージ層" "分散データストレージ" "storage" "#0095d9"
        ]
    ]

uniquenessSection :: forall w i. HH.HTML w i
uniquenessSection =
  HH.section
    [ HP.class_ (HH.ClassName "uniqueness")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-lightbulb"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "技術的イノベーション" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); gap: 2rem;"
        ]
        [ innovationCard "コンセンサス不要のアーキテクチャ"
            "従来のブロックチェーンが必須とするコンセンサスメカニズムを排除"
            [ "CRDTによる自動競合解決"
            , "最終的一貫性の保証"
            , "ネットワーク分断時も動作継続"
            , "マージ時の自動調整"
            ]
        , innovationCardBlue "WebRTCネイティブ通信"
            "ブラウザ標準技術を活用した革新的なP2P通信"
            [ "NAT/ファイアウォール透過"
            , "STUN/TURNによる接続確立"
            , "低レイテンシデータチャネル"
            , "メディアストリーム対応"
            ]
        , innovationCardBlue "完全モジュラー設計"
            "各層が独立して動作・交換可能な真のモジュラー構造"
            [ "層間の疎結合"
            , "プロトコル独立性"
            , "段階的アップグレード"
            , "カスタム実装の容易さ"
            ]
        , innovationCard "オフラインファースト"
            "ネットワーク接続なしでも完全に機能"
            [ "ローカル状態の保持"
            , "再接続時の自動同期"
            , "部分的ネットワーク対応"
            , "断続的接続への最適化"
            ]
        ]
    ]

implementationSection :: forall w i. HH.HTML w i
implementationSection =
  HH.section
    [ HP.class_ (HH.ClassName "implementation")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-cogs"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "実装詳細" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;"
        ]
        [ implementationCard "Rustコア" "高速な処理とメモリ安全性" "async/await, zero-copy, 強力な型システム"
        , implementationCard "WebRTC通信" "ブラウザ間P2P接続" "STUN/TURN, データチャネル, メディアストリーム"
        , implementationCard "CRDT実装" "競合なし複製データ型" "最終的一貫性, 自動マージ, オフライン対応"
        , implementationCard "テスト基盤" "包括的なテスト環境" "Container Lab, E2Eテスト, CI/CD統合"
        ]
    ]

quickStartSection :: forall w i. HH.HTML w i
quickStartSection =
  HH.section
    [ HP.class_ (HH.ClassName "quickstart")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-rocket"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "クイックスタート" ]
    , HH.div
        [ HP.style "max-width: 800px; margin: 0 auto;"
        ]
        [ HH.h3
            [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
            ]
            [ HH.text "環境構築" ]
        , HH.pre
            [ HP.style "background: #32373C; color: #f0f0f0; padding: 1.5rem; border-radius: 8px; overflow-x: auto; margin-bottom: 2rem;"
            ]
            [ HH.code_
                [ HH.text "# リポジトリのクローン\ngit clone https://github.com/PolyTorus/polytorus.git\ncd polytorus\n\n# 依存関係のインストール\ncargo build --release\n\n# ローカルノードの起動\ncargo run -- node --dev"
                ]
            ]
        , HH.h3
            [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
            ]
            [ HH.text "基本的な使用例" ]
        , HH.pre
            [ HP.style "background: #32373C; color: #f0f0f0; padding: 1.5rem; border-radius: 8px; overflow-x: auto; margin-bottom: 2rem;"
            ]
            [ HH.code_
                [ HH.text "use polytorus::{Node, PeerConnection};\n\n// ノードの初期化\nlet mut node = Node::new().await?;\n\n// ピアへの接続\nnode.connect_peer(\"peer_address\").await?;\n\n// データの同期\nlet data = node.sync_data().await?;\n\n// P2Pメッセージの送信\nnode.broadcast_message(\"Hello, peers!\").await?;"
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
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-flask"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "テスト環境" ]
    , HH.div
        [ HP.style "max-width: 800px; margin: 0 auto;"
        ]
        [ HH.p
            [ HP.style "font-size: 1.2rem; color: #32373C; margin-bottom: 2rem; line-height: 1.6;"
            ]
            [ HH.text "Dockerベースのテスト環境で複数ノードのP2Pネットワークをローカルで再現。WebRTC接続、データ同期、障害シナリオを簡単にテスト可能。"
            ]
        , HH.pre
            [ HP.style "background: #32373C; color: #f0f0f0; padding: 1.5rem; border-radius: 8px; overflow-x: auto;"
            ]
            [ HH.code_
                [ HH.text "# テストネット用Dockerイメージのビルド\ndocker build -f Dockerfile.testnet -t polytorus:testnet .\n\n# 3ノードテストネットのデプロイ\n./scripts/manual-test.sh start\n\n# ログの確認\ndocker logs polytorus-node-1\n\n# テストの実行\ncargo test --release"
                ]
            ]
        ]
    ]

enterpriseSection :: forall w i. HH.HTML w i
enterpriseSection =
  HH.section
    [ HP.class_ (HH.ClassName "enterprise")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-building"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "エンタープライズサービス" ]
    , HH.div
        [ HP.style "max-width: 1000px; margin: 0 auto;"
        ]
        [ HH.div
            [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 3rem;"
            ]
            [ serviceCard "BaaS (Blockchain-as-a-Service)"
                "PolyTorusインフラを簡単に導入"
                [ "マネージドノード運用"
                , "API経由でのアクセス"
                , "SLA保証・24/7サポート"
                , "スケーラブルな従量課金"
                ]
            , serviceCard "P2Pインフラ提供"
                "WebRTCベースの通信基盤"
                [ "NAT/ファイアウォール透過"
                , "低レイテンシ通信"
                , "オフライン対応"
                , "カスタムプロトコル対応"
                ]
            , serviceCard "技術コンサルティング"
                "分散システム設計支援"
                [ "アーキテクチャ設計"
                , "技術選定アドバイス"
                , "開発チーム教育"
                , "プロトタイプ開発"
                ]
            ]
        , HH.div
            [ HP.style "background: #f8f9fa; padding: 2rem; border-radius: 12px;"
            ]
            [ HH.h3
                [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
                ]
                [ HH.text "導入事例・ユースケース" ]
            , HH.div
                [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1.5rem;"
                ]
                [ useCaseCard "金融サービス" "高頻度取引システム" "リアルタイム同期"
                , useCaseCard "IoTプラットフォーム" "デバイス間通信" "オフライン対応"
                , useCaseCard "コラボレーション" "分散ワークスペース" "P2P通信"
                , useCaseCard "ゲーミング" "マルチプレイヤー" "低レイテンシ"
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
        [ HP.style "color: #32373C; font-size: 0.95rem; line-height: 1.5; margin-bottom: 1rem;"
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
        [ HP.style "font-size: 1.3rem; font-weight: 600; margin-bottom: 0.5rem; color: #32373C;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #32373C; font-weight: 500; margin-bottom: 1rem;"
        ]
        [ HH.text subtitle ]
    , HH.p
        [ HP.style "color: #888; font-size: 0.9rem; line-height: 1.5;"
        ]
        [ HH.text details ]
    ]

innovationCard :: forall w i. String -> String -> Array String -> HH.HTML w i
innovationCard = innovationCardWithColor "#E60012"

innovationCardBlue :: forall w i. String -> String -> Array String -> HH.HTML w i
innovationCardBlue = innovationCardWithColor "#0095d9"

innovationCardWithColor :: forall w i. String -> String -> String -> Array String -> HH.HTML w i
innovationCardWithColor color title description features =
  HH.div
    [ HP.style $ "background: white; padding: 2.5rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); border-left: 4px solid " <> color <> ";"
    ]
    [ HH.h3
        [ HP.style "font-size: 1.4rem; font-weight: 600; margin-bottom: 0.8rem; color: #32373C;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #32373C; margin-bottom: 1.5rem; line-height: 1.6;"
        ]
        [ HH.text description ]
    , HH.ul
        [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.6rem;"
        ]
        (map featureItem features)
    ]
  where
    featureItem feature =
      HH.li
        [ HP.style "display: flex; align-items: center; gap: 0.5rem; color: #32373C; font-size: 0.95rem;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-check-circle"), HP.style "color: #E60012; font-size: 0.9rem;" ] []
        , HH.span_ [ HH.text feature ]
        ]

serviceCard :: forall w i. String -> String -> Array String -> HH.HTML w i
serviceCard title description features =
  HH.div
    [ HP.style "background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); border-top: 3px solid #E60012;"
    ]
    [ HH.h3
        [ HP.style "font-size: 1.3rem; font-weight: 600; margin-bottom: 0.8rem; color: #32373C;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #32373C; margin-bottom: 1.5rem; line-height: 1.6;"
        ]
        [ HH.text description ]
    , HH.ul
        [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.6rem;"
        ]
        (map serviceFeatureItem features)
    ]
  where
    serviceFeatureItem feature =
      HH.li
        [ HP.style "display: flex; align-items: center; gap: 0.5rem; color: #32373C; font-size: 0.9rem;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-arrow-right"), HP.style "color: #E60012; font-size: 0.8rem;" ] []
        , HH.span_ [ HH.text feature ]
        ]

useCaseCard :: forall w i. String -> String -> String -> HH.HTML w i
useCaseCard industry application benefit =
  HH.div
    [ HP.style "background: white; padding: 1.5rem; border-radius: 8px; text-align: center;"
    ]
    [ HH.h4
        [ HP.style "font-size: 1.1rem; font-weight: 600; margin-bottom: 0.5rem; color: #32373C;"
        ]
        [ HH.text industry ]
    , HH.p
        [ HP.style "color: #32373C; font-size: 0.9rem; margin-bottom: 0.5rem;"
        ]
        [ HH.text application ]
    , HH.span
        [ HP.style "color: #E60012; font-size: 0.8rem; font-weight: 500;"
        ]
        [ HH.text benefit ]
    ]