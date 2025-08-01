module Pages.Services where

import Prelude
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.HTML.Events as HE
import Store.Theme as Theme
import Types.Page as Page

-- サービス詳細ページ
servicesContent :: forall w i. Theme.ThemeState -> (Page.Page -> i) -> HH.HTML w i
servicesContent theme onNavigate =
  HH.div
    [ HP.class_ (HH.ClassName "services-page")
    , HP.style "padding: 2rem; max-width: 1200px; margin: 0 auto;"
    ]
    [ HH.h1
        [ HP.style $ "font-size: 3rem; font-weight: 700; margin-bottom: 2rem; color: " <> theme.color <> "; text-align: center;"
        ]
        [ HH.text "PolyTorusサービス" ]
    
    -- サービス概要
    , serviceOverviewSection
    
    -- 主要サービス一覧（カード形式）
    , mainServicesSection onNavigate
    
    -- お問い合わせ
    , contactSection
    ]

-- サービス概要セクション
serviceOverviewSection :: forall w i. HH.HTML w i
serviceOverviewSection =
  HH.section
    [ HP.class_ (HH.ClassName "service-overview")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-star"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "サービス概要" ]
    , HH.p
        [ HP.style "font-size: 1.3rem; color: #32373C; line-height: 1.8; margin-bottom: 2rem; text-align: center; max-width: 800px; margin-left: auto; margin-right: auto;"
        ]
        [ HH.text "PolyTorusは革新的な分散システム技術を活用したエンタープライズソリューションを提供します。no_std実装による軽量・高性能な耐量子暗号化技術で、IoT・衛星通信・ブロックチェーンの新しい価値をお客様のビジネスに。" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 2rem; margin-top: 3rem;"
        ]
        [ serviceHighlightCard "革新技術" "no_std・CRDT・WebRTC・耐量子暗号" "fas fa-rocket"
        , serviceHighlightCard "実績重視" "研究開発で培った確かな技術力" "fas fa-award"
        , serviceHighlightCard "幅広い対応" "IoT・衛星・ブロックチェーン統合" "fas fa-satellite"
        , serviceHighlightCard "24/7サポート" "安心の運用サポート体制" "fas fa-headset"
        ]
    ]

serviceHighlightCard :: forall w i. String -> String -> String -> HH.HTML w i
serviceHighlightCard title description iconClass =
  HH.div
    [ HP.style "text-align: center; padding: 1.5rem;"
    ]
    [ HH.i [ HP.class_ (HH.ClassName iconClass), HP.style "font-size: 2.5rem; color: #E60012; margin-bottom: 1rem;" ] []
    , HH.h3
        [ HP.style "font-size: 1.2rem; font-weight: 600; color: #32373C; margin-bottom: 0.5rem;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #32373C; opacity: 0.8; font-size: 0.9rem; line-height: 1.4;"
        ]
        [ HH.text description ]
    ]

-- 主要サービス一覧セクション
mainServicesSection :: forall w i. (Page.Page -> i) -> HH.HTML w i
mainServicesSection onNavigate =
  HH.section
    [ HP.class_ (HH.ClassName "main-services")
    , HP.style "margin-bottom: 4rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 3rem; text-align: center; color: #32373C;"
        ]
        [ HH.text "主要サービス" ]
    
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 2rem;"
        ]
        [ serviceCard onNavigate Page.BaaSPlatform "BaaS・ブロックチェーンプラットフォーム"
            "企業向けカスタムブロックチェーンソリューション"
            [ "カスタムブロックチェーン構築"
            , "スマートコントラクト開発"
            , "API・SDK提供"
            , "クラウドインフラ管理"
            ]
            "fas fa-cube"
            "#E60012"
            "月額 ¥200,000〜"
        
        , serviceCard onNavigate Page.P2PInfra "P2P通信インフラ"
            "WebRTCベースの分散通信プラットフォーム"
            [ "P2Pネットワーク構築"
            , "NAT越え自動処理"
            , "帯域幅最適化"
            , "高可用性保証"
            ]
            "fas fa-network-wired"
            "#0095d9"
            "月額 ¥100,000〜"
        
        , serviceCard onNavigate Page.IoTSatelliteSecurity "IoT・衛星通信セキュリティ"
            "no_std実装による軽量セキュリティソリューション"
            [ "組み込み耐量子暗号"
            , "衛星通信プラットフォーム"
            , "産業IoTセキュリティ"
            , "極限環境対応"
            ]
            "fas fa-satellite-dish"
            "#0095d9"
            "月額 ¥50,000〜"
        
        , serviceCard onNavigate Page.IoTMining "IoTマイニング・分散コンピューティング"
            "IoTデバイスを活用した新しい収益モデル"
            [ "デバイスマイニングプール"
            , "エッジコンピューティング"
            , "産業IoT統合"
            , "収益最大化AI"
            ]
            "fas fa-microchip"
            "#E60012"
            "月額 ¥10,000〜"
        
        , serviceCard onNavigate Page.Consulting "コンサルティング・技術支援"
            "ブロックチェーン・P2P技術の専門コンサルティング"
            [ "アーキテクチャ設計支援"
            , "技術選定・評価"
            , "セキュリティ監査"
            , "開発チーム育成"
            ]
            "fas fa-users-cog"
            "#32373C"
            "月額 ¥500,000〜"
        
        , serviceCard onNavigate Page.EnterpriseSupport "エンタープライズサポート"
            "24/7サポートとSLA保証"
            [ "専任エンジニア配属"
            , "緊急対応・障害復旧"
            , "定期ヘルスチェック"
            , "カスタム開発対応"
            ]
            "fas fa-headset"
            "#32373C"
            "月額 ¥300,000〜"
        ]
    ]

