module He.Template where

import           He.Html (Html, e, ea, ea_)

template :: Html -> Html
template body = unlines
  [ "<!DOCTYPE html>"
  , ea "html" [("lang", "en")] $ unlines [header, e "body" body]]

header :: Html
header = e "head"
  $ unlines
    [ ea_ "link" [("rel", "stylesheet"), ("href", "/styles.css")]
    , ea_ "meta" [("charset", "utf-8")]
    , ea_
        "meta"
        [ ("name", "viewport")
        , ("content", "width=device-width, initial-scale=1")]
    , e "title" "💡 Helium"
    , ea "script" [("type", "module")] mermaidScript]

mermaidScript :: String
mermaidScript =
  "import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';\n\
  \mermaid.initialize({startOnLoad:true});"
