module App.Root where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Components.Header as Header
import Type.Proxy (Proxy(..))

type State = { }

data Action = Initialize

type Slots = ( header :: forall query. H.Slot query Void Unit )

_header = Proxy :: Proxy "header"

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
    , HP.style "min-height: 100vh; padding-top: 80px;"
    ]
    [ HH.slot_ _header unit Header.component unit
    , HH.main
        [ HP.style "padding: 2rem;" ]
        [ HH.h1_ [ HH.text "PolyTorus Homepage" ]
        , HH.p_ [ HH.text "Welcome to the PureScript version!" ]
        ]
    ]

handleAction :: forall output. Action -> H.HalogenM State Action Slots output Aff Unit
handleAction = case _ of
  Initialize -> pure unit