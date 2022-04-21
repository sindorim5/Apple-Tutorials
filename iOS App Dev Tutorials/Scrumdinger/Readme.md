# SwiftUI Essentials  

## Using Stacks to Arrange Views   

### Supplement Accessibility Data  
* “Skip song. Button.” from VoiceOver
'''swift
var body: some View {
    Button(action: {}) {
        Label("Skip song", systemImage: "forward")
    }
    .accessibilityLabel(Text("Skip song"))
}
'''

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
