# ecommerceapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# E-Commerce Flutter App

An **E-Commerce application** built using **Flutter** with features like infinite scrolling, product search, sorting, filtering, authentication, and cart functionality. 

## Features
✅ Display products with images, prices, and descriptions.  
✅ Infinite scrolling for seamless browsing.  
✅ Sorting (Low to High, High to Low).  
✅ Product Search & Filtering options.  
✅ Shopping Cart functionality.  
✅ API Integration with **FakeStoreAPI**.  

## Installation

Follow these steps to install and run the project locally.

### 1. Clone the Repository
```sh
git clone https://github.com/mohammed-asim-next/ecommerce_flutter.git
cd ecommerce_flutter
```

### 2. Install Dependencies
```sh
flutter pub get
```

### 3. Run the Application
```sh
flutter run
```

Make sure a **device/emulator** is connected.

---

## JSON Server Setup (For Local API)
This project uses `json-server` to simulate a backend. Follow these steps:

### 1. Install JSON Server
```sh
npm install -g json-server
```

### 2. Start JSON Server
```sh
json-server --watch database/db.json --port 5000
```
This will start a backend API at `http://localhost:5000`.

---

## Technologies Used
- **Flutter** (Frontend)
- **Provider** (State Management)
- **FakeStoreAPI** (Product Data)
- **Dio/HTTP Package** (API Calls)
- **JSON Server** (Mock Backend)

## Contributing
Feel free to fork the repository and submit a pull request with improvements.

---

### **Happy Coding! 🚀**
