
# Cat Meme Generator App
This project is a SwiftUI-based iOS app that allows users to generate cat-related memes and random cat images. It follows the MVVM (Model-View-ViewModel) architectural pattern for structuring its components.

## MVVM Pattern
MVVM is an architectural pattern that promotes a separation of concerns within an app's components. It divides the app into three main parts:
* Model: Represents the data and business logic of the application.
* View: Represents the UI and how it should be displayed. It is kept as passive as possible and does not contain application logic.
* ViewModel: Acts as a bridge between the Model and View. It holds the presentation logic, handles user interactions, and prepares the data for the View to display.

## Project Flow
* App Entry Point: The CatMemeGeneratorApp struct serves as the entry point of the app. It initializes the AppCoordinator and sets up the main WindowGroup, where the app's content will be displayed.
* AppCoordinator: The AppCoordinator class is responsible for initializing the main components of the app and coordinating their interactions. It starts by creating a HomeCoordinator and a corresponding HomeViewModel instance. The HomeViewModel holds references to the HomeCoordinator and handles navigation.
* HomeView: The main user interface of the app is the HomeView, which displays two buttons: "Cat Meme Generator" and "Random Cat Generator." Each button is linked to a corresponding navigation action that will take the user to a different screen.
* HomeViewModel: The HomeViewModel holds the logic for navigating to the Cat Meme Generator and Random Cat Generator screens. It communicates with the HomeCoordinator to initiate the navigation.
* CatMemeView: This view allows users to generate cat memes by entering text. The user's input is debounced to ensure that network requests are made only after a short delay of inactivity. The CatMemeViewModel handles the UI logic, data binding, and communication with the MemeGeneratorUseCase.
* CatMemeViewModel: The ViewModel for the CatMemeView is responsible for managing user input, sending requests to generate cat memes, and updating the UI with the generated meme images.
* RandomCatView: This view displays random cat images. The user can generate new random images by tapping the "Generate" button. Similar to the Cat Meme View, the CatRandomViewModel handles the UI logic, data binding, and communication with the RandomGeneratorUseCase.
* CatRandomViewModel: The ViewModel for the RandomCatView manages the logic for generating random cat images and updating the UI accordingly.
* Repository: The Repository class abstracts the data source (APIManager) from the use cases. It provides methods for generating meme images and random cat images.
* APIManager: The APIManager handles network requests for generating meme images and random cat images. It uses RxSwift to handle asynchronous operations.
* Use Cases: The MemeGeneratorUseCase and RandomGeneratorUseCase classes encapsulate the business logic for generating meme images and random cat images, respectively. They interact with the Repository to fetch data.
* Coordinator Pattern: The Coordinator pattern is used to handle navigation between different screens.
