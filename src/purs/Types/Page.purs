module Types.Page where

import Prelude

data Page
  = Home
  | ForDevelopers  
  | ForGeneral
  | Services
  | ServiceDetail ServiceType

data ServiceType 
  = BaaSPlatform
  | P2PInfra
  | IoTSatelliteSecurity
  | IoTMining
  | Consulting
  | EnterpriseSupport

derive instance eqPage :: Eq Page
derive instance ordPage :: Ord Page
derive instance eqServiceType :: Eq ServiceType
derive instance ordServiceType :: Ord ServiceType

instance showPage :: Show Page where
  show Home = "Home"
  show ForDevelopers = "ForDevelopers"
  show ForGeneral = "ForGeneral"
  show Services = "Services"
  show (ServiceDetail serviceType) = "ServiceDetail_" <> show serviceType

instance showServiceType :: Show ServiceType where
  show BaaSPlatform = "BaaSPlatform"
  show P2PInfra = "P2PInfra"
  show IoTSatelliteSecurity = "IoTSatelliteSecurity"
  show IoTMining = "IoTMining"
  show Consulting = "Consulting"
  show EnterpriseSupport = "EnterpriseSupport"

pageTitle :: Page -> String
pageTitle Home = "PolyTorus"
pageTitle ForDevelopers = "PolyTorus - 開発者向け"
pageTitle ForGeneral = "PolyTorus - 概要"
pageTitle Services = "PolyTorus - サービス"
pageTitle (ServiceDetail serviceType) = "PolyTorus - " <> serviceTypeTitle serviceType

serviceTypeTitle :: ServiceType -> String
serviceTypeTitle BaaSPlatform = "L1ブロックチェーン・BaaSプラットフォーム"
serviceTypeTitle P2PInfra = "P2P通信インフラ"
serviceTypeTitle IoTSatelliteSecurity = "IoT・衛星通信セキュリティ"
serviceTypeTitle IoTMining = "IoTマイニング・分散コンピューティング"
serviceTypeTitle Consulting = "コンサルティング・技術支援"
serviceTypeTitle EnterpriseSupport = "エンタープライズサポート"

pageUrl :: Page -> String
pageUrl Home = "#home"
pageUrl ForDevelopers = "#developers"
pageUrl ForGeneral = "#general"
pageUrl Services = "#services"
pageUrl (ServiceDetail serviceType) = "#service-" <> show serviceType