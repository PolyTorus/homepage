module Pages.Services where

import Prelude
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Store.Theme as Theme

-- サービス詳細ページ
servicesContent :: forall w i. Theme.ThemeState -> HH.HTML w i
servicesContent theme =
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
    
    -- BaaSサービス
    , baasServiceSection
    
    -- P2Pインフラサービス
    , p2pInfraSection
    
    -- コンサルティングサービス
    , consultingSection
    
    -- 料金体系
    , pricingSection
    
    -- サポート・SLA
    , supportSection
    
    -- お問い合わせ
    , contactSection
    ]

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
        [ HH.text "PolyTorusは革新的な分散システム技術を活用したエンタープライズソリューションを提供します。従来のブロックチェーンの限界を超える新しい価値をお客様のビジネスに。" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 2rem; margin-top: 3rem;"
        ]
        [ serviceHighlightCard "革新技術" "CRDT・WebRTC・モジュラー設計" "fas fa-rocket"
        , serviceHighlightCard "実績重視" "研究開発で培った確かな技術力" "fas fa-award"
        , serviceHighlightCard "カスタマイズ" "お客様のニーズに合わせた設計" "fas fa-cogs"
        , serviceHighlightCard "24/7サポート" "安心の運用サポート体制" "fas fa-headset"
        ]
    ]

baasServiceSection :: forall w i. HH.HTML w i
baasServiceSection =
  HH.section
    [ HP.class_ (HH.ClassName "baas-service")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-cloud"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "BaaS (Blockchain-as-a-Service)" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: 2fr 1fr; gap: 3rem; align-items: start;"
        ]
        [ HH.div_
            [ HH.h3
                [ HP.style "font-size: 1.8rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
                ]
                [ HH.text "PolyTorusインフラをクラウドサービスとして提供" ]
            , HH.p
                [ HP.style "color: #32373C; line-height: 1.7; margin-bottom: 2rem; font-size: 1.1rem;"
                ]
                [ HH.text "複雑なインフラ構築・運用を任せて、お客様はアプリケーション開発に集中できます。従来のブロックチェーンでは実現困難な、リアルタイム同期とオフライン対応を標準で提供。" ]
            , HH.h4
                [ HP.style "font-size: 1.3rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
                ]
                [ HH.text "主な機能" ]
            , HH.ul
                [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.8rem; margin-bottom: 2rem;"
                ]
                [ baasFeatureItem "マネージドノード運用" "24/7監視・自動スケーリング・アップデート管理"
                , baasFeatureItem "REST API提供" "シンプルなHTTP APIでPolyTorusネットワークにアクセス"
                , baasFeatureItem "リアルタイム同期" "WebSocket経由でのデータ変更のリアルタイム通知"
                , baasFeatureItem "オフライン対応" "ネットワーク断絶時もローカルで動作継続"
                , baasFeatureItem "セキュリティ管理" "認証・認可・暗号化を一元管理"
                ]
            ]
        , HH.div
            [ HP.style "background: #f8f9fa; padding: 2rem; border-radius: 12px;"
            ]
            [ HH.h4
                [ HP.style "font-size: 1.2rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
                ]
                [ HH.text "適用業界" ]
            , HH.div
                [ HP.style "display: flex; flex-direction: column; gap: 1rem;"
                ]
                [ industryCard "金融・フィンテック"
                , industryCard "サプライチェーン"
                , industryCard "ヘルスケア"
                , industryCard "不動産・資産管理"
                , industryCard "エンターテイメント"
                ]
            ]
        ]
    ]

