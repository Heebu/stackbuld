## Product Catalog App (Test Task) - README.md

**Introduction**

This is a Flutter application showcasing a product catalog with browse, view details, filter, and
CRUD (Create, Read, Update, Delete) functionalities for products. This app serves as a test task
demonstrating key Flutter concepts, clean coding practices, and performance optimization.

**Features**

* **Product List:** Browse a scrollable list of products with basic information like name and image.
* **Product Details:** View detailed information for a selected product, including name,
  description, price, images, etc. (Customize as needed)
* **Filtering:** Filter products by category price range, size, color and item type.
* **Filtering:** search implementation also added .
* **CRUD Operations:**
    * **Create:** Add new products to the catalog. (Implement UI and logic for adding products)
    * **Read:** View existing products in the list and details view.
    * **Update:** Edit existing product details. (Implement UI and logic for editing products)
    * **Delete:** Remove products from the catalog. (Implement UI and logic for deleting products)

**Technical Stack**

* **Flutter:** Cross-platform mobile app framework
* **Dependencies (list specific dependencies used):**
    * e.g., Stack (for state management)
    * e.g., Firebase firestore (for database, if applicable)

**Project Structure**

(Provide a brief overview of the project directory structure, highlighting key folders and their
purpose)

* **lib/**: Core application code.
    * **models/**: Data models representing products and related entities .
    * **viewModel/**: connects the view to the models.
    * **view/**: the main interface of the app.
    * **services/**: Services for data fetching, and product management logic.
    * **Core/**: Reusable UI components for product list, app details, routes, details, filters,
      etc.
    * **main.dart**: Application entry point.
    * **firebase_optiont**: from firebase to pick from which platform its running on.

**Running the App**

1. Ensure you have Flutter
   installed ([https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)).
2. Clone this repository.
3. Run `flutter pub get` to download dependencies.
4. Run `flutter run` to launch the app on a connected device or emulator.

**Credits to the Design **
https://dribbble.com/shots/24095196-Fashion-E-Commerce-App