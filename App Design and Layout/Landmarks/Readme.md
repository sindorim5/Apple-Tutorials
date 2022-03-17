# App Design and Layout

## Composing Complex Interfaces

### Create a Category List
* Dictionary(grouping: Sequence, by: (S.Element) -> Key)
``` swift
let array = [[1, 9], [1, 10], [2, 11], [3, 12]]
var dict = Dictionary(grouping: array, by: { $0[0] })
// [3: [[3, 12]], 1: [[1, 9], [1, 10]], 2: [[2, 11]]]
```

### Complete the Category View
* .listRowInsets(EdgeInsets())
Set the edge insets to zero on both kinds of landmark previews so the content can extend to the edges of the display.

### Add Navigation Between Sections
Text that you pass as the label for a navigation link renders using the environment’s accent color, and images may render as template images.

## Working with UI Controls

### Display a User Profile
* static let `default` = Profile(username: "g_kumar")
To use a reserved word as an identifier, put a backtick (`)before and after it. For example, class is not a valid identifier, but `class` is valid. The backticks are not considered part of the identifier; `x` and x have the same meaning.
default is a Swift reserved keyword, that's why backticks are needed.

* .accessibilityLabel(_ labelKey: LocalizedStringKey) -> Text
Use this method to provide an alternative accessibility label to the text that is displayed.
The badge is just a graphic, so the text in HikeBadge along with the accessibilityLabel(_:) modifier make the meaning of the badge clearer to other users.

### Add an Edit Mode
* @Environment(\.editMode) var editMode
SwiftUI provides storage in the environment for values you can access using the @Environment property wrapper. Access the editMode value to read or write the edit scope.

### Difference between a modal and non-modal view presentation?
When you present a view modally, the destination view covers the source view and replaces the current navigation stack.
You present a view modally when you want to break out of your app’s normal flow.

