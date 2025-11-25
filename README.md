# Ahar Express (Food Delivery App)

A Flutter project for Mobile Application and Design Course.

# 🛵 Ahar Express - Food Delivery App

Ahar Express is a modern, cross-platform food ordering and delivery application built using **Flutter** and powered by **Firebase**. It provides a seamless user experience for browsing menus, placing orders with a demo payment system, and offers unique features like a built-in weather checker.

| Technology | Backend |
| :---: | :---: |
| [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev) | [![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com) |

***

## ✨ Key Features

Ahar Express is designed to be feature-rich and user-friendly, supporting core ordering functionality alongside additional utilities:

* 🌗 **Dark Mode Support:** A sleek, eye-caring dark mode toggle is available throughout the application interface.
* 🍔 **Food Browsing & Ordering:** Users can easily view available food items, select quantities, and place orders.
* 💳 **Demo Card Payment:** A functional simulated payment gateway allows users to complete the checkout process without requiring real transaction details.
* 💾 **Order Receipt Storage:** All completed order receipts and history are securely stored in **Firebase**, providing a reliable transaction record.
* 🌦️ **Built-in Weather Checker:** A unique utility feature that allows users to check the current weather, enhancing the overall app experience.

***

## 🛠️ Tech Stack

The application is built using a modern, scalable architecture:

* **Frontend Framework:** [Flutter](https://flutter.dev)
* **Language:** [Dart](https://dart.dev)
* **Backend & Database:** [Firebase](https://firebase.google.com) (Authentication, Firestore for data, Storage for receipts/images)

***

## 🚀 Installation & Local Setup

To get Ahar Express running locally, follow these simple steps.

### Prerequisites

1.  **Flutter SDK:** Ensure you have Flutter installed and configured.
    ```bash
    flutter doctor
    ```
2.  **Dart SDK:** Included with Flutter.
3.  **Firebase CLI:** For deploying functions or services.

### Step 1: Clone the Repository

```bash
git clone [https://github.com/Pi-Pika/AharExpress.git](https://github.com/Pi-Pika/AharExpress.git)
cd AharExpress
```

### Step 2: Configure Firebase

1.  Create a new project in the [Firebase Console](https://console.firebase.google.com/).
2.  Follow the instructions to add a **Flutter** app to your Firebase project.
3.  Place your configuration files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS/macOS/web) into the correct platform folders (`android/app/` and `ios/Runner/`).

### Step 3: Install Dependencies

Fetch all the required Dart and Flutter packages:

```bash
flutter pub get
```

### Step 4: Run the Application

You can run the app on any connected device or simulator/emulator:

```bash
flutter run
```

🧑‍💻 Usage
The payment process utilizes a demo card payment system. To complete an order and see the receipt stored in Firebase, users only need to input the necessary fields (card number, expiry, CVV) with any placeholder data. The application will process this as a successful transaction and securely log the receipt.

🤝 Contributing
Contributions are always welcome! If you have suggestions or want to report an issue, please feel free to open a Pull Request or a new Issue.

📞 Contact
Project Link: https://github.com/Pi-Pika/AharExpress

Developer: @Pi-Pika
