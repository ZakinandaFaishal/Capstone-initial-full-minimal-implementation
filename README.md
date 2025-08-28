# Capstone Flutter Full Project

## 📌 Project Overview
A complete Flutter application built with Firebase integration, state management, and responsive UI design. The project serves as a capstone demonstrating core mobile development skills with minimal but essential features.

---

## 🚀 Features
- **User Authentication** (Firebase Auth: Email/Password, Google Sign-In)
- **Cloud Firestore Integration** (store and retrieve data in real-time)
- **Push Notifications** (Firebase Cloud Messaging)
- **Local Notifications & Reminders**
- **State Management with Provider**
- **Responsive UI Design (mobile & tablet)**
- **Dark Mode / Light Mode Toggle**
- **Offline Persistence (Firestore caching)**
- **Form Validation & Error Handling**
- **Simple Analytics (Firebase Analytics)**
- **Basic CRUD Operations** (Create, Read, Update, Delete)
- **Search & Filter functionality**

---

## 🛠️ Tech Stack
- **Flutter** (latest stable)
- **Dart**
- **Firebase (Auth, Firestore, Messaging, Analytics)**
- **Provider (State Management)**
- **Intl (Localization & Date Formatting)**
- **Shared Preferences (local storage)**

---

## 📂 Folder Structure
```
lib/
│-- main.dart
│-- app.dart
│-- config/
│   └── theme.dart
│-- models/
│   └── user_model.dart
│   └── reminder_model.dart
│-- providers/
│   └── auth_provider.dart
│   └── reminder_provider.dart
│-- services/
│   └── auth_service.dart
│   └── firestore_service.dart
│   └── notification_service.dart
│-- screens/
│   └── login_screen.dart
│   └── register_screen.dart
│   └── home_screen.dart
│   └── reminder_screen.dart
│-- widgets/
│   └── custom_button.dart
│   └── reminder_card.dart
```

---

## 🔑 Installation & Setup
1. Clone repository:
   ```bash
   git clone https://github.com/username/capstone-flutter.git
   cd capstone-flutter
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure Firebase:
   - Create a Firebase project
   - Add `google-services.json` (Android) & `GoogleService-Info.plist` (iOS)
   - Enable **Authentication, Firestore, Messaging, Analytics**

4. Run project:
   ```bash
   flutter run
   ```

---

## 📖 Usage Guide
- **Register/Login** with email or Google account.
- **Add Reminder** with date & time.
- **Receive Notifications** when reminders trigger.
- **View & Manage Reminders** in the Home screen.
- **Search & Filter Reminders**.
- **Toggle Dark/Light Mode** in settings.

---

## 🧪 Testing
- Unit testing for providers & services.
- Widget testing for UI components.

Run tests:
```bash
flutter test
```

---

## 📜 Commit Convention
- `feat:` new feature
- `fix:` bug fix
- `docs:` documentation changes
- `style:` formatting, UI updates
- `refactor:` code refactoring
- `test:` adding tests
- `chore:` maintenance

Example:
```bash
git commit -m "feat: add reminder notification feature"
```

---

## 📘 Documentation
- **Inline code comments** for clarity
- **README.md** (this file) with setup & usage
- **API Documentation** (doc folder)
- **UML Diagrams** (if needed)

---

## ✅ Future Improvements
- Multi-language support (i18n)
- Advanced analytics & reports
- Cloud Functions integration
- In-app purchases

---

## 👨‍💻 Author
**Andrian Jonathan Pramudito & Team**
