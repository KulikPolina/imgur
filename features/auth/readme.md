# Authorization Box Module

An authentication module for quickly integrating user authentication features into your app.

## Overview

This module provides a reusable, copy-paste authentication solution that can be customized to meet your app’s needs. 
It lets you define your own provider or connect one of the supported providers, such as Firebase and Supabase.

## Getting Started

Follow these steps to add the Authorization Box module to your Flutter app.

### 1. Copy the Module
Copy the `auth` module directory into your app's `feature` folder.

### 2. Add the Module to Your `pubspec.yaml`
In your app's `pubspec.yaml`, add a reference to the `auth` module:

```yaml
dependencies:
  flutter:
    sdk: flutter
  auth:
    path: ./feature/auth  # Adjust the path if different
```

Run the command ` flutter pub get`;

### 3. Initialize Dependencies in main.dart
Open your `main.dart` file and initialize the module dependencies by calling `AuthDI.initDependencies()`
within the `void main()` function:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthDI.initDependencies();
  runApp(MyApp());
}
``` 

### 4. Choose an Authentication Provider
In `auth_di.dart`, locate the `_initRepositories()` method 
and choose the desired authentication provider:

```dart
// TODO: Select the appropriate provider
await _initRepositories(provider: 'ProviderInstance.selected-provider');
```
### 5. Run build_runner and pub get

- Run the command ` flutter pub get` at path `feature/auth`;
- Run the command ` dart run build_runner build -d` at path `feature/auth`;

### 6.Configure Firebase (Optional)
If using Firebase for authentication, generate a `firebase_options.dart` file  
(typically done through the Firebase CLI) and place it at: `auth/lib/src/core/src/firebase_options.dart`
For more information, check this guide: https://firebase.google.com/docs/flutter/setup

### 7. Set Up Supabase (Optional)
If using Supabase, locate the `_initSupabaseAuth` method in `auth_di.dart`  
and securely add your Supabase credentials:

```dart
static Future<void> _initSupabaseAuth() async {
  // TODO(Supabase): Add Supabase credentials here if using Supabase
  await Supabase.initialize(
    url: 'your-supabase-url',
    anonKey: 'your-supabase-anon-key',
  );
  ...
}
```
For more information, check this guide: https://supabase.com/docs/reference/dart/start

### 8. Review and Complete TODOs
Go through the module and do remaining TODOs.  
Some of them are general (no matter which provider you chose) e.g `// TODO():...`,  
and some of them are for specific providers e.g. `// TODO(Supabase):..`\

### Notes
Ensure that sensitive credentials, like API keys, are stored securely and not exposed in the source code.
Customize the module as needed to suit your app’s authentication flow.