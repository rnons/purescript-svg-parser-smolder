module Icons where

import Svg.Renderer.Smolder (icon)
import Text.Smolder.HTML (Html)

foreign import code :: String
foreign import eye :: String
foreign import github :: String

type Icon = forall e. Html e

iconCode :: Icon
iconCode = icon code

iconEye :: Icon
iconEye = icon eye

iconGithub :: Icon
iconGithub = icon github
