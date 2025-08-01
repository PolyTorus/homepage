module Types.Page where

import Prelude

data Page
  = Home
  | ForDevelopers  
  | ForGeneral
  | Services

derive instance eqPage :: Eq Page
derive instance ordPage :: Ord Page

instance showPage :: Show Page where
  show Home = "Home"
  show ForDevelopers = "ForDevelopers"
  show ForGeneral = "ForGeneral"
  show Services = "Services"

pageTitle :: Page -> String
pageTitle Home = "PolyTorus"
pageTitle ForDevelopers = "PolyTorus - 開発者向け"
pageTitle ForGeneral = "PolyTorus - 概要"
pageTitle Services = "PolyTorus - サービス"

pageUrl :: Page -> String
pageUrl Home = "#home"
pageUrl ForDevelopers = "#developers"
pageUrl ForGeneral = "#general"
pageUrl Services = "#services"