module Pages.ServiceDetail where

import Prelude
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.HTML.Events as HE
import Store.Theme as Theme
import Types.Page as Page

-- サービス詳細ページ
serviceDetailContent :: forall w i. Theme.ThemeState -> Page.ServiceType -> (Page.Page -> i) -> HH.HTML w i
serviceDetailContent theme serviceType onNavigate =
  HH.div
    [ HP.class_ (HH.ClassName "service-detail-page")
    , HP.style "padding: 2rem; max-width: 1200px; margin: 0 auto;"
    ]
    [ -- パンくずリスト
      breadcrumb onNavigate serviceType
    
    , HH.h1
        [ HP.style $ "font-size: 3rem; font-weight: 700; margin-bottom: 2rem; color: " <> theme.color <> "; text-align: center;"
        ]
        [ HH.text $ Page.serviceTypeTitle serviceType ]
    
    , case serviceType of
        Page.BaaSPlatform -> baasDetailContent
        Page.P2PInfra -> p2pDetailContent
        Page.IoTSatelliteSecurity -> iotSecurityDetailContent
        Page.IoTMining -> iotMiningDetailContent
        Page.Consulting -> consultingDetailContent
        Page.EnterpriseSupport -> enterpriseSupportDetailContent
    ]

-- パンくずリスト
breadcrumb :: forall w i. (Page.Page -> i) -> Page.ServiceType -> HH.HTML w i
breadcrumb onNavigate serviceType =
  HH.nav
    [ HP.class_ (HH.ClassName "breadcrumb")
    , HP.style "margin-bottom: 2rem; padding: 1rem; background: rgba(255,255,255,0.9); border-radius: 8px;"
    ]
    [ HH.div
        [ HP.style "display: flex; align-items: center; gap: 0.5rem; font-size: 0.9rem; color: #32373C;"
        ]
        [ HH.a
            [ HP.style "color: #0095d9; text-decoration: none; cursor: pointer;"
            , HE.onClick \_ -> onNavigate Page.Home
            ]
            [ HH.text "ホーム" ]
        , HH.span_ [ HH.text " > " ]
        , HH.a
            [ HP.style "color: #0095d9; text-decoration: none; cursor: pointer;"
            , HE.onClick \_ -> onNavigate Page.Services
            ]
            [ HH.text "サービス" ]
        , HH.span_ [ HH.text " > " ]
        , HH.span
            [ HP.style "color: #32373C;"
            ]
            [ HH.text $ Page.serviceTypeTitle serviceType ]
        ]
    ]

-- BaaSプラットフォーム詳細
baasDetailContent :: forall w i. HH.HTML w i
baasDetailContent =
  HH.div_
    [ HH.section
        [ HP.style "background: rgba(230,0,18,0.05); padding: 3rem; border-radius: 16px; margin-bottom: 3rem; border-left: 4px solid #E60012;"
        ]
        [ HH.h2
            [ HP.style "font-size: 2rem; font-weight: 600; color: #E60012; margin-bottom: 1.5rem;"
            ]
            [ HH.text "企業向けカスタムブロックチェーンソリューション" ]
        , HH.p
            [ HP.style "font-size: 1.2rem; color: #32373C; line-height: 1.6; margin-bottom: 2rem;"
            ]
            [ HH.text "PolyTorusのBaaS（Blockchain as a Service）プラットフォームは、企業のデジタル変革を支援する包括的なブロックチェーンソリューションです。従来のブロックチェーンの制約を超える革新的な技術で、お客様のビジネス要件に最適化されたカスタムソリューションを提供します。" ]
        ]
    
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 3rem;"
        ]
        [ featureCard "カスタムブロックチェーン構築"
            "お客様の要件に合わせたブロックチェーンネットワークを構築"
            [ "CRDT による分散合意"
            , "WebRTC ネイティブ通信"
            , "モジュラー設計"
            , "高スループット処理"
            ]
        , featureCard "スマートコントラクト開発"
            "ビジネスロジックを自動化するスマートコントラクト"
            [ "Rust/WASM 実装"
            , "形式検証対応"
            , "ガス効率最適化"
            , "セキュリティ監査付き"
            ]
        , featureCard "API・SDK提供"
            "開発者フレンドリーな統合インターフェース"
            [ "REST API"
            , "GraphQL対応"
            , "多言語SDK"
            , "詳細ドキュメント"
            ]
        ]
    
    , pricingSection "BaaSプラットフォーム" "月額 ¥200,000〜" 
        [ "基本プラットフォーム利用料"
        , "カスタマイズ開発費別途"
        , "初期設定・導入支援込み"
        , "24/7技術サポート"
        ]
    ]