p2pInfraSection :: forall w i. HH.HTML w i
p2pInfraSection =
  HH.section
    [ HP.class_ (HH.ClassName "p2p-infra")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-network-wired"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "P2P通信インフラサービス" ]
    , HH.div
        [ HP.style "max-width: 1000px; margin: 0 auto;"
        ]
        [ HH.p
            [ HP.style "color: #32373C; line-height: 1.7; margin-bottom: 2rem; font-size: 1.1rem; text-align: center;"
            ]
            [ HH.text "WebRTC技術を活用した次世代P2P通信インフラを提供。NAT/ファイアウォールを透過して直接通信を実現し、従来のサーバー中心型アーキテクチャの限界を突破。" ]
        , HH.div
            [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 3rem;"
            ]
            [ p2pFeatureCard "低レイテンシ通信"
                "サーバーを経由せず直接通信"
                [ "平均レイテンシ50ms以下"
                , "リアルタイムデータ交換"
                , "ゲーミング・トレーディング対応"
                ]
            , p2pFeatureCard "NAT透過技術"
                "どんな環境でも接続を確立"
                [ "STUN/TURNサーバー完備"
                , "企業ファイアウォール対応"
                , "モバイル・IoTデバイス対応"
                ]
            , p2pFeatureCard "スケーラブル設計"
                "参加者数に応じて自動拡張"
                [ "メッシュ・スター型選択可能"
                , "負荷分散アルゴリズム"
                , "帯域幅最適化"
                ]
            ]
        , HH.div
            [ HP.style "background: #f0f8ff; padding: 2rem; border-radius: 12px; border-left: 4px solid #0095d9;"
            ]
            [ HH.h3
                [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
                ]
                [ HH.text "活用シナリオ" ]
            , HH.div
                [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1.5rem;"
                ]
                [ scenarioCard "リモートワーク" "分散チーム間のリアルタイムコラボレーション"
                , scenarioCard "IoTネットワーク" "デバイス間の直接通信とデータ同期"
                , scenarioCard "オンラインゲーム" "マルチプレイヤーゲームの超低レイテンシ通信"
                , scenarioCard "ライブストリーミング" "視聴者参加型のリアルタイム配信"
                ]
            ]
        ]
    ]

consultingSection :: forall w i. HH.HTML w i
consultingSection =
  HH.section
    [ HP.class_ (HH.ClassName "consulting")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-users-cog"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "技術コンサルティング" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: 1fr 1fr; gap: 3rem;"
        ]
        [ HH.div_
            [ HH.h3
                [ HP.style "font-size: 1.8rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
                ]
                [ HH.text "分散システム設計のエキスパートサポート" ]
            , HH.p
                [ HP.style "color: #32373C; line-height: 1.7; margin-bottom: 2rem; font-size: 1.1rem;"
                ]
                [ HH.text "豊富な研究開発経験を基に、お客様の課題に最適な分散システムアーキテクチャを提案・実装支援いたします。" ]
            , HH.div
                [ HP.style "display: flex; flex-direction: column; gap: 1.5rem;"
                ]
                [ consultingServiceCard "アーキテクチャ設計"
                    "システム要件分析から最適設計まで"
                    "¥800,000〜/月"
                , consultingServiceCard "技術選定・評価"
                    "技術スタック選定とPoCサポート"
                    "¥500,000〜/月"
                , consultingServiceCard "開発チーム教育"
                    "分散システム開発スキルの育成"
                    "¥300,000〜/月"
                ]
            ]
        , HH.div_
            [ HH.h3
                [ HP.style "font-size: 1.8rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
                ]
                [ HH.text "コンサルティングプロセス" ]
            , HH.div
                [ HP.style "display: flex; flex-direction: column; gap: 1rem;"
                ]
                [ processStepCard "1" "要件ヒアリング" "ビジネス課題と技術要件の詳細分析"
                , processStepCard "2" "技術調査・設計" "最適なアーキテクチャの提案と設計"
                , processStepCard "3" "PoC開発" "コンセプト実証による技術検証"
                , processStepCard "4" "実装支援" "本格開発フェーズでの技術サポート"
                , processStepCard "5" "運用サポート" "システム稼働後の継続的サポート"
                ]
            ]
        ]
    ]

