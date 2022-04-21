# SwiftUI Essentials  

## Using Stacks to Arrange Views   

### Supplement Accessibility Data  
* “Skip song. Button.” from VoiceOver
~~~swift
var body: some View {
    Button(action: {}) {
        Label("Skip song", systemImage: "forward")
    }
    .accessibilityLabel(Text("Skip song"))
}
~~~

VoiceOver reads the systemImage values, so you need to add an accessibility label to describe the element. You don’t have to include “Button” because it’s a trait that VoiceOver already reads.  

# Views  

## Creating a Card View  

### Create a Color Theme  
SwiftUI treats colors as View instances that you can add directly to a view hierarchy.  

# Navigation and Modal Presentation

## Managing Data Flow Between Views

https://developer.apple.com/tutorials/app-dev-training/managing-data-flow-between-views

### Source of Truth
Maintaining multiple copies of information can introduce inconsistencies that lead to bugs in your app.  
To avoid data inconsistency bugs, use a single source of truth for each data element in your app.  
Store the element in one location — the source of truth — and any number of views can access that same piece of data.  
  
You can create sources of truth throughout your code.   
How and where you define each source of truth depends on whether the data is shared among multiple views and whether the data changes.  
  
In Scrumdinger, you’ll establish a source of truth in ScrumdingerApp, which other views will share access to.   

### Swift Property Wrappers
In Swift, a property wrapper encapsulates a common property-initialization pattern, helping you add behaviors to your properties efficiently.  
SwiftUI uses the @State and @Binding property wrappers, among others, to help you maintain a single source of truth for your data.  

* State
When you declare a property as a @State, you create a source of truth within your view.   
The system identifies all elements of a view that depend on the value of a @State property.  
  
User interactions might change your @State property.  
The system renders a new version of the UI by updating any views that depend on that property.   

