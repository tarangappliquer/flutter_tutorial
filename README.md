# flutter_tutorial

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Reduce app size

```bash
flutter build apk --analyze-size --target-platform android-x64
```

```bash
flutter build appbundle
```

```bash
flutter build apk --release --tree-shake-icons --split-per-abi --obfuscate --split-debug-info=build/app/outputs/symbols
```
