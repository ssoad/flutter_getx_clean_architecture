Folder Structure
The project is organized into several folders:

Data
Domain
Presentation
Services
Utils
Each of these folders serves a specific purpose and helps to keep the code organized and maintainable.

1. Data
The Data folder contains the implementation of the repository pattern, including the data sources and models. The Repositories folder provides the interface for accessing the data, while the DataSources folder contains the implementation of data sources like APIs or databases. The Models folder contains the data models used by the application. These models are used to represent data retrieved from APIs or databases and are typically used by the repositories to manage the application's state.

2. Domain
The Domain folder contains the business logic of the application, including the entities, repositories, and use cases. The Entities folder represents the core objects of the application, while the Repositories folder provides the interface for accessing the data. The UseCases folder encapsulate the business rules of the application.

3. Presentation
The Presentation folder contains the UI components of the application, including the Pages, ViewModels, and Widgets. The Pages folder contains the individual screens of the application, while the ViewModels folder contains the classes that handle the business logic of each screen. The Widgets folder contains reusable UI components.

4. Services
The Services folder contains classes and functions that are used throughout the application.

5. Utils
The Utils folder contains utility classes and functions that are used throughout the application.
