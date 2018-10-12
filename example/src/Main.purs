module Main where

import Prelude

import App (appView)
import Data.Foldable (traverse_)
import Effect (Effect)
import Text.Smolder.Renderer.DOM as DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument as HTMLDocument
import Web.HTML.HTMLElement as HTMLElement
import Web.HTML.Window as Window

main :: Effect Unit
main = do
  htmlDocument <- window >>= Window.document
  let doc = HTMLDocument.toDocument htmlDocument
  HTMLDocument.body htmlDocument >>= traverse_ \body -> do
    DOM.render (HTMLElement.toElement body) appView