-- P2P通信インフラ詳細
p2pDetailContent :: forall w i. HH.HTML w i
p2pDetailContent =
  HH.div_
    [ HH.section
        [ HP.style "background: rgba(0,149,217,0.05); padding: 3rem; border-radius: 16px; margin-bottom: 3rem; border-left: 4px solid #0095d9;"
        ]
        [ HH.h2
            [ HP.style "font-size: 2rem; font-weight: 600; color: #0095d9; margin-bottom: 1.5rem;"
            ]
            [ HH.text "WebRTCベースの分散通信プラットフォーム" ]
        , HH.p
            [ HP.style "font-size: 1.2rem; color: #32373C; line-height: 1.6; margin-bottom: 2rem;"
            ]
            [ HH.text "中央サーバーに依存しない真の分散通信インフラを提供します。WebRTC技術をベースに、NAT越え、帯域幅最適化、高可用性を実現し、従来のクライアント・サーバーモデルの限界を超えた次世代通信基盤を構築します。" ]
        ]
    
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 3rem;"
        ]
        [ featureCard "P2Pネットワーク構築"
            "自律分散型ネットワークの設計・構築"
            [ "ピアディスカバリー"
            , "ルーティング最適化"
            , "負荷分散"
            , "自動故障復旧"
            ]
        , featureCard "NAT越え自動処理"
            "ファイアウォール・NAT環境での接続確立"
            [ "STUN/TURNサーバー"
            , "ICE候補収集"
            , "接続性テスト"
            , "フォールバック機構"
            ]
        , featureCard "帯域幅最適化"
            "効率的なデータ転送とリソース管理"
            [ "適応的ビットレート"
            , "データ圧縮"
            , "優先度制御"
            , "QoS保証"
            ]
        ]
    
    , pricingSection "P2P通信インフラ" "月額 ¥100,000〜"
        [ "基本インフラ利用料"
        , "トラフィック従量課金"
        , "技術サポート込み"
        , "SLA 99.9%保証"
        ]
    ]

-- IoT・衛星通信セキュリティ詳細
iotSecurityDetailContent :: forall w i. HH.HTML w i
iotSecurityDetailContent =
  HH.div_
    [ HH.section
        [ HP.style "background: rgba(0,149,217,0.05); padding: 3rem; border-radius: 16px; margin-bottom: 3rem; border-left: 4px solid #0095d9;"
        ]
        [ HH.h2
            [ HP.style "font-size: 2rem; font-weight: 600; color: #0095d9; margin-bottom: 1.5rem;"
            ]
            [ HH.text "no_std実装による軽量セキュリティソリューション" ]
        , HH.p
            [ HP.style "font-size: 1.2rem; color: #32373C; line-height: 1.6; margin-bottom: 2rem;"
            ]
            [ HH.text "リソース制約のあるIoTデバイスや衛星通信環境で動作する、世界初のno_std実装による耐量子暗号化ソリューション。従来不可能だった組み込み環境での本格的なセキュリティ機能を実現します。" ]
        ]
    
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 3rem;"
        ]
        [ featureCard "組み込み耐量子暗号"
            "量子コンピューター攻撃に対する長期セキュリティ"
            [ "格子暗号実装"
            , "8KB〜64KBメモリ対応"
            , "リアルタイム処理"
            , "低消費電力設計"
            ]
        , featureCard "衛星通信プラットフォーム"
            "宇宙空間でのセキュア通信基盤"
            [ "軌道上データ処理"
            , "地上局セキュア接続"
            , "放射線耐性設計"
            , "深宇宙通信対応"
            ]
        , featureCard "産業IoTセキュリティ"
            "工場・インフラ向けセキュリティ統合"
            [ "制御システム保護"
            , "異常検知・分析"
            , "ゼロトラスト実装"
            , "コンプライアンス対応"
            ]
        ]
    
    , pricingSection "IoT・衛星通信セキュリティ" "月額 ¥50,000〜"
        [ "デバイス数課金制"
        , "セキュリティ更新込み"
        , "導入・設定支援"
        , "24/7監視サービス"
        ]
    ]

