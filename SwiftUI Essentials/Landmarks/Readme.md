SwiftUI Essentials

#Creating And Combining Views

##VStack, HStack, Spacer, padding 등 기본적인 키워드.

##Custom Image View (CircleImage.swift) 만들기.

###MapKit 불러오기.
* @State: Use the @State attribute to establish a source of truth for data in your app that you can modify from more than one view. 
* Binding: prefixing a state variable with $, you pass a binding, which is like a reference to the underlying value. 

.ignoreSafeArea(edges: .top)

#Building Lists And Navigation

##Create a Model, Loading JSON data.

##Create a List.
* Lists work with identifiable data.
* Place a ForEach instance inside a List or other container type to create a dynamic list.

##Navigation Between List and Detail.
* NavigationLink
* Pass Data into Child Views.

.previewDevice(PreviewDevice(rawValue: deviceName))

#Handling User Input

##Filter the List View
* @State private var showFavoritesOnly
Use state properties to hold information that’s specific to a view and its subviews, you always create state as private.
* Toggle(isOn: Binding<Bool>, label: () -> Label)

##Observable Object for Storage
* Combine framework
이벤트 처리 연산자들을 통해 비동기 이벤트들을 핸들링 할 수 있게 하는 것.
자세한 설명: https://brunch.co.kr/@tilltue/65

* final class: final 키워드의 추가?
더 이상 해당 클래스에서 하위 클래스로의 전체 클래스 또는 일부 (메서드, 프로퍼티)가 상속 또는 상속에 따른 재정의가 될 필요가 없다고 판단한 경우 final 키워드를 각 요소 앞에 추가함으로써 상속을 방지할 수 있다. final로 선언된 요소들은 직접 호출하는 반면, 그렇지 않은 요소들은 vtable을 통해 간접 호출되어 직접 호출되는 경우보다 느리게 작동한다.
final 키워드가 적용된 메서드는 컴파일 시점에 어떤 메서드를 실행할지 결정할 수 있으므로 성능 상 이점을 가진다.
( https://velog.io/@ryan-son/Swift-final-%ED%82%A4%EC%9B%8C%EB%93%9C-%EC%99%9C-%EC%82%AC%EC%9A%A9%ED%95%98%EB%8A%94%EA%B1%B8%EA%B9%8C )

* @Published
An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.

##Adopt the Model Object in Your Views
* @EnvironmentObject
A property wrapper type for an observable object supplied by a parent or ancestor view. An environment object invalidates the current view whenever the observable object changes. Use this attribute in views that are lower down in the view hierarchy to receive data from views that are higher up.

* .environmentObject(_:)
 Apply this modifier so that views further down in the view hierarchy can read data objects passed down through the environment.

* @StateObject
A property wrapper type that can observable object. Use the @StateObject attribute to initialize a model object for a given property “only once” during the life time of the app.

(https://medium.com/hcleedev/swift-observedobject%EC%99%80-stateobject-4f851ed9ef0d)

##Create a Favorite Button for Each Landmark
* @Binding var isSet: Bool
Because you use a binding, changes made inside this view propagate back to the data source. Binding controls the storage for a value, so you can pass data around to different views that need to read or write it.
