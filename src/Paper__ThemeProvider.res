module Theme = {
  type t

  module Colors = {
    type t

    @obj
    external make: (
      ~primary: string,
      ~accent: string,
      ~background: string,
      ~surface: string,
      ~error: string,
      ~text: string,
      ~disabled: string,
      ~placeholder: string,
      ~backdrop: string,
    ) => t = ""

    @get external primary: t => string = "primary"
    @get external accent: t => string = "accent"
    @get external background: t => string = "background"
    @get external surface: t => string = "surface"
    @get external error: t => string = "error"
    @get external text: t => string = "text"
    @get external disabled: t => string = "disabled"
    @get external placeholder: t => string = "placeholder"
    @get external backdrop: t => string = "backdrop"
  }

  module Fonts = {
    type t
    type configured

    type font = {
      fontFamily: string,
      fontWeight: string,
    }

    @deriving(abstract)
    type platformFont = {
      regular: font,
      thin: font,
      medium: font,
      light: font,
    }

    @module("react-native-paper")
    external configureFonts: t => configured = "configureFonts"

    @obj
    external make: (~default: platformFont, ~ios: platformFont) => t = ""
  }

  module Animation = {
    type t

    @obj external make: (~scale: float) => t = ""

    @get external scale: t => float = "scale"
  }

  @obj
  external make: (
    ~roundness: int=?,
    ~dark: bool=?,
    ~colors: Colors.t=?,
    ~fonts: Fonts.configured=?,
    ~animation: Animation.t=?,
    unit,
  ) => t = ""

  @get external fonts: t => Fonts.configured = "fonts"
  @get external colors: t => Colors.t = "colors"
  @get external animation: t => Animation.t = "animation"
  @get external dark: t => bool = "dark"
}

@module("react-native-paper") @react.component
external make: (~theme: Theme.t=?, ~children: React.element) => React.element = "ThemeProvider"

@module("react-native-paper")
external defaultTheme: Theme.t = "DefaultTheme"

@module("react-native-paper") external darkTheme: Theme.t = "DarkTheme"

type colors = {
    primary: string,
    accent: string,
    background: string,
    surface: string,
    error: string,
    text: string,
    disabled: string,
    placeholder: string,
    backdrop: string
}

type theme = {
  colors: colors
}

@module("react-native-paper") external useTheme: () => theme = "useTheme"
