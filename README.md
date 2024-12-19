# EDUTIK Flutter App Development Project

Welcome to the EDUTIK App project! This README serves as a comprehensive developer reference to help you get started with our clean architecture using GetX.

## Project Structure

The project follows a feature-based folder structure for scalability and maintainability. All features are stored inside the `lib/src/features/` directory.

### Folder Structure
```py
lib/ 
    │
    ├── src/
    │   └── features/
    |       └── <feature_name>/ 
    |           ├── a/              # Application Layer 
    |           │   └── <feature_name>-binding.dart 
    |           ├── da/             # Data Layer 
    |           │   ├── models/             # Freezed Models 
    |           │   └── repo/               # Repository Implementations 
    |           ├── do/             # Domain Layer 
    |           │   ├── repo/               # Abstract Repositories 
    |           │   └── entities/           # Domain Entities 
    |           └── p/              # Presentation Layer 
    |               ├── pages/              # UI Pages 
    |               ├── controllers/        # GetX Controllers 
    |               └── widgets/            # Reusable Widgets 
    ├── utils/ 
    │   ├── database/ 
    │   │   └── database_service.dart 
    │   │   └── <different-db>_service.dart 
    │   └── initial_bindings.dart 
    └── main.dart
```


### Folder Details

- **a (Application Layer)**
  - Contains the `<feature_name>-binding.dart` file, which extends `Bindings` from GetX and lazily puts the `<feature_name>-controller` from `<feature_name>/p/controllers/` directory.

- **da (Data Layer)**
  - **models/**: Contains Freezed models extending respective entities from the `do` folder.
  - **repo/**: Contains repository implementations from `do` repositories.

- **do (Domain Layer)**
  - **repo/**: Contains abstract repositories.
  - **entities/**: Contains domain entities.

- **p (Presentation Layer)**
  - **pages/**: Contains UI pages.
  - **controllers/**: Contains GetX controllers.
  - **widgets/**: Contains reusable widgets.

### Data Sources

Data sources are managed in the `lib/utils/database/` directory. The main file is `database_service.dart`, an abstract class `DatabaseService`, which can be extended for various implementations like dummy, JSON, Firebase, Supabase, and more.

### Initial Bindings

All repository implementations are initialized in `lib/utils/initial_bindings.dart` using the following code:

```dart
Get.put<FeatureRepository>(
    FeatureRepositoryImpl(Get.find<DatabaseService>()),
);
```


## Getting Started
### Prerequisites
* Flutter SDK
* GetX package
* Other dependencies as listed in pubspec.yaml

### Setting Up the Project
1. Clone the repository.
2. Run flutter pub get to fetch the dependencies.
3. Configure your preferred database service in database_service.dart.
4. Start developing new features following the existing folder structure.

### Adding a New Feature
1. Create a new folder inside lib/src/features/ with the name of the feature.
2. Add the following subfolders: a/, da/, do/, and p/.
3. Follow the existing pattern to add the necessary files for bindings, models, repositories, entities, pages, controllers, and widgets.
4. Register the feature's repository in initial_bindings.dart.

### Contribution Guidelines
* Follow the clean architecture principles.
* Use GetX for state management and dependency injection.
* Keep your code DRY (Don't Repeat Yourself).
* Write unit tests for your features and bug fixes.
* Follow the project's coding standards and best practices.

### Documentation
* Ensure all public methods and classes are documented.
* Keep the README updated with any new features or changes.

### Support
For any questions or issues, please contact the project maintainer.

Happy coding! Let's build an amazing app together!


This README provides a clear and organized reference for developers joining our project, ensuring they understand the architecture and can start contributing effectively. Let me know if you need any more details or adjustments! 😊