-- IoTマイニング詳細
iotMiningDetailContent :: forall w i. HH.HTML w i
iotMiningDetailContent =
  HH.div_
    [ HH.section
        [ HP.style "background: rgba(230,0,18,0.05); padding: 3rem; border-radius: 16px; margin-bottom: 3rem; border-left: 4px solid #E60012;"
        ]
        [ HH.h2
            [ HP.style "font-size: 2rem; font-weight: 600; color: #E60012; margin-bottom: 1.5rem;"
            ]
            [ HH.text "IoTデバイスを活用した新しい収益モデル" ]
        , HH.p
            [ HP.style "font-size: 1.2rem; color: #32373C; line-height: 1.6; margin-bottom: 2rem;"
            ]
            [ HH.text "世界460億台のIoTデバイスの余剰リソースを活用し、新しい収益創出機会を提供します。no_std実装により、従来不可能だったリソース制約環境でのブロックチェーンマイニングを実現し、デバイス費用の20-50%の追加収益を創出します。" ]
        ]
    
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 3rem;"
        ]
        [ featureCard "デバイスマイニングプール"
            "組み込み機器による分散マイニング"
            [ "マイクロコントローラー対応"
            , "省電力最適化"
            , "自動負荷分散"
            , "リアルタイム収益分配"
            ]
        , featureCard "エッジコンピューティング"
            "エッジデバイスの余剰リソース活用"
            [ "CPU・GPU・FPGA対応"
            , "動的リソース配分"
            , "業務負荷協調動作"
            , "収益最大化AI"
            ]
        , featureCard "産業IoT統合"
            "工場・インフラ設備での副次収益"
            [ "製造装置組み込み"
            , "スマートグリッド連携"
            , "予知保全統合"
            , "ESG対応"
            ]
        ]
    
    , pricingSection "IoTマイニング・分散コンピューティング" "月額 ¥10,000〜"
        [ "デバイス数段階料金"
        , "収益シェア方式"
        , "初期設定無料"
        , "ROI 6-24ヶ月保証"
        ]
    ]

-- コンサルティング詳細
consultingDetailContent :: forall w i. HH.HTML w i
consultingDetailContent =
  HH.div_
    [ HH.section
        [ HP.style "background: rgba(50,55,60,0.05); padding: 3rem; border-radius: 16px; margin-bottom: 3rem; border-left: 4px solid #32373C;"
        ]
        [ HH.h2
            [ HP.style "font-size: 2rem; font-weight: 600; color: #32373C; margin-bottom: 1.5rem;"
            ]
            [ HH.text "ブロックチェーン・P2P技術の専門コンサルティング" ]
        , HH.p
            [ HP.style "font-size: 1.2rem; color: #32373C; line-height: 1.6; margin-bottom: 2rem;"
            ]
            [ HH.text "最新の分散システム技術に精通した専門エンジニアチームが、お客様のDX戦略立案から実装まで包括的にサポート。研究開発で培った深い技術知見を活用し、最適なソリューション設計をご提案します。" ]
        ]
    
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 3rem;"
        ]
        [ featureCard "アーキテクチャ設計支援"
            "最適なシステム設計の立案・評価"
            [ "要件定義・分析"
            , "技術選定支援"
            , "性能・コスト評価"
            , "移行戦略策定"
            ]
        , featureCard "セキュリティ監査"
            "包括的なセキュリティ評価・改善"
            [ "脆弱性診断"
            , "ペネトレーションテスト"
            , "コード監査"
            , "改善提案・実装"
            ]
        , featureCard "開発チーム育成"
            "内製化に向けた人材育成支援"
            [ "技術研修・トレーニング"
            , "メンタリング"
            , "ベストプラクティス共有"
            , "開発プロセス改善"
            ]
        ]
    
    , pricingSection "コンサルティング・技術支援" "月額 ¥500,000〜"
        [ "専門エンジニア稼働"
        , "プロジェクト成果責任"
        , "定期レポート・提案"
        , "緊急対応サポート"
        ]
    ]

