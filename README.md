# Flutter-HomeworkApp

A homework app to create a beautiful ui with from a given set of data.

## How to run this app

- Clone this project

```git
https://github.com/Rupangkan/FlutterHomeworkApp.git
```

- Open the project and from `pubspec.yaml` do a pub get.
- Run the project 😀

## Problems faced during the project

- One main problem I faced was to convert the given json data for the app to use. There were tons of resources but I thought it would be same as kotlin by creating a model class and converting the json to the model class. But that was quite problematic as I have zero experience in flutter and then found out that there was no need to create a model class and I can simply just load the resources of the classess.json as a String with root bundle and make a dynamic list.
- Another problem I faced was to change the state of the floatingActionButton. I have implemented the feature of not being able to click the button if no checkbox is checked but the color of the button seemed to stay constant.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
