# Whizpalstech


Requirements
macOS with Xcode 14+
iOS 15.0+
Swift 5.7+


How to Run the App

1. Clone the repository: git clone <repository-url>
2. Open the project: open <ProjectName>.xcodeproj
3. Select a simulator or connected device in Xcode.
4. Press Cmd + R to build and run the app.



Architecture Overview

This project follows the MVVM (Model–View–ViewModel) architecture to ensure clear separation of concerns, testability, and scalability.

MVVM Structure

-> Model
 Handles data structures and API response models.

-> View
     UIKit / SwiftUI views responsible only for UI rendering.
     Observes state changes from the ViewModel.

-> ViewModel
    Contains business logic and presentation logic.
    Exposes observable properties for the View.
    Communicates with services via protocols.

-> Why MVVM?
    Keeps UI logic out of ViewControllers
    Improves testability
    Easier maintenance as the app grows

Dependency Injection
The project uses Dependency Injection (DI) to decouple components.

-> Approach
    Protocol-oriented services (e.g. NetworkServiceProtocol)
    Dependencies are injected via initializers
    Mock services are used for unit testing

-> Benefits
    Loose coupling
    Easier unit testing
    Flexible swapping of implementations



Async/Await
Modern Swift async/await is used for asynchronous operations such as network calls.

-> Why async/await?
    Cleaner, more readable code
    Avoids callback nesting
    Safer concurrency handling
