module App where

import Prelude

import Icons (iconCode, iconEye, iconGithub)
import Text.Smolder.HTML (Html)
import Text.Smolder.HTML as H
import Text.Smolder.HTML.Attributes as HA
import Text.Smolder.Markup (text, (!))

appView :: forall e. Html e
appView =
  H.div $ do
    H.h3
      $ text "icon with hover transition"
    H.div $ do
      iconCode ! HA.className "icon"
      iconEye ! HA.className "icon"
      iconGithub ! HA.className "icon"
