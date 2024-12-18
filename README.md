# Patch - Product Feed App

A Flutter application that displays a product feed fetched from Fake Store API. The app allows users to filter products by categories and sort them by price (ascending or descending). It is built using the **BLoC state management pattern**.

**Features:**

- Fetches random products from the API.

- Displays products in a grid view.

- Allows filtering products based on categories fetched from the API.

- Enables sorting products by price in ascending or descending order.

**Screenshots:**

![Screenshot](https://i.postimg.cc/02b46L3j/Simulator-Screenshot-i-Phone-14-Pro-2024-12-18-at-12-38-15.png)

![Screenshot](https://i.postimg.cc/0jL0KHMK/Simulator-Screenshot-i-Phone-14-Pro-2024-12-18-at-12-41-51.png)

**Requirements:**  

Flutter: Version 3.x or later  

Dart: Version 2.x or later  

Ensure Flutter and Dart are installed and properly configured on your system. You can check your versions by running:  
flutter --version  
dart --version  

**Installation**  
1. Clone the Repository
   - git clone https://github.com/viral110/Patch_Technology.git
   - cd product-feed-app
2. Install Dependencies
   - flutter pub get
3. Run the Application
   - flutter run

**Project Structure**  

lib/    
|-- src/                     
|   |-- app/  
|   |   |-- product/  
|   |   |   |-- data/  
|   |   |   |-- domain/  
|   |   |   |-- presentation/  
|   |-- common  
|   |-- routes  
|-- main.dart   # Entry point of the application

**How to Use the App:**

- Launch the app.

- View the product feed displayed in a grid format.

- Use the menu at the top to sort products by:

  - Lowest Price First

  - Highest Price First

- Use the category filter to display products belonging to a specific category.

**Dependencies:**

This app uses the following Flutter packages:

flutter_bloc: For state management

http: For API integration

**Contact:**

For any questions or support, reach out to [viralvegad2001@gmail.com] or open an issue in the repository.

