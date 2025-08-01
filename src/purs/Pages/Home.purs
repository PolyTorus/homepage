module Pages.Home where

import Prelude
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

-- シンプルなトップページ
homeContent :: forall w i. HH.HTML w i
homeContent =
  HH.div
    [ HP.class_ (HH.ClassName "home-page")
    , HP.style "min-height: 80vh; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding: 2rem;"
    ]
    [ HH.div
        [ HP.style "max-width: 800px; margin: 0 auto;"
        ]
        [ HH.h1
            [ HP.style "font-size: 4rem; font-weight: 800; margin-bottom: 2rem; color: white; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); line-height: 1.2;"
            ]
            [ HH.text "PolyTorus" ]
        , HH.p
            [ HP.style "font-size: 1.5rem; color: rgba(255,255,255,0.9); margin-bottom: 1rem; line-height: 1.6;"
            ]
            [ HH.text "次世代分散システムプラットフォーム" ]
        , HH.p
            [ HP.style "font-size: 1.2rem; color: rgba(255,255,255,0.8); margin-bottom: 4rem; line-height: 1.6;"
            ]
            [ HH.text "革新的な研究開発とエンタープライズソリューションの融合" ]
        , HH.div
            [ HP.class_ (HH.ClassName "page-buttons")
            , HP.style "display: flex; gap: 2rem; justify-content: center; flex-wrap: wrap;"
            ]
            [ HH.div
                [ HP.class_ (HH.ClassName "page-button developers")
                , HP.style $ "padding: 1.5rem 3rem; font-size: 1.2rem; font-weight: 600; " <>
                             "background: linear-gradient(135deg, #667eea, #764ba2); " <>
                             "color: white; border: none; border-radius: 12px; cursor: pointer; " <>
                             "transition: all 0.3s ease; box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);"
                ]
                [ HH.div
                    [ HP.style "display: flex; flex-direction: column; align-items: center; gap: 0.5rem;"
                    ]
                    [ HH.i [ HP.class_ (HH.ClassName "fas fa-code"), HP.style "font-size: 2rem;" ] []
                    , HH.span_ [ HH.text "開発者向け" ]
                    , HH.small [ HP.style "opacity: 0.9; font-weight: 400;" ] [ HH.text "実装詳細・コード構成" ]
                    ]
                ]
            , HH.div
                [ HP.class_ (HH.ClassName "page-button general")
                , HP.style $ "padding: 1.5rem 3rem; font-size: 1.2rem; font-weight: 600; " <>
                             "background: rgba(255,255,255,0.1); color: white; " <>
                             "border: 2px solid rgba(255,255,255,0.3); border-radius: 12px; cursor: pointer; " <>
                             "transition: all 0.3s ease; backdrop-filter: blur(10px);"
                ]
                [ HH.div
                    [ HP.style "display: flex; flex-direction: column; align-items: center; gap: 0.5rem;"
                    ]
                    [ HH.i [ HP.class_ (HH.ClassName "fas fa-users"), HP.style "font-size: 2rem;" ] []
                    , HH.span_ [ HH.text "一般向け" ]
                    , HH.small [ HP.style "opacity: 0.9; font-weight: 400;" ] [ HH.text "プロジェクト概要" ]
                    ]
                ]
            ]
        ]
    ]