-- エンタープライズサポート詳細
enterpriseSupportDetailContent :: forall w i. HH.HTML w i
enterpriseSupportDetailContent =
  HH.div_
    [ HH.section
        [ HP.style "background: rgba(50,55,60,0.05); padding: 3rem; border-radius: 16px; margin-bottom: 3rem; border-left: 4px solid #32373C;"
        ]
        [ HH.h2
            [ HP.style "font-size: 2rem; font-weight: 600; color: #32373C; margin-bottom: 1.5rem;"
            ]
            [ HH.text "24/7サポートとSLA保証" ]
        , HH.p
            [ HP.style "font-size: 1.2rem; color: #32373C; line-height: 1.6; margin-bottom: 2rem;"
            ]
            [ HH.text "ミッションクリティカルなシステムの安定運用を支える包括的なエンタープライズサポート。専任エンジニアの配属から緊急対応まで、お客様のビジネス継続性を最優先にした手厚いサポート体制を提供します。" ]
        ]
    
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 3rem;"
        ]
        [ featureCard "専任エンジニア配属"
            "お客様専用の技術支援チーム"
            [ "シニアエンジニア常駐"
            , "システム熟知専門家"
            , "定期的な健康診断"
            , "改善提案・実装"
            ]
        , featureCard "緊急対応・障害復旧"
            "24時間365日の緊急対応体制"
            [ "即座の障害対応"
            , "根本原因分析"
            , "復旧作業実施"
            , "再発防止策立案"
            ]
        , featureCard "カスタム開発対応"
            "お客様固有要件への柔軟な開発対応"
            [ "機能拡張開発"
            , "外部システム連携"
            , "性能チューニング"
            , "セキュリティ強化"
            ]
        ]
    
    , pricingSection "エンタープライズサポート" "月額 ¥300,000〜"
        [ "SLA 99.99%保証"
        , "専任エンジニア配属"
        , "緊急対応1時間以内"
        , "カスタム開発別途見積"
        ]
    ]

-- 機能カード
featureCard :: forall w i. String -> String -> Array String -> HH.HTML w i
featureCard title description features =
  HH.div
    [ HP.style "background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);"
    ]
    [ HH.h3
        [ HP.style "font-size: 1.3rem; font-weight: 600; color: #32373C; margin-bottom: 1rem;"
        ]
        [ HH.text title ]
    , HH.p
        [ HP.style "color: #32373C; opacity: 0.8; margin-bottom: 1.5rem; line-height: 1.6;"
        ]
        [ HH.text description ]
    , HH.ul
        [ HP.style "list-style: none; padding: 0; margin: 0;"
        ]
        (map (\feature -> 
          HH.li
            [ HP.style "display: flex; align-items: center; margin-bottom: 0.5rem;"
            ]
            [ HH.i [ HP.class_ (HH.ClassName "fas fa-check"), HP.style "color: #E60012; margin-right: 0.5rem; font-size: 0.8rem;" ] []
            , HH.span [ HP.style "color: #32373C; font-size: 0.9rem;" ] [ HH.text feature ]
            ]
        ) features)
    ]

-- 料金セクション
pricingSection :: forall w i. String -> String -> Array String -> HH.HTML w i
pricingSection _ pricing details =
  HH.section
    [ HP.style "background: linear-gradient(135deg, rgba(230,0,18,0.1), rgba(0,149,217,0.05)); padding: 2.5rem; border-radius: 12px; text-align: center;"
    ]
    [ HH.h3
        [ HP.style "font-size: 1.8rem; font-weight: 600; color: #32373C; margin-bottom: 1rem;"
        ]
        [ HH.text "料金プラン" ]
    , HH.div
        [ HP.style "font-size: 2rem; font-weight: 700; color: #E60012; margin-bottom: 1.5rem;"
        ]
        [ HH.text pricing ]
    , HH.ul
        [ HP.style "list-style: none; padding: 0; margin: 0 auto; max-width: 400px;"
        ]
        (map (\detail -> 
          HH.li
            [ HP.style "color: #32373C; margin-bottom: 0.5rem; font-size: 0.95rem;"
            ]
            [ HH.text ("• " <> detail) ]
        ) details)
    , HH.div
        [ HP.style "margin-top: 2rem;"
        ]
        [ HH.p
            [ HP.style "color: #32373C; opacity: 0.8; font-size: 0.9rem;"
            ]
            [ HH.text "詳細なお見積りやご相談は、お気軽にお問い合わせください。" ]
        ]
    ]