-- | A module to convert `SvgNode` to smolder `Html`. Normally you should only
-- | need the `icon` function. See [demo](https://rnons.github.io/purescript-svg-parser-smolder) for an example.
module Svg.Renderer.Smolder
  ( svgElementToHtml
  , svgNodeToHtml
  , parse
  , icon
  ) where

import Prelude

import Data.Bifunctor (lmap)
import Data.Either (Either(..))
import Data.Foldable (foldl, for_)
import Svg.Parser (SvgNode(..), Element, SvgAttribute(..), parseToSvgNode)
import Text.Smolder.HTML (Html)
import Text.Smolder.HTML as H
import Text.Smolder.HTML.Attributes as HA
import Text.Smolder.Markup (Attribute, attribute, text, (!))
import Text.Smolder.SVG as Svg

svgAttributeToProp :: SvgAttribute -> Attribute
svgAttributeToProp (SvgAttribute k v) = attribute k v

svgElementToHtml :: forall e. Element -> Html e
svgElementToHtml ele =
  foldl (!) (Svg.parent ele.name) attrs
    $ for_ ele.children svgNodeToHtml
  where
  attrs = svgAttributeToProp <$> ele.attributes

-- | Convert `SvgNode` to `Html`.
svgNodeToHtml :: forall e. SvgNode -> Html e
svgNodeToHtml (SvgElement element) = svgElementToHtml element
svgNodeToHtml (SvgText str) = text str
svgNodeToHtml (SvgComment str) = text ""

-- | If you don't want to deal with the `SvgNode` type, you can use this function
-- | to parse a `String` as `Html` directly.
parse :: forall e. String -> Either String (Html e)
parse input =
  lmap show $ svgNodeToHtml <$> parseToSvgNode input

icon :: forall e. String -> Html e
icon input =
  case parseToSvgNode input of
    Right (SvgElement element) -> svgElementToHtml element
    _ ->
      H.span
        ! HA.style "color: red;"
        $ text "!SVG Parse Failed!"
