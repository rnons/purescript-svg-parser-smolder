# purescript-svg-parser-smolder

<a href="https://pursuit.purescript.org/packages/purescript-svg-parser-smolder">
  <img src="https://pursuit.purescript.org/packages/purescript-svg-parser-smolder/badge"
       alt="purescript-svg-parser-smolder on Pursuit">
  </img>
</a>

A library to inline SVG string into smolder views.

See [Demo](https://rnons.github.io/purescript-svg-parser-smolder) for an example.

## How to use

```purescript
import Svg.Renderer.Smolder (icon)

-- | You can use FFI and webpack raw-loader to load external SVG files
code :: String
code = """<svg xmlns="http://www.w3.org/2000/svg" width="14" height="16" viewBox="0 0 14 16"><path fill-rule="evenodd" d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"/></svg>"""

type Icon = forall e. HTML e

iconCode :: Icon
iconCode = icon code
```

It's as simple as this, in most cases you only need the `icon` function. You can then use `iconCode` in your view, you can also apply additional className to it.


```purescript
import Text.Smolder.HTML.Attributes as HA
import Text.Smolder.Markup ((!))

view =
  iconCode ! HA.className "icon"
```
