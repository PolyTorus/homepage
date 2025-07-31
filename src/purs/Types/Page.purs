module Types.Page where

import Prelude

data Page
  = Home
  | ForDevelopers  
  | ForGeneral

derive instance eqPage :: Eq Page
derive instance ordPage :: Ord Page

instance showPage :: Show Page where
  show Home = "Home"
  show ForDevelopers = "ForDevelopers"
  show ForGeneral = "ForGeneral"

pageTitle :: Page -> String
pageTitle Home = "PolyTorus"
pageTitle ForDevelopers = "PolyTorus - 開発者向け"
pageTitle ForGeneral = "PolyTorus - 概要"

pageUrl :: Page -> String
pageUrl Home = "#home"
pageUrl ForDevelopers = "#developers"
pageUrl ForGeneral = "#general"