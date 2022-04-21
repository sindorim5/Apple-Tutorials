# UIKit Essentials

## Creating a List View

The #if DEBUG flag is a compilation directive that prevents the enclosed code from compiling when you build the app for release.   
You can use this flag for testing code in debug builds — or for providing sample test data, like you’ll do in the next step.    

### View Controller  
* Managing a view hierarchy  
* Updating content in views  
* Responding to events in the user interface  

### Snapshot  
* Represents the state of your data at a specific point in time  
* You can generate the current state of the data and display the data in the user interface by constructing and applying a snapshot.  

# Collection Views and Navigation  

## Adopting Collection Views  

https://developer.apple.com/tutorials/app-dev-training/adopting-collection-views  

### Defining Cell Configurations
UICollectionViewListCell   
* contentConfiguration — Describes the cell’s labels, images, buttons, and more
* backgroundConfiguration — Describes the cell’s background color, gradient, image, and other visual attributes
* configurationState — Describes the cell’s style when the user selects, highlights, drags, or otherwise interacts with it

## Displaying Cell Info  

### Format the Date and Time
<img width="859" alt="스크린샷 2022-04-06 오후 8 10 00" src="https://user-images.githubusercontent.com/87517193/164451862-818b9f94-45bd-470d-ac64-593df59b3baf.png">
  
## Making Reminders Identifiable  

### Wire a Target-Action Pair  
_Target-action_ is a design pattern in which an object holds the information necessary to send a message to another object when an event occurs.  

## Displaying Reminder Details  

### Create a Reminder View  
* UIKit provides compositional layout classes that describe layouts for common applications, such as simple lists, grouped lists, and grids. 
* You’ll display the details of a reminder in a simple list.  
* Swift subclass must call one of its superclass’ designated initializers during initialization.  

### Display the Detail View  
* collectionView(\_:shouldSelectItemAt:)  
You aren’t showing the item that the user tapped as selected, so return false. Instead, you’ll transition to the detail view for that list item.  
* Call the showDetail(for:) method  
* Embed the list view controller in a navigation controller  
The navigation controller acts like a stack, allowing you to push new view controllers on top and pop view controllers off the top.  
Onscreen, when you push a new view controller onto the navigation stack, it slides on top of the previous view from the trailing edge.  
A view popped off the navigation stack slides off to the trailing edge, exposing the original view.  

### Style the Navigation Bar  
* application(\_:didFinishLaunchingWithOptions:)  
Override point for customization after application launch  

# Making Editable Views  

## Getting Ready for Editing   

### Add an Edit Button  
* navigationItem.rightBarButtonItem = editButtonItem  
* Override setEditing(\_:animated:)   

### UICollectionView  
* You have to explicitly choose how you want to implement headers in UICollectionView.  
* Choose .supplementary for the UICollectionLayoutListConfiguration header mode to provide an associated array of header values.   
* Choose .firstItemInSection for the UICollectionLayoutListConfiguration header mode to have the system treat the first item in an array of section data as the header title.  

## Managing Content Views  

https://developer.apple.com/tutorials/app-dev-training/managing-content-views

### Implementing Content Views  
* Ensure the data and view stay synced  
A content view lays out its child views using the content and styling that its configuration property describes.  
A content view applies its configuration when the system first loads it, and it reapplies its configuration any time that the underlying model data changes.  

### Creating a Custom Content View  
To create a custom content view, create a subclass of UIView that conforms to the UIContentView protocol.   
A content view defines its view elements as properties.    

### Creating a Custom Content Configuration
To provide model data to the content view, the content view uses a content configuration helper structure that includes a reminder property.   

* UIContentConfiguration requires  
makeContentView() creates a new instance of the content view using the configuration in which it’s defined.   
updated(for:) creates a unique configuration for a specified cell state, such as selected or highlighted.    
  
Content configuration instances also convey model changes from the user interface back to the model.    

### Configuring Your Custom Content View  
The didSet observer reconfigures the view every time the configuration — including the reminder that it contains — changes,  
ensuring that the view always represents the updated model data.   

## Using Content Views  

### Create a Reusable Layout Function  
Auto Layout determines a view’s neighbors along the horizontal axis using leading and trailing instead of left and right.   
This approach allows Auto Layout to automatically correct a view’s appearance in both right-to-left and left-to-right languages.    

### Create a Custom View with a Text Field    
* The system assigns an intrinsic content size — a width and height determined by what it displays — to every subclass of UIView.  
* UIView subclasses that implement custom initializers must also implement the required init(coder:) initializer.   

### What would you include in a custom content view?  
* An initializer that accepts a configuration helper object and configures its subviews   
* UIKit subviews that you define as properties  
* Code to lay out the subviews of the content view  

## Editing Reminders  

### Make the Text Configuration Editable  
* var onChange: (String)->Void = { \_ in }   
This empty closure holds the behavior that you’d like to perform when the user edits the text in the text field.   

### Observe Changes in a View Hierarchy  
when you pass a closure as an argument, you need to label it as __escaping__ if it’s called after the function returns.   

# Adding, Deleting, and Filtering Reminders  

## Adding and Deleting Reminders  

pushViewController(\_:animated:)
present(\_:animated:completion:)

### Delete a Reminder  
* UISwipeActionsConfiguration
~~~swift
var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
listConfiguration.leadingSwipeActionsConfigurationProvider = { indexPath in
   let flagAction = UIContextualAction(style: .normal, title: "Flag", handler: flagActionHandler)
   flagAction.backgroundColor = .orange
   return UISwipeActionsConfiguration(actions: [flagAction])
}
~~~

