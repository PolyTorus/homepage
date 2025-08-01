module Pages.General where

import Prelude
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

-- 一般人向けページ
generalContent :: forall w i. HH.HTML w i
generalContent =
  HH.div
    [ HP.class_ (HH.ClassName "general-page")
    , HP.style "padding: 2rem; max-width: 1200px; margin: 0 auto;"
    ]
    [ HH.h1
        [ HP.style "font-size: 3rem; font-weight: 700; margin-bottom: 2rem; color: white; text-align: center;"
        ]
        [ HH.text "PolyTorusとは" ]
    
    -- 概要セクション
    , overviewSection
    
    -- 他のブロックチェーンとの違い
    , differencesSection
    
    -- 特徴セクション
    , featuresSection
    
    -- 利点セクション
    , benefitsSection
    
    -- ビジネスモデルの違い
    , businessModelSection
    
    -- よくある質問
    , faqSection
    ]

overviewSection :: forall w i. HH.HTML w i
overviewSection =
  HH.section
    [ HP.class_ (HH.ClassName "overview")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem; text-align: center;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #333;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-star"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "PolyTorusプロジェクト" ]
    , HH.p
        [ HP.style "font-size: 1.3rem; color: #555; line-height: 1.8; margin-bottom: 2rem; max-width: 800px; margin-left: auto; margin-right: auto;"
        ]
        [ HH.text "PolyTorusは、P2P技術とモジュラーアーキテクチャを探求する実験的な分散システムプロジェクトです。新しい通信プロトコルとデータ同期手法の研究開発を行っています。"
        ]
    , HH.div
        [ HP.style "display: flex; justify-content: center; gap: 3rem; flex-wrap: wrap; margin-top: 3rem;"
        ]
        [ statCard "Rust" "実装言語"
        , statCard "WebRTC" "P2P通信"
        , statCard "CRDT" "データ同期"
        ]
    ]

differencesSection :: forall w i. HH.HTML w i
differencesSection =
  HH.section
    [ HP.class_ (HH.ClassName "differences")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 3rem; color: #333; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-exchange-alt"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "従来のブロックチェーンとの違い" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 2rem;"
        ]
        [ comparisonCard "アーキテクチャ設計"
            [ "従来: モノリシック（全機能一体型）"
            , "Celestia/Fuel: 部分的モジュラー"
            , "PolyTorus: 完全モジュラー + 独立層"
            ]
        , comparisonCard "コンセンサスメカニズム" 
            [ "従来: PoW/PoS/PoH必須"
            , "全ノードの合意形成が必要"
            , "PolyTorus: CRDTで合意不要"
            ]
        , comparisonCard "ネットワーク構造" 
            [ "従来: バリデータ中心の階層構造"
            , "特定ノードへの依存"
            , "PolyTorus: 完全P2P・フラット構造"
            ]
        , comparisonCard "通信プロトコル" 
            [ "従来: 専用プロトコル（libp2p等）"
            , "ファイアウォール問題あり"
            , "PolyTorus: WebRTC（NAT透過）"
            ]
        , comparisonCard "データ同期" 
            [ "従来: ブロック単位の同期"
            , "フォークや再編成の可能性"
            , "PolyTorus: リアルタイム自動マージ"
            ]
        , comparisonCard "実装の影響" 
            [ "低レイテンシ通信"
            , "オフライン対応"
            , "スケーラビリティの向上"
            ]
        ]
    ]

featuresSection :: forall w i. HH.HTML w i
featuresSection =
  HH.section
    [ HP.class_ (HH.ClassName "features")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 3rem; color: #333; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-sparkles"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "プロジェクトの特徴" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;"
        ]
        [ featureCardFA "fas fa-network-wired" "P2P通信" "直接ピア間通信" "WebRTCを使用してNATやファイアウォールを越えて直接通信を実現"
        , featureCardFA "fas fa-sync" "リアルタイム同期" "高速データ同期" "CRDTを使用して競合なしでデータを自動的にマージ"
        , featureCardFA "fas fa-cubes" "モジュラー設計" "レイヤー分離アーキテクチャ" "各機能層が独立して動作し、必要に応じて交換可能"
        , featureCardFA "fas fa-code" "Rust実装" "高速で安全" "メモリ安全性と並行処理性能を両立した実装"
        , featureCardFA "fas fa-flask" "実験的プロジェクト" "新技術の探求" "最新の分散システム技術を実験的に実装・検証"
        , featureCardFA "fas fa-github" "オープンソース" "透明な開発" "すべてのコードはGitHubで公開され、誰でも貢献可能"
        ]
    ]

benefitsSection :: forall w i. HH.HTML w i
benefitsSection =
  HH.section
    [ HP.class_ (HH.ClassName "benefits")
    , HP.style "margin-bottom: 4rem; color: white;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 3rem; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-bullseye"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "想定される活用方法" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 2rem;"
        ]
        [ benefitCard "研究者" 
            [ "分散システムの実験環境"
            , "新しいプロトコルの検証"
            , "P2P通信の研究"
            , "CRDTアルゴリズムの実装"
            ]
        , benefitCard "開発者" 
            [ "Rustによる実装学習"
            , "WebRTC技術の習得"
            , "モジュラー設計の実践"
            , "オープンソースへの貢献"
            ]
        , benefitCard "学生" 
            [ "最新技術の学習教材"
            , "実践的なコード例"
            , "システム設計の理解"
            , "コミュニティでの議論"
            ]
        ]
    ]