pricingSection :: forall w i. HH.HTML w i
pricingSection =
  HH.section
    [ HP.class_ (HH.ClassName "pricing")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-yen-sign"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "料金体系" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; max-width: 1000px; margin: 0 auto;"
        ]
        [ pricingCard "スタータープラン"
            "¥50,000/月"
            [ "ノード数: 最大3個"
            , "API コール: 100万回/月"
            , "ストレージ: 10GB"
            , "メールサポート"
            ]
            false
        , pricingCard "ビジネスプラン"
            "¥200,000/月"
            [ "ノード数: 最大10個"
            , "API コール: 1000万回/月"
            , "ストレージ: 100GB"
            , "24/7チャットサポート"
            , "SLA 99.9%保証"
            ]
            true
        , pricingCard "エンタープライズ"
            "お問い合わせ"
            [ "無制限ノード数"
            , "API コール: 無制限"
            , "ストレージ: 無制限"
            , "専任サポート"
            , "SLA 99.99%保証"
            , "カスタム開発対応"
            ]
            false
        ]
    ]

supportSection :: forall w i. HH.HTML w i
supportSection =
  HH.section
    [ HP.class_ (HH.ClassName "support")
    , HP.style "margin-bottom: 4rem; background: rgba(255,255,255,0.95); border-radius: 16px; padding: 3rem;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; color: #32373C; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-shield-alt"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "サポート・SLA" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: 1fr 1fr; gap: 3rem;"
        ]
        [ HH.div_
            [ HH.h3
                [ HP.style "font-size: 1.6rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
                ]
                [ HH.text "サービスレベル保証" ]
            , HH.div
                [ HP.style "display: flex; flex-direction: column; gap: 1rem;"
                ]
                [ slaCard "稼働率保証" "99.9%〜99.99%" "計画外停止を最小限に抑制"
                , slaCard "レスポンス保証" "API: 100ms以下" "高速なレスポンス時間を保証"
                , slaCard "復旧時間保証" "RTO: 4時間以内" "障害時の迅速な復旧対応"
                , slaCard "データ保護" "RPO: 1時間以内" "データ損失を最小限に抑制"
                ]
            ]
        , HH.div_
            [ HH.h3
                [ HP.style "font-size: 1.6rem; font-weight: 600; margin-bottom: 1rem; color: #32373C;"
                ]
                [ HH.text "サポート体制" ]
            , HH.div
                [ HP.style "display: flex; flex-direction: column; gap: 1rem;"
                ]
                [ supportLevelCard "Lv1: 基本サポート" "メール・チャットでの問い合わせ対応" "平日 9:00-18:00"
                , supportLevelCard "Lv2: 24/7サポート" "電話・チャットでの24時間対応" "年中無休"
                , supportLevelCard "Lv3: 専任サポート" "専任エンジニアによる個別対応" "お客様専用チーム"
                ]
            ]
        ]
    ]

contactSection :: forall w i. HH.HTML w i
contactSection =
  HH.section
    [ HP.class_ (HH.ClassName "contact")
    , HP.style "margin-bottom: 4rem; background: linear-gradient(135deg, #E60012, #32373C); border-radius: 16px; padding: 3rem; color: white;"
    ]
    [ HH.h2
        [ HP.style "font-size: 2.5rem; font-weight: 700; margin-bottom: 2rem; text-align: center;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-envelope"), HP.style "margin-right: 0.5rem;" ] []
        , HH.text "お問い合わせ" ]
    , HH.div
        [ HP.style "max-width: 800px; margin: 0 auto; text-align: center;"
        ]
        [ HH.p
            [ HP.style "font-size: 1.3rem; line-height: 1.7; margin-bottom: 2rem;"
            ]
            [ HH.text "PolyTorusのサービスにご興味をお持ちいただき、ありがとうございます。お客様のビジネス課題に最適なソリューションをご提案いたします。" ]
        , HH.div
            [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 2rem; margin-bottom: 2rem;"
            ]
            [ contactMethodCard "営業・お見積り" "polytorus[at]gmail.com" "fas fa-handshake"
            , contactMethodCard "技術的なご質問" "polytorus[at]gmail.com" "fas fa-code"
            , contactMethodCard "サポート窓口" "polytorus[at]gmail.com" "fas fa-headset"
            ]
        , HH.p
            [ HP.style "font-size: 1.1rem; opacity: 0.9;"
            ]
            [ HH.text "お問い合わせから24時間以内にご返答いたします" ]
        ]
    ]