serviceCard :: forall w i. (Page.Page -> i) -> Page.ServiceType -> String -> String -> Array String -> String -> String -> String -> HH.HTML w i
serviceCard onNavigate serviceType title description features iconClass color pricing =
  HH.div
    [ HP.style $ "background: white; padding: 2.5rem; border-radius: 16px; box-shadow: 0 8px 24px rgba(0,0,0,0.1); " <>
                 "border-top: 4px solid " <> color <> "; transition: transform 0.3s ease, box-shadow 0.3s ease; " <>
                 "cursor: pointer;"
    , HP.class_ (HH.ClassName "service-card")
    , HE.onClick \_ -> onNavigate (Page.ServiceDetail serviceType)
    ]
    [ HH.div
        [ HP.style "display: flex; align-items: center; margin-bottom: 1.5rem;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName iconClass), HP.style $ "font-size: 2.5rem; color: " <> color <> "; margin-right: 1rem;" ] []
        , HH.h3
            [ HP.style "font-size: 1.5rem; font-weight: 600; color: #32373C; margin: 0; line-height: 1.3;"
            ]
            [ HH.text title ]
        ]
    , HH.p
        [ HP.style "color: #32373C; margin-bottom: 1.5rem; line-height: 1.6; opacity: 0.8; font-size: 1rem;"
        ]
        [ HH.text description ]
    , HH.ul
        [ HP.style "list-style: none; padding: 0; margin: 0 0 2rem 0;"
        ]
        (map (\feature -> 
          HH.li
            [ HP.style "display: flex; align-items: center; margin-bottom: 0.8rem;"
            ]
            [ HH.i [ HP.class_ (HH.ClassName "fas fa-check-circle"), HP.style $ "color: " <> color <> "; margin-right: 0.75rem; font-size: 0.9rem;" ] []
            , HH.span [ HP.style "color: #32373C; font-size: 0.95rem;" ] [ HH.text feature ]
            ]
        ) features)
    , HH.div
        [ HP.style "padding-top: 1.5rem; border-top: 1px solid #eee; text-align: center;"
        ]
        [ HH.div
            [ HP.style $ "font-size: 1.3rem; font-weight: 700; color: " <> color <> "; margin-bottom: 0.5rem;"
            ]
            [ HH.text pricing ]
        , HH.div
            [ HP.style "font-size: 0.9rem; color: #32373C; opacity: 0.6;"
            ]
            [ HH.text "詳細はお問い合わせください" ]
        ]
    ]

-- お問い合わせセクション
contactSection :: forall w i. HH.HTML w i
contactSection =
  HH.section
    [ HP.class_ (HH.ClassName "contact")
    , HP.style "margin-bottom: 4rem; background: linear-gradient(135deg, #E60012, #32373C); border-radius: 16px; padding: 3rem; color: white; text-align: center;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-envelope"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "お問い合わせ" ]
    , HH.p
        [ HP.style "font-size: 1.2rem; margin-bottom: 3rem; opacity: 0.9; line-height: 1.6; max-width: 600px; margin-left: auto; margin-right: auto;"
        ]
        [ HH.text "PolyTorusのサービスについてご質問やご相談がございましたら、お気軽にお問い合わせください。専門エンジニアが丁寧にサポートいたします。" ]
    , HH.div
        [ HP.style "text-align: center; max-width: 600px; margin: 0 auto;"
        ]
        [ HH.div
            [ HP.style "background: rgba(255,255,255,0.15); padding: 2rem; border-radius: 16px; backdrop-filter: blur(10px);"
            ]
            [ HH.i [ HP.class_ (HH.ClassName "fas fa-envelope"), HP.style "font-size: 3rem; margin-bottom: 1.5rem;" ] []
            , HH.h3
                [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem;"
                ]
                [ HH.text "お問い合わせ先" ]
            , HH.div
                [ HP.style "font-size: 1.3rem; font-weight: 500; margin-bottom: 1rem;"
                ]
                [ HH.text "polytorus@gmail.com" ]
            , HH.p
                [ HP.style "font-size: 1rem; opacity: 0.9; line-height: 1.6;"
                ]
                [ HH.text "技術相談、パートナーシップ、その他すべてのお問い合わせはこちらまで" ]
            ]
        ]
    ]