businessModelSection :: forall w i. HH.HTML w i
businessModelSection =
  HH.section
    [ HP.class_ (HH.ClassName "business-model")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 3rem; color: #333; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-briefcase"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "ビジネスモデルの違い" ]
    , HH.div
        [ HP.style "max-width: 1000px; margin: 0 auto;"
        ]
        [ HH.div
            [ HP.style "display: grid; grid-template-columns: 1fr 1fr; gap: 3rem; margin-bottom: 2rem;"
            ]
            [ businessComparisonCard "従来のブロックチェーン企業"
                [ "ConsenSys: MetaMask・Infura運営（年間収益$100M+）"
                , "Alchemy: 開発者向けAPI・インフラ提供"
                , "Solana Labs: エンタープライズ向けコンサル"
                , "Polygon: BaaS（Blockchain-as-a-Service）"
                , "収益モデル: SaaS料金・コンサル・トークン"
                ]
            , businessComparisonCard "PolyTorusの独自アプローチ"
                [ "研究開発 + ビジネスのハイブリッド"
                , "BaaS・インフラ提供サービス"
                , "エンタープライズ向けコンサルティング"
                , "革新的技術の商業化"
                , "収益モデル: サービス提供 + 研究投資"
                ]
            ]
        , HH.div
            [ HP.style "background: #f8f9fa; padding: 2rem; border-radius: 12px; margin-top: 2rem;"
            ]
            [ HH.h3
                [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem; color: #333;"
                ]
                [ HH.text "PolyTorusの独自戦略" ]
            , HH.p
                [ HP.style "color: #666; line-height: 1.8; margin-bottom: 1rem;"
                ]
                [ HH.text "研究開発とビジネスを両立させることで、持続可能なイノベーションと価値提供を実現します。" ]
            , HH.div
                [ HP.style "display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-top: 1.5rem;"
                ]
                [ HH.div_
                    [ HH.h4
                        [ HP.style "font-size: 1.2rem; font-weight: 600; margin-bottom: 0.8rem; color: #667eea;"
                        ]
                        [ HH.text "研究開発" ]
                    , HH.ul
                        [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.6rem;"
                        ]
                        [ businessPointItem "CRDTによる新しい同期手法"
                        , businessPointItem "WebRTCの限界への挑戦"
                        , businessPointItem "モジュラー設計の最適化"
                        , businessPointItem "学術論文・技術公開"
                        ]
                    ]
                , HH.div_
                    [ HH.h4
                        [ HP.style "font-size: 1.2rem; font-weight: 600; margin-bottom: 0.8rem; color: #667eea;"
                        ]
                        [ HH.text "ビジネス展開" ]
                    , HH.ul
                        [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.6rem;"
                        ]
                        [ businessPointItem "エンタープライズ向けBaaS"
                        , businessPointItem "P2Pインフラの提供"
                        , businessPointItem "技術コンサルティング"
                        , businessPointItem "カスタム開発支援"
                        ]
                    ]
                ]
            ]
        ]
    ]

faqSection :: forall w i. HH.HTML w i
faqSection =
  HH.section
    [ HP.class_ (HH.ClassName "faq")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 3rem; color: #333; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-question-circle"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "よくある質問" ]
    , HH.div
        [ HP.style "max-width: 800px; margin: 0 auto; display: flex; flex-direction: column; gap: 1.5rem;"
        ]
        [ faqItem "PolyTorusって何ですか？" "PolyTorusはP2P通信とモジュラーアーキテクチャを研究する実験的プロジェクトです。Rust、WebRTC、CRDTなどの技術を使用して分散システムの新しい可能性を探求しています。"
        , faqItem "実用的なシステムですか？" "現在は研究・実験段階のプロジェクトです。新しい技術の検証と学習を主な目的としており、本番環境での使用は想定していません。"
        , faqItem "どんな技術を使っていますか？" "Rustプログラミング言語、WebRTC（P2P通信）、CRDT（競合なしデータ同期）、Dockerコンテナなどの技術を組み合わせて実装しています。"
        , faqItem "参加するには何が必要ですか？" "Rustの基礎知識と分散システムへの興味があれば参加できます。GitHubリポジトリで開発が行われており、issue報告やプルリクエストを歓迎しています。"
        , faqItem "ドキュメントはどこにありますか？" "GitHubリポジトリのREADMEとdocsディレクトリに技術仕様やアーキテクチャの説明があります。また、コード内のコメントも参考になります。"
        ]
    ]

statCard :: forall w i. String -> String -> HH.HTML w i
statCard value label =
  HH.div
    [ HP.style "text-align: center;"
    ]
    [ HH.div
        [ HP.style "font-size: 3rem; font-weight: 800; color: #667eea; margin-bottom: 0.5rem;"
        ]
        [ HH.text value ]
    , HH.div
        [ HP.style "font-size: 1.1rem; font-weight: 600; color: #555;"
        ]
        [ HH.text label ]
    ]