![스크린샷 2022-04-21 오후 8 24 50](https://user-images.githubusercontent.com/87517193/164448054-a324da30-f92e-4733-8142-144502221ec2.png)  

When a @State property value changes, the system redraws the view using the updated values of the property.  
For example, when a user modifies a scrum in Scrumdinger, ScrumsView redraws the list to show the updated values.   
Because state properties help manage transient states, like the highlight state of a button, filter settings, or a currently selected list item, declare state properties as private and avoid using them for persistent storage.   

The @State property wrapper is SwiftUI syntax for defining a mutable source of truth that’s local to your view structure.   
But what if you want to use the same source of truth in another view in the view hierarchy?   

* Binding
A property that you wrap with @Binding shares read and write access with an existing source of truth, like a @State property.   
A @Binding doesn’t store the data directly.    
Instead, it creates a two-way connection between an existing source of truth and a view that displays and updates that data.   
This connection ensures that multiple views associated with a piece of data are in sync.   

![스크린샷 2022-04-21 오후 8 25 52](https://user-images.githubusercontent.com/87517193/164448215-9ab5fe1a-1111-4341-9c06-227cbc5efd4b.png)

The system establishes dependencies between the data in @State and the child view that contains the @Binding.  
Either the parent or the child view can modify the property that you defined as the source of truth.   
The framework automatically updates both views to reflect these changes.   

In a later tutorial, when you create a view to edit a DailyScrum, you’ll use a binding to edit the scrum. SwiftUI updates the source of truth when the edit view makes changes to the binding.    

### App Architecture
This pattern of using bindings to propagate a single source of truth is effective for any number of levels in a view hierarchy.   

Now that you know how to use @State and @Binding, you’re ready to develop the editing functions of Scrumdinger so that the user can modify scrum details and add new scrums.  
You’ll use bindings to share the mutated state among different screens of the app.   

## Creating the Edit View

### Update the Data Model
* nested type  
자세한 설명: https://zeddios.tistory.com/322  

# Passing Data with Bindings

ScrumdingerApp.swift >>> @State private var scrums = DailyScrum.sampleData   
@Binding in the others   

# State Management  

## Making Classes Observable

https://developer.apple.com/tutorials/app-dev-training/making-classes-observable

### Working with Reference Types
In previous tutorials, you added the @State attribute to a property to identify it as a source of truth,   
but the @State property wrapper works only for value types, such as structures and enumerations.   
SwiftUI provides property wrappers that declare a reference type as a source of truth: @ObservedObject, @StateObject, and @EnvironmentObject.   
To use these property wrappers with your class, you need to make your class observable.   

### Making a Class Observable
You can make a class observable by adopting the ObservableObject protocol.  
_Choose the properties in the class that need to trigger a UI update when they change._     
Then, add the @Published attribute to each of these properties.  

The starter project for the next tutorial includes a ScrumTimer class that keeps time for a daily scrum meeting.  
The class declares several published properties that update frequently during a scrum session.  
ScrumTimer notifies any observers when the values of its published properties change.  

### Monitoring an Object for Changes  
You can tell SwiftUI to monitor an observable object by adding one of the following attributes to the property’s declaration: ObservedObject, StateObject, or EnvironmentObject.   
A view property declared with one of these wrappers creates a new source of truth for your view hierarchy.   

The @StateObject wrapper creates an observable object in a view.   
The system initializes the object when creating the view, and it keeps the object available to use in that view or in other views that you pass the object to.   

Use the @ObservedObject property wrapper to indicate that you passed in an object from another view.   
Because you create the object in another view, you don’t provide an initial value for an ObservedObject.   

Then, you pass an instance of the observable object to the view’s initializer.   

Instead of passing objects into individual views, you can place objects into the environment.    
The environmentObject(\_:) view modifier places an object in the environment in a parent view.   
Any ancestor view can then access the object without an explicit injection chain.   

Then, you can use the @EnvironmentObject property wrapper to access the object in any descendent of the parent view,  
even if intermediate views in the hierarchy don’t have references to the object.   
SwiftUI tracks only a dependency in views that read the data.   

You won’t use @EnvironmentObject in this module, but you can learn more about it, as well as the other property wrappers, by visiting Managing Model Data in Your App.   

### Putting It All Together
You’ve already used a number of tools in SwiftUI to connect data to Scrumdinger’s user interface, and now you also know how to work with reference types.   
In the next article, you’ll learn more about app and view life cycles in SwiftUI.   
Then, you’ll use MeetingTimer to instantiate a @StateObject that observes the published meeting properties.    

## Responding to Events

https://developer.apple.com/tutorials/app-dev-training/responding-to-events

![스크린샷 2022-04-21 오후 8 39 36](https://user-images.githubusercontent.com/87517193/164450347-a644a609-fb83-48c5-84a9-9ade1ce3c79d.png)  

* onAppear(perform:) triggers actions any time the view appears on screen, even if it’s not the first time.  
* onDisappear(perform:) triggers actions when a view disappears from screen.  
* task(priority:_:) triggers actions that execute asynchronously when the view appears on screen.  

### Managing State and Life Cycle

### Add a State Object for a Source of Truth
Wrapping a property as a @StateObject means the view owns the source of truth for the object.    
@StateObject ties the ScrumTimer, which is an ObservableObject, to the MeetingView life cycle.   

# Persistence and Concurrency 

## Persisting Data

### Create a Data Store  
* ObservableObject  
ObservableObject is a class-constrained protocol for connecting external model data to SwiftUI views.  
  
An ObservableObject includes an objectWillChange publisher that emits when one of its @Published properties is about to change.  
Any view observing an instance of ScrumStore will render again when the scrums value changes.     

* FileManager  
자세한 설명: https://leeari95.tistory.com/32  

### Save Data in Inactive State
* @Environment(\\.scenePhase) private var scenePhase  
SwiftUI indicates the current operational state of your app’s Scene instances with a scenePhase Environment value.   

## Adopting New API Features  

### Checking for an Operating System Version  
* #available  
You can execute a piece of code for specific versions of the operating system.  
* @available  
You can mark a function or an entire type as available for a specific operating system using the @available attribute.    

## Adopting Swift Concurrency  

### Calling an Asynchronous Function  
The _await_ keyword allows the system to pause execution of the rest of the function until fetchParticipants() completes.   
You can call an asynchronous function from a synchronous context by creating a _Task_.   
SwiftUI provides a task modifier that you can use to execute an asynchronous function when a view appears.  
The system automatically cancels tasks when a view disappears.  

### Create an Asynchronous Load Method  
* withCheckedThrowingContinuation  
Calling withCheckedThrowingContinuation suspends the load function, then passes a continuation into a closure that you provide.   
A continuation is a value that represents the code after an awaited function.  
* Task  
자세한 설명: https://inuplace.tistory.com/1125

## Handling Errors  
* Task & onAppear 
자세한 설명: https://zeddios.tistory.com/1306  

## Recording Audio   

### Examining Data Flow in Scrumdinger  

The list view automatically embeds itself in a scroll view.  

ListFormatter converts the attendees data into a single, comma-separated string.  
