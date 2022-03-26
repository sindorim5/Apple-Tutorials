# Framework Integration

## Interfacing with UIKit

### UIPageViewController
* makeUIViewController    
SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.  

* updateUIViewController  
updateUIViewController method calls setViewControllers to provide a view controller for display.  
For now, you create the UIHostingController that hosts the page SwiftUI view on every update. Later, you’ll make this more efficient by initializing the controller only once for the life of the page view controller.

### Create the View Controller’s Data Source
* Coordinator  
The coordinator is a good place to store these controllers, because the system initializes them only once, and before you need them to update the view controller.  
자세한 설명: https://jintaewoo.tistory.com/58  

* Add UIPageViewControllerDataSource conformance to the Coordinator type  
viewControllerBefore, viewControllerAfter: These two methods establish the relationships between view controllers, so that you can swipe back and forth between them.  

### Track the Page in a SwiftUI View’s State
Remember to use the $ syntax to create a binding to a value that is stored as state.  

* pageViewController(_:didFinishAnimating:previousViewControllers:transitionCompleted completed: Bool)  
SwiftUI calls this method whenever a page switching animation completes, you can find the index of the current view controller and update the binding.  

* UIViewRepresentable  
Use the UIViewRepresentable protocol to bridge UIKit views into SwiftUI, not view controllers.

* UIHostingController  
Use the UIHostingController to bridge SwiftUI views into a UIKit view and view controller hierarchy.  

* UIViewControllerRepresentable: bridge UIKit view controllers into SwiftUI  
Create a structure that conforms to UIViewControllerRepresentable and implement the protocol requirements to include a UIViewController in your SwiftUI view hierarchy.

* makeCoordinator() -> Coordinator  
It creates a delegate or data source for a UIViewControllerRepresentable type.  
SwiftUI manages its life cycle and provides it as part of the context parameter in other required methods.  

## Creating a watchOS App  

The watchOS user interface should provide only the most important information onscreen, with quick access to additional information.  
While you can often share views across different platforms, it’s important to be sure that the amount of information a view presents, and the way it presents the information, is suited to the platform.  

### Create a Custom Notification Interface
* WKNotificationScene  
A scene which appears in response to receiving the specified category of remote or local notifications.  

* App / Scene / View  
자세한 설명: https://zeddios.tistory.com/1182  

## Creating a macOS App

Detail view differs enough for macOS that it’s better to create a dedicated view

### Add a Built-in Menu Command
* Commands structure  
자세한 설명: https://swiftwithmajid.com/2020/11/24/commands-in-swiftui/   

### Add a Custom Menu Command
* FocusedValueKey  
A protocol for identifier types used when publishing and observing focused values.  
Unlike EnvironmentKey, FocusedValueKey has no default value requirement, because the default value for a key is always nil.  
FocusedValue and FocusedBinding: https://swiftwithmajid.com/2021/03/03/focusedvalue-and-focusedbinding-property-wrappers-in-swiftui/  

* CommandMenu  

* List(selection: Binding, content: () -> _)  
.tag(item): The tag associates a particular landmark with the given item in the ForEach, which then drives the selection.  
자세한 설명: https://swiftontap.com/view/tag(_:)  

### Add Preferences with a Settings Scene
You communicate the value to the map view, and store it persistently, by using the @AppStorage property wrapper.  

### Why does the Landmarks app define the filteredLandmarks array in a view instead of inside the model?
So the app can easily present different filtered lists in different windows.  
With the filter controls and the filtered array stored in the view, the user can open multiple windows and view the same data filtered in different ways simultaneously.  

### How do you add items to the top level menu for a macOS app?  
Add a commands modifier to a scene in your app, and provide it with a Commands instance.  
Create a top level menu item by creating a Commands structure with a body that contains all of your menu commands, and then use that to configure one of your app’s scenes.  

