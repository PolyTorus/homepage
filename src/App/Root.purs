module App.Root where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

type State = { }

data Action = Initialize

type Slots = ()

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
    , HP.style "min-height: 100vh; padding: 2rem; background: #f0f0f0;"
    ]
    [ HH.main_
        [ HH.h1 
            [ HP.style "color: #333; font-size: 2rem;" ] 
            [ HH.text "PolyTorus Homepage" ]
        , HH.p 
            [ HP.style "color: #666; font-size: 1.2rem;" ] 
            [ HH.text "Welcome to the PureScript version!" ]
        ]
    ]

handleAction :: forall output. Action -> H.HalogenM State Action Slots output Aff Unit
handleAction = case _ of
  Initialize -> pure unit