-- Helper functions for components

serviceHighlightCard :: forall w i. String -> String -> String -> HH.HTML w i
serviceHighlightCard title description iconClass =
  HH.div
    [ HP.style "background: white; padding: 2rem; border-radius: 12px; text-align: center; box-shadow: 0 4px 12px rgba(0,0,0,0.1);"
    ]
    [ HH.i [ HP.class_ (HH.ClassName iconClass), HP.style "font-size: 2.5rem; color: #E60012; margin-bottom: 1rem;" ] []
    , HH.h3
        [ HP.style "font-size: 1.2rem; font-weight: 600; margin-bottom: 0.5rem; color: #32373C;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #32373C; font-size: 0.9rem; line-height: 1.5;"
        ]
        [ HH.text description ]
    ]

baasFeatureItem :: forall w i. String -> String -> HH.HTML w i
baasFeatureItem feature description =
  HH.li
    [ HP.style "display: flex; flex-direction: column; gap: 0.3rem;"
    ]
    [ HH.div
        [ HP.style "display: flex; align-items: center; gap: 0.5rem;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-check-circle"), HP.style "color: #4caf50; font-size: 1rem;" ] []
        , HH.span [ HP.style "font-weight: 600; color: #32373C;" ] [ HH.text feature ]
        ]
    , HH.p
        [ HP.style "color: #32373C; font-size: 0.9rem; margin-left: 1.5rem; line-height: 1.4;"
        ]
        [ HH.text description ]
    ]

industryCard :: forall w i. String -> HH.HTML w i
industryCard industry =
  HH.div
    [ HP.style "background: white; padding: 1rem; border-radius: 8px; text-align: center; border-left: 3px solid #0095d9;"
    ]
    [ HH.text industry ]

p2pFeatureCard :: forall w i. String -> String -> Array String -> HH.HTML w i
p2pFeatureCard title description features =
  HH.div
    [ HP.style "background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);"
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
        [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.5rem;"
        ]
        (map featureListItem features)
    ]
  where
    featureListItem feature =
      HH.li
        [ HP.style "display: flex; align-items: center; gap: 0.5rem; color: #32373C; font-size: 0.9rem;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-arrow-right"), HP.style "color: #E60012; font-size: 0.8rem;" ] []
        , HH.span_ [ HH.text feature ]
        ]

scenarioCard :: forall w i. String -> String -> HH.HTML w i
scenarioCard title description =
  HH.div
    [ HP.style "background: white; padding: 1.5rem; border-radius: 8px;"
    ]
    [ HH.h4
        [ HP.style "font-size: 1.1rem; font-weight: 600; margin-bottom: 0.5rem; color: #32373C;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #32373C; font-size: 0.9rem; line-height: 1.4;"
        ]
        [ HH.text description ]
    ]

consultingServiceCard :: forall w i. String -> String -> String -> HH.HTML w i
consultingServiceCard title description price =
  HH.div
    [ HP.style "background: #f8f9fa; padding: 1.5rem; border-radius: 8px; border-left: 4px solid #E60012;"
    ]
    [ HH.h4
        [ HP.style "font-size: 1.2rem; font-weight: 600; margin-bottom: 0.5rem; color: #32373C;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #32373C; margin-bottom: 0.8rem; line-height: 1.4;"
        ]
        [ HH.text description ]
    , HH.div
        [ HP.style "font-size: 1.1rem; font-weight: 600; color: #E60012;"
        ]
        [ HH.text price ]
    ]

processStepCard :: forall w i. String -> String -> String -> HH.HTML w i
processStepCard step title description =
  HH.div
    [ HP.style "display: flex; align-items: flex-start; gap: 1rem; background: #f8f9fa; padding: 1rem; border-radius: 8px;"
    ]
    [ HH.div
        [ HP.style "background: #E60012; color: white; width: 2rem; height: 2rem; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 600; flex-shrink: 0;"
        ]
        [ HH.text step ]
    , HH.div_
        [ HH.h4
            [ HP.style "font-size: 1.1rem; font-weight: 600; margin-bottom: 0.3rem; color: #32373C;"
            ]
            [ HH.text title ]
        , HH.p
            [ HP.style "color: #32373C; font-size: 0.9rem; line-height: 1.4;"
            ]
            [ HH.text description ]
        ]
    ]

