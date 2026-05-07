# News App 📰

A Flutter News Application built using Clean Architecture, MVVM, Bloc State Management, and Dependency Injection.

The app allows users to:
- Browse news categories
- View news sources
- Read latest articles
- Search for news
- Open full articles in browser

---

# Features ✨

- Categories Screen
- News Sources Tabs
- News List by Source
- Search News
- Full News Details
- Open Original Article
- Cached Images
- Bloc State Management
- Dependency Injection using Injectable & GetIt
- Clean Architecture

---

# App Demo 🔥
https://github.com/user-attachments/assets/98eaf579-b29e-4ee8-b35f-73a2f225261e

---

# Tech Stack 🚀

- Flutter
- Dart
- flutter_bloc
- injectable
- get_it
- cached_network_image
- http
- url_launcher

---
# Project Structure 📂

```bash
lib/
│
├── data/
│   ├── api/
│   ├── data_source_contract/
│   ├── data_source_impl/
│   └── repository_impl/
│
├── repository_contract/
│
├── ui/
│   ├── home/
│   ├── widgets/
│   └── full_news.dart
│
├── di/
│
└── style/
```




# Architecture 🏗️

The project follows:

- Clean Architecture
- Repository Pattern
- MVVM Pattern
- Bloc/Cubit State Management

## Layers

- UI Layer
- ViewModel Layer
- Repository Layer
- Data Source Layer
- API Layer

---

# Packages Used 📦

```yaml
dependencies:
  flutter_bloc:
  injectable:
  get_it:
  cached_network_image:
  http:
  url_launcher:
```

---

# API Used 🌐

This project uses:

- NewsAPI

```bash
https://newsapi.org/
```

---

# Getting Started ⚡

## 1- Clone Repository

```bash
git clone https://github.com/your_username/news_app.git
```

## 2- Install Packages

```bash
flutter pub get
```

## 3- Generate Injectable Files

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 4- Run Application

```bash
flutter run
```

---

# Screens 📱

- Categories Screen
- Sources Tabs Screen
- News Details Screen
- Search Screen
- Full Article Screen

---

# Search Feature 🔍

Users can:

- Search news by keyword
- View search results instantly
- Open full article

---

# State Management ⚙️

Cubit is used for:

- Loading States
- Success States
- Error States

## Example

```dart
emit(LoadingState(message: 'Loading...'));

emit(SuccessState(newsList: newsList));

emit(ErrorState(errorMessage: e.toString()));
```

---

# Dependency Injection 💉

Using:

- Injectable
- GetIt

## Initialize DI

```dart
configureDependencies();
```

---

# Image Caching 🖼️

Using:

```dart
CachedNetworkImage
```

## Features

- Placeholder while loading
- Error widget
- Cached images

---

# Future Improvements 🔥

- Dark Mode
- Pagination
- Offline Support
- Bookmark News
- Firebase Notifications
- Local Database
- Better Search Experience



# Author 👨‍💻

Developed by **Marwan Elhoseney**

---

# License 📄

This project is for learning purposes.