## Filtering Reminders  

### Display a Segmented Control  
* Swift automatically assigns an Int raw value for each case, starting at 0.
* __selectedSegmentIndex__: the index number that identifies the selected segment.  
* UISegmentedControl  

### Add Action to Segmented Control  
An enumeration’s raw value initializer returns an optional enumeration case.    

__filter(_:)__  
filter(_:) returns a new collection that contains the elements of the original collection that satisfy the specified condition.  

# Custom Views and Animation    

## Examining Accessibility in Today   

https://developer.apple.com/tutorials/app-dev-training/examining-accessibility-in-today  

## Creating a Progress View  

### Create Relational Constraints  
* UICollectionReusableView  
Instead of deleting views when a user scrolls them out of the visible bounds, the UICollectionReusableView class keeps views in the reuse queue.     
You can use UICollectionReusableView to create supplementary views.    
Supplementary views are separate from the individual collection view cells, so they are ideal for creating headers or footers.     

Assigning true to isActive adds the constraint to the common ancestor in the view hierarchy and activates it.   

### Customize the Appearance of the Progress Circle  
* layoutIfNeeded()  
Forces the view to update its layout immediately by animating the height changes of the upper and lower views.   
* masksToBounds  
Core Animation applies a clipping mask to the CGRect frame that shapes the container view into a circle.   

### Display the Header View  

### Update Progress Dynamically

### Make the Progress View Accessible  
* setNeedsLayout()  
To ensure that the progress state and the view that represents it are always in sync, you’ll update the progress view every time the progress changes.   
Invalidates the current layout of the receiver and triggers a layout update during the next update cycle.    
* isAccessibilityElement  
isAccessibilityElement indicates whether the element is an accessibility element that an assistive technology can access.   
Standard UIKit controls enable this value by default.   

### Supplementary View  
When creating a header or footer view in a collection view.    
Supplementary views display information separate from the individual cells of a collection view.    

### How do you add a supplementary view to a diffable data source?  
By adding a supplementaryViewProvider to the data source.   
supplementaryViewProvider configures and returns a collection view’s supplementary view from a diffable data source.  

## Creating a Gradient Background  

### Create a Gradient Layer  
* CAGradientLayer   
Requirements: Starting and Ending Colors. You can optionally add any number of gradient stops.    
By default, the system draws the colors uniformly across the layer, but you can define specific locations for the gradient stops.    

# System Frameworks  

## Loading Reminders

### Fetch Reminders Asynchronously   
EKEventStore class is an app’s point of contact for accessing calendar and reminder data.    
The _async_ keyword after the function’s parameters indicates that this function can execute asynchronously.    
The _await_ keyword indicates that your task suspends until the continuation resumes.    

### Convert Between Model Types  
EKReminder: A class that represents a reminder in a calendar.    
EventKit provides a unique identifier for all reminders.    

### Create a Reminder Store     
* Singleton  
자세한 설명: https://babbab2.tistory.com/66   

### Read All Reminders  
* predicate  
A definition of logical conditions for constraining a search for a fetch or for in-memory filtering.    
자세한 설명: https://ios-development.tistory.com/592     

The _await_ keyword indicates that your task suspends until the results become available,  
at which point your task resumes and assigns the results to the ekReminders constant.     
  
compactMap(\_:) works as both a filter and a map, allowing you to discard items from the source collection.    

### Request Access to Reminder   
* @unknown default  
Basically works the same as the regular default.   
Dealing with non-frozen enums the @unknown keyword ensures that clients handle any future cases.     

### Display Errors to the User      
Alert controllers disrupt the user experience of an app. Use them only to convey critical information, like errors, to your users.     

Display Reminders  
You must call functions marked as async from within a Task or another asynchronous function.   
By creating a Task, you create a new unit of work that executes asynchronously.     

Saving Reminders    

Respond to Change Notifications
* NotificationCenter.default.addObserver(self, selector: #selector(eventStoreChanged(\_:)), name: .EKEventStoreChanged, object: nil)
addObserver(\_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: String?)    
observer: An object registering as an observer.  
aSelector: A selector that the notification center sends notificationObserver to notify when posting the notification.    
aName: The name of the notification for which to register the observer; that is, only notifications with this name are delivered to the observer.  
       When nil, the notification center doesn’t use a notification’s name to decide whether to deliver it to the observer.    
anObject: The object whose notifications the observer wants to receive; that is, only notifications sent by this sender are delivered to the observer.  
          When nil, the notification center doesn’t use a notification’s sender to decide whether to deliver it to the observer.    

When the system receives this change notification, it calls the corresponding action method on your view controller.   

### Convert Between Model Types       
* .defaultCalendarForNewReminders() -> EKCalendar?
Identifies the calendar that reminders are added to by default, as specified by user settings.      

### Save Reminders Individually   
* @discardableResult   
The @discardableResult attribute instructs the compiler to omit warnings in cases where the call site doesn’t capture the return value.     
* EKEventStore
An object that accesses the user’s calendar events and reminders and supports the scheduling of new events.     

### Save Added Reminders    
The local variable reminder shadows the parameter with the same name. You can’t access the reminder parameter after the variable declaration.    

### Simple way to add an event  notification system to app   
Create an EKReminder with an array of EKAlarm objects.      
Adding an EKReminder object with associated EKAlarm objects is a simple way to integrate with the user’s existing reminders.    