featureCard :: forall w i. String -> String -> String -> String -> HH.HTML w i
featureCard icon title subtitle description =
  HH.div
    [ HP.style "background: white; padding: 2rem; border-radius: 12px; text-align: center; box-shadow: 0 4px 12px rgba(0,0,0,0.1);"
    ]
    [ HH.div
        [ HP.style "font-size: 3rem; margin-bottom: 1rem;"
        ]
        [ HH.text icon ]
    , HH.h3
        [ HP.style "font-size: 1.3rem; font-weight: 600; margin-bottom: 0.5rem; color: #333;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #667eea; font-weight: 500; margin-bottom: 1rem;"
        ]
        [ HH.text subtitle ]
    , HH.p
        [ HP.style "color: #666; line-height: 1.6; font-size: 0.95rem;"
        ]
        [ HH.text description ]
    ]

featureCardFA :: forall w i. String -> String -> String -> String -> HH.HTML w i
featureCardFA iconClass title subtitle description =
  HH.div
    [ HP.style "background: white; padding: 2rem; border-radius: 12px; text-align: center; box-shadow: 0 4px 12px rgba(0,0,0,0.1);"
    ]
    [ HH.div
        [ HP.style "font-size: 3rem; margin-bottom: 1rem; color: #667eea;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName iconClass) ] [] ]
    , HH.h3
        [ HP.style "font-size: 1.3rem; font-weight: 600; margin-bottom: 0.5rem; color: #333;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #667eea; font-weight: 500; margin-bottom: 1rem;"
        ]
        [ HH.text subtitle ]
    , HH.p
        [ HP.style "color: #666; line-height: 1.6; font-size: 0.95rem;"
        ]
        [ HH.text description ]
    ]

comparisonCard :: forall w i. String -> Array String -> HH.HTML w i
comparisonCard title points =
  HH.div
    [ HP.style "background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);"
    ]
    [ HH.h3
        [ HP.style "font-size: 1.3rem; font-weight: 600; margin-bottom: 1.5rem; color: #333;"
        ]
        [ HH.text title ]
    , HH.ul
        [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.8rem;"
        ]
        (map pointItem points)
    ]
  where
    pointItem point =
      HH.li
        [ HP.style "display: flex; align-items: flex-start; gap: 0.5rem; color: #666; line-height: 1.5;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-angle-right"), HP.style "color: #667eea; margin-top: 0.2rem; flex-shrink: 0;" ] []
        , HH.span_ [ HH.text point ]
        ]

benefitCard :: forall w i. String -> Array String -> HH.HTML w i
benefitCard title benefits =
  HH.div
    [ HP.style "background: rgba(255,255,255,0.1); padding: 2rem; border-radius: 12px; backdrop-filter: blur(10px);"
    ]
    [ HH.h3
        [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1.5rem; text-align: center;"
        ]
        [ HH.text title ]
    , HH.ul
        [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.8rem;"
        ]
        (map benefitItem benefits)
    ]
  where
    benefitItem benefit =
      HH.li
        [ HP.style "display: flex; align-items: center; gap: 0.5rem;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-check"), HP.style "color: #4ade80; font-size: 1.2rem;" ] []
        , HH.span_ [ HH.text benefit ]
        ]

businessComparisonCard :: forall w i. String -> Array String -> HH.HTML w i
businessComparisonCard title points =
  HH.div
    [ HP.style "background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);"
    ]
    [ HH.h3
        [ HP.style "font-size: 1.3rem; font-weight: 600; margin-bottom: 1.5rem; color: #333; text-align: center;"
        ]
        [ HH.text title ]
    , HH.ul
        [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.8rem;"
        ]
        (map businessPoint points)
    ]
  where
    businessPoint point =
      HH.li
        [ HP.style "display: flex; align-items: flex-start; gap: 0.5rem; color: #666; line-height: 1.5;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-circle"), HP.style "color: #667eea; font-size: 0.5rem; margin-top: 0.5rem;" ] []
        , HH.span_ [ HH.text point ]
        ]

businessPointItem :: forall w i. String -> HH.HTML w i
businessPointItem text =
  HH.li
    [ HP.style "display: flex; align-items: center; gap: 0.5rem; color: #555;"
    ]
    [ HH.i [ HP.class_ (HH.ClassName "fas fa-arrow-right"), HP.style "color: #667eea; font-size: 0.9rem;" ] []
    , HH.span_ [ HH.text text ]
    ]

faqItem :: forall w i. String -> String -> HH.HTML w i
faqItem question answer =
  HH.div
    [ HP.style "border-bottom: 1px solid #eee; padding-bottom: 1.5rem;"
    ]
    [ HH.h3
        [ HP.style "font-size: 1.2rem; font-weight: 600; margin-bottom: 0.8rem; color: #333;"
        ]
        [ HH.text question ]
    , HH.p
        [ HP.style "color: #666; line-height: 1.6;"
        ]
        [ HH.text answer ]
    ]