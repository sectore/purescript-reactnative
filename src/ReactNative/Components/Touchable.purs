module ReactNative.Components.Touchable (
  TouchableWithoutFeedbackProps, TouchableNativeFeedbackProps, TouchableOpacityProps
, TouchableHilightProps, TouchablePropsEx, TouchableNativeBackground
, touchableWithoutFeedback', touchableNativeFeedback', touchableNativeFeedback
, touchableOpacity', touchableHilight'
, selectableBackground, selectableBackgroundBorderless, ripple, canUseNativeForeground
) where

import Prelude
import React (ReactElement)
import ReactNative.Components.View (AccessibilityTraits, AccessibilityType)
import ReactNative.Events (EventHandler, TouchEvent, LayoutEvent)
import ReactNative.PropTypes (Prop, Insets)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (touchableHilightU, touchableNativeFeedbackU, touchableOpacityU, touchableWithoutFeedbackU)

type TouchablePropsEx eff r = {
    accessible :: Boolean
  , accessibilityComponentType :: AccessibilityType
  , accessibilityTraits :: AccessibilityTraits
  , delayLongPress :: Int
  , delayPressIn :: Int
  , delayPressOut :: Int
  , disabled :: Boolean
  , hitSlop :: Insets
  , onLayout :: EventHandler eff LayoutEvent
  , onPress :: EventHandler eff TouchEvent
  , onLongPress :: EventHandler eff TouchEvent
  , onPressIn :: EventHandler eff TouchEvent
  , onPressOut :: EventHandler eff TouchEvent
  , pressRetentionOffset :: Insets
  | r
}

type TouchableWithoutFeedbackProps eff = TouchablePropsEx eff ()

-- | Create a [TouchableWithoutFeedback](https://facebook.github.io/react-native/docs/touchablewithoutfeedback.html) with the given props
touchableWithoutFeedback' :: forall eff. Prop (TouchableWithoutFeedbackProps eff) -> ReactElement -> ReactElement
touchableWithoutFeedback' = touchableWithoutFeedbackU <<< unsafeApplyProps {}

foreign import data TouchableNativeBackground :: *
type TouchableNativeFeedbackProps eff = TouchablePropsEx eff (
    background :: TouchableNativeBackground
  , useForeground :: Boolean
)

-- | Create a [TouchableNativeFeedback](https://facebook.github.io/react-native/docs/touchablenativefeedback.html) with the given onPress handler
touchableNativeFeedback :: forall eff. EventHandler eff TouchEvent -> ReactElement -> ReactElement
touchableNativeFeedback onPress = touchableNativeFeedbackU {onPress}

-- | Create a [TouchableNativeFeedback](https://facebook.github.io/react-native/docs/touchablenativefeedback.html) with the given props
touchableNativeFeedback' :: forall eff. Prop (TouchableNativeFeedbackProps eff) -> ReactElement -> ReactElement
touchableNativeFeedback' = touchableNativeFeedbackU <<< unsafeApplyProps {}

foreign import selectableBackground :: TouchableNativeBackground
foreign import selectableBackgroundBorderless :: TouchableNativeBackground
foreign import ripple :: Color -> Boolean -> TouchableNativeBackground
foreign import canUseNativeForeground :: Boolean

type TouchableOpacityProps eff = TouchablePropsEx eff (
    activeOpacity :: Number
)
-- | Create a [TouchableOpacity](https://facebook.github.io/react-native/docs/touchableopacity.html) with the given props
touchableOpacity' :: forall eff. Prop (TouchableOpacityProps eff) -> ReactElement -> ReactElement
touchableOpacity' = touchableOpacityU <<< unsafeApplyProps {}

type TouchableHilightProps eff = TouchablePropsEx eff (
    activeOpacity :: Number
  , onHideUnderlay :: EventHandler eff TouchEvent
  , onshowUnderlay :: EventHandler eff TouchEvent
  , style :: Styles
  , underlayColor :: Color
)

-- | Create a [TouchableHilight](https://facebook.github.io/react-native/docs/touchablehilight.html) with the given props
touchableHilight' :: forall eff. Prop (TouchableHilightProps eff) -> ReactElement -> ReactElement
touchableHilight' = touchableHilightU <<< unsafeApplyProps {}