pricingCard :: forall w i. String -> String -> Array String -> Boolean -> HH.HTML w i
pricingCard planName price features isPopular =
  HH.div
    [ HP.style $ "background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); position: relative; " <>
        if isPopular then "border: 2px solid #E60012; transform: scale(1.05);" else ""
    ]
    [ if isPopular 
        then HH.div
            [ HP.style "position: absolute; top: -10px; left: 50%; transform: translateX(-50%); background: #E60012; color: white; padding: 0.3rem 1rem; border-radius: 20px; font-size: 0.8rem; font-weight: 600;"
            ]
            [ HH.text "人気" ]
        else HH.div_ []
    , HH.h3
        [ HP.style "font-size: 1.5rem; font-weight: 600; margin-bottom: 0.5rem; color: #32373C; text-align: center;"
        ]
        [ HH.text planName ]
    , HH.div
        [ HP.style "font-size: 2rem; font-weight: 700; color: #E60012; text-align: center; margin-bottom: 1.5rem;"
        ]
        [ HH.text price ]
    , HH.ul
        [ HP.style "list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.8rem;"
        ]
        (map pricingFeatureItem features)
    ]
  where
    pricingFeatureItem feature =
      HH.li
        [ HP.style "display: flex; align-items: center; gap: 0.5rem; color: #32373C;"
        ]
        [ HH.i [ HP.class_ (HH.ClassName "fas fa-check"), HP.style "color: #4caf50;" ] []
        , HH.span_ [ HH.text feature ]
        ]

slaCard :: forall w i. String -> String -> String -> HH.HTML w i
slaCard title value description =
  HH.div
    [ HP.style "background: #f8f9fa; padding: 1.5rem; border-radius: 8px;"
    ]
    [ HH.h4
        [ HP.style "font-size: 1.1rem; font-weight: 600; margin-bottom: 0.5rem; color: #32373C;"
        ]
        [ HH.text title ]
    , HH.div
        [ HP.style "font-size: 1.3rem; font-weight: 700; color: #E60012; margin-bottom: 0.5rem;"
        ]
        [ HH.text value ]
    , HH.p
        [ HP.style "color: #32373C; font-size: 0.9rem; line-height: 1.4;"
        ]
        [ HH.text description ]
    ]

supportLevelCard :: forall w i. String -> String -> String -> HH.HTML w i
supportLevelCard level description availability =
  HH.div
    [ HP.style "background: #f8f9fa; padding: 1.5rem; border-radius: 8px;"
    ]
    [ HH.h4
        [ HP.style "font-size: 1.1rem; font-weight: 600; margin-bottom: 0.5rem; color: #32373C;"
        ]
        [ HH.text level ]
    , HH.p
        [ HP.style "color: #32373C; margin-bottom: 0.5rem; line-height: 1.4;"
        ]
        [ HH.text description ]
    , HH.div
        [ HP.style "font-size: 0.9rem; font-weight: 600; color: #E60012;"
        ]
        [ HH.text availability ]
    ]

contactMethodCard :: forall w i. String -> String -> String -> HH.HTML w i
contactMethodCard title email iconClass =
  HH.div
    [ HP.style "background: rgba(255,255,255,0.1); padding: 1.5rem; border-radius: 12px; backdrop-filter: blur(10px);"
    ]
    [ HH.i [ HP.class_ (HH.ClassName iconClass), HP.style "font-size: 2rem; margin-bottom: 1rem;" ] []
    , HH.h3
        [ HP.style "font-size: 1.2rem; font-weight: 600; margin-bottom: 0.5rem;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "font-size: 1.1rem; opacity: 0.9;"
        ]
        [ HH.text email ]
    ]