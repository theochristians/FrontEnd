# README: Cartridge Kings UI Implementation

## Project Overview
This project implements a user interface similar to the "Cartridge Kings" website using **Flutter**. The UI consists of navigation, search functionality, and featured product displays, matching the design provided in the reference images.

## Features
1. **Header Navigation**
   - Logo and navigation menu with options: Home, Ink Cartridges, Toner Cartridges, Contact Us, and Login/Register.
   - Search bar.
   - Cart button with item count.

2. **Hero Section**
   - A title prompting users to find the right cartridges for their printers.
   - Tabs for "3-Step Easy Search®" and "Search by Serial Number."
   - Dropdowns to select Printer Brand, Printer Series, and Printer Model.

3. **Featured Products Section**
   - Carousel-style product display.
   - Product cards with image, name, subtitle, price, and an Add to Cart button.

## File Structure
```
assets
|--images
|--json
lib/
|-- main.dart
|-- Page/
|   |-- ContactUsPage/
|   |-- HomePage/
|       |-- HomePageWidget/
|   |-- InkCatridgesPage/
|   |-- LoginPage/
|   |-- MainPage/
|       |-- WidgetMainPage/
|   |-- TonerCatridgesPage/
|-- Model/
```

## Getting Started

### Prerequisites
Ensure the following tools are installed:
- Flutter SDK: [Install Flutter](https://docs.flutter.dev/get-started/install)
- IDE (e.g., VS Code, Android Studio)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/theochristians/FrontEnd.git
   cd FrontEnd
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Assets
- Images are stored in `assets/images/`.
- Dummy JSON data is stored in `assets/json/`.

Update the `pubspec.yaml` file to include assets:
```yaml
flutter:
  assets:
    - assets/images/
    - assets/json/
```

## Key Components

### MainPage
The MainPage widget handles navigation and the app's overall layout. It includes:
- Navigation menu.
- Header with logo, search bar, and cart button.
- Dynamic tab switching for content pages.

### CartridgeSearch
A reusable widget for the search functionality with tabs for "3-Step Easy Search®" and serial number search.

### ProductCard
Displays featured products with the following details:
- Image.
- Title and subtitle.
- Price and discounted price (if applicable).

### HomePage
The homepage integrates the search functionality and product carousel. It loads products dynamically from a JSON file (`dummy_data.json`).

## Features Explained

### Navigation Bar
Implemented with a `Row` widget containing buttons for each menu item. The selected page is highlighted using the `_selectedIndex` variable.

### Hero Section
- **Dropdowns**: Populate dropdowns dynamically from `dummy_data_dropdown.json`.
- **Tabs**: A tab switcher for "3-Step Easy Search®" and "Search by Serial Number."

### Featured Products Carousel
- **Dynamic Data**: Loaded from `dummy_data.json`.
- **Responsive Design**: Adjusts layout based on screen width (e.g., carousel for desktop, vertical stack for mobile).

### Error Handling
Proper error handling is implemented for asset loading (e.g., JSON or images).

## Customization
- Update assets (`assets/images/`) for branding.
- Modify `dummy_data.json` to include your product details.
- Adjust UI colors and fonts in `ThemeData` or specific widgets.

## Troubleshooting
- **Dependencies Issue**: Run `flutter pub get` to ensure all dependencies are installed.
- **UI Rendering Issue**: Ensure the Flutter version matches the project requirements.

## Contribution
Contributions are welcome! Feel free to open issues or submit pull requests.

## License
This project is licensed under the MIT License.

![image](https://github.com/user-attachments/assets/ecb59a67-7695-4139-b0bf-e0500a8bf7f5)


