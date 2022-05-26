# Flutter-HomeworkApp

A homework app to create a beautiful ui with from a given set of data.

<img width="395" alt="Continue" src="https://user-images.githubusercontent.com/64887274/170391277-afc0c9ac-2746-41bf-a5e0-58d8d2dd558f.jpg">  <img width="400" alt="Thank you" src="https://user-images.githubusercontent.com/64887274/170391259-dc15260f-ef53-4978-b93e-ba0a45ee6680.jpg">

<!-- ![IMG_20220526_060141](https://user-images.githubusercontent.com/64887274/170391277-afc0c9ac-2746-41bf-a5e0-58d8d2dd558f.jpg)[200]
![IMG_20220526_060154](https://user-images.githubusercontent.com/64887274/170391259-dc15260f-ef53-4978-b93e-ba0a45ee6680.jpg)[200] -->

## How to run this app
- Install the Flutter-HomeworkApp.apk for android
### OR

- Clone this project

```git
https://github.com/Rupangkan/FlutterHomeworkApp.git
```

- Open the project and from `pubspec.yaml` do a pub get.
- Run the project 😀

## Problems faced during the project

- One main problem I faced was to convert the given json data for the app to use. There were tons of resources but I thought it would be same as kotlin by creating a model class and converting the json to the model class. But that was quite problematic as I have zero experience in flutter and then found out that there was no need to create a model class and I can simply just load the resources of the classess.json as a String with root bundle and make a dynamic list.
- Another problem I faced was to change the state of the floatingActionButton. I have implemented the feature of not being able to click the button if no checkbox is checked but the color of the button seemed to stay constant.
- One more problem was the the release apk that was created could not load the Network Images. I thought flutter automatically adds the permissions to the app for both android and iOS but I had to manually add it. (Could not test for an ipa file as I don't have a mac system).