# viper-ios
Implementation of the VIPER pattern with a tic-tac-toe iOS application.

![VIPER pattern](https://github.com/shutdownr/viper-ios/blob/master/Pattern.png)

The VIPER pattern is a more specific implementation of the MVP pattern. It is often used as an alternative to MVC.

### Flow of events in VIPER
1. The user clicks on a button in the View.
2. The View receives the IBAction, forwards the call to the Presenter.
3. The presenter knows what to do after the callback and triggers an update function in the Iterator.
4. The Iterator uses and updates the Entity, that saves the relevant application data. (The update can be asynchronous, with CoreData, ...)
5. After the update is done, the Interactor forwards the new data to the Presenter.
6. The Presenter receives the data and transforms it into View-relevant data. (E.g. Strings for texts, Bool for visibilities, ...)
7. The Presenter sends the formatted data to the View.
8. The View receives the new data and updates correspondingly.

### Role of the router
* Used for navigation between different Views
* Called by the presenter to perform segues whenever needed
* Creates all VIPER classes and references between them, when a new View is created

### Communication between the components
* Protocols are used for every communication step
* E.g. the Presenter contains three communication protocols, to the View, to the Router and to the Interactor
* The router establishes the connections between every class when creating the objects.
