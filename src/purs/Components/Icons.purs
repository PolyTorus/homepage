module Components.Icons where

import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

-- Font Awesome アイコンコンポーネント
faIcon :: forall w i. String -> HH.HTML w i
faIcon className =
  HH.i
    [ HP.class_ (HH.ClassName className)
    , HP.style "width: 20px; height: 20px; display: inline-flex; align-items: center; justify-content: center;"
    ]
    []

sunIcon :: forall w i. HH.HTML w i
sunIcon = faIcon "fas fa-sun"

moonIcon :: forall w i. HH.HTML w i
moonIcon = faIcon "fas fa-moon"

starIcon :: forall w i. HH.HTML w i
starIcon = faIcon "fas fa-star"

buildingIcon :: forall w i. HH.HTML w i
buildingIcon = faIcon "fas fa-building"

rocketIcon :: forall w i. HH.HTML w i
rocketIcon = faIcon "fas fa-rocket"

bookIcon :: forall w i. HH.HTML w i
bookIcon = faIcon "fas fa-book"

githubIcon :: forall w i. HH.HTML w i
githubIcon = faIcon "fab fa-github"