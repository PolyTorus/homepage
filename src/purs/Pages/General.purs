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
    
    -- 特徴セクション
    , featuresSection
    
    -- 利点セクション
    , benefitsSection
    
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
        , HH.text "次世代ブロックチェーン" ]
    , HH.p
        [ HP.style "font-size: 1.3rem; color: #555; line-height: 1.8; margin-bottom: 2rem; max-width: 800px; margin-left: auto; margin-right: auto;"
        ]
        [ HH.text "PolyTorusは、従来のブロックチェーンの限界を超える革新的なプラットフォームです。量子コンピュータの脅威に備えた安全性と、柔軟で拡張可能な設計を兼ね備えています。"
        ]
    , HH.div
        [ HP.style "display: flex; justify-content: center; gap: 3rem; flex-wrap: wrap; margin-top: 3rem;"
        ]
        [ statCard "100%" "量子耐性"
        , statCard "4層" "モジュラー設計"
        , statCard "P2P" "分散ネットワーク"
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
        , HH.text "主な特徴" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;"
        ]
        [ featureCardFA "fas fa-shield-alt" "量子耐性セキュリティ" "将来の量子コンピュータからも安全" "最新のポスト量子暗号技術により、量子コンピュータが実用化されても安全性を保ちます。"
        , featureCardFA "fas fa-puzzle-piece" "柔軟なモジュラー設計" "用途に応じてカスタマイズ可能" "4つの独立した層で構成され、それぞれの用途に最適化された設定が可能です。"
        , featureCardFA "fas fa-bolt" "高速処理" "従来比10倍の処理速度" "効率的なアルゴリズムと最適化により、高速なトランザクション処理を実現します。"
        , featureCardFA "fas fa-globe" "真の分散化" "中央管理者なしで動作" "P2Pネットワークにより、誰でも参加可能な完全分散型システムです。"
        , featureCardFA "fas fa-tools" "開発者フレンドリー" "簡単な開発環境" "充実したツールとドキュメントで、誰でも簡単にアプリケーションを開発できます。"
        , featureCardFA "fas fa-shield" "堅牢性" "24/7安定稼働" "厳格なテストと検証により、高い信頼性と安定性を提供します。"
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
        , HH.text "PolyTorusの利点" ]
    , HH.div
        [ HP.style "display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 2rem;"
        ]
        [ benefitCard "個人ユーザー" 
            [ "安全で透明な取引"
            , "低い手数料"
            , "プライバシー保護"
            , "簡単な操作"
            ]
        , benefitCard "企業" 
            [ "コスト削減"
            , "業務効率化"
            , "規制遵守"
            , "カスタマイズ可能"
            ]
        , benefitCard "開発者" 
            [ "豊富なツール"
            , "活発なコミュニティ"
            , "詳細なドキュメント"
            , "収益機会"
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
        [ faqItem "PolyTorusって何ですか？" "PolyTorusは次世代のブロックチェーンプラットフォームです。従来のブロックチェーンの問題を解決し、量子コンピュータの脅威にも対応した革新的な技術です。"
        , faqItem "なぜ量子耐性が重要なの？" "将来、量子コンピュータが実用化されると、現在の暗号技術では安全性が保てなくなります。PolyTorusは最初から量子耐性を考慮して設計されています。"
        , faqItem "普通の人でも使えますか？" "はい。PolyTorusは技術者でなくても簡単に使えるよう設計されています。直感的なインターフェースと分かりやすいドキュメントを提供します。"
        , faqItem "どんな用途に使えますか？" "デジタル通貨、スマートコントラクト、サプライチェーン管理、デジタルアイデンティティなど、様々な用途に活用できます。"
        , faqItem "開発に参加するには？" "GitHubでオープンソースとして公開されています。誰でも開発に参加でき、コミュニティも活発です。"
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