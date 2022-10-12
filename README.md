# DTS Project

For easier editing we're going to use Notion for quick ideas, and list:
https://www.notion.so/leonardoleite/DTS-Documentation-4e4e64e187994ce5a3647ec837356c21

You can find the screens here on Figma: https://www.figma.com/file/B3c0wvB3PXSAn4ZNCiwAEi/Party-Seeker?node-id=0%3A1

# Mobile APP

## To use MobX with build runner
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

alternative → flutter packages pub run build_runner build

To application listen any changes in the code and run build runner, use this code

```dart
flutter pub run build_runner watch
```

 If using vc code, there are a possibility to add the fluuter_mobx (from flutterando) extension.

If there are problems with generation, use the command:

```bash
flutter packages pub run build_runner clean
```