# Student-Bag
The best choice for a student.

## Features

* Created using flutter(dart), it can work on both android and IOS.
* Nice styles using font-families like (Quando, Satsify..).
* Include backend files in the lib folder (php-files).
* Contains videos and pdf files(as lessons).
* Include a quiz system, where questions are written in a json file, and the user has to select the correct answer in limited time.
* When the user gains an excellent grade, he-she will gain a badge about the lesson.
* Worked on shared-preferences to keep user logged in after closing the app.

## Requirements

In order to be able to user font families like "Quando", "Alike", and "Satisfy", you have to donwload them as .ttf, put them inside the application, and add the fonts to the pubspec.yaml file under the `uses-material-design: true` line
```dart
fonts:
    - family: Quando
      fonts:
        - asset: fonts/Quando.ttf
    - family: Satisfy
      fonts:
        - asset: fonts/Satisfy.ttf
    - family: Alike
      fonts:
        - asset: fonts/Alike-Regular.ttf
```

In addition, to be able to use assets(images, pdf files) you have to add them in pubspec.yaml also:
```dart
flutter:

  uses-material-design: true
  
  assets:
    - assets/
    - images/
```

## Dependencies

Inside the pubspec.yaml file, be sure to add the following dependencies:
```dart
dependencies:
  splashscreen: ^1.2.0
  foldable_sidebar: ^1.0.0
  http: ^0.12.0+17
  chewie: ^0.9.8
  advance_pdf_viewer: ^1.1.2
  animated_text_kit: ^2.0.1
  carousel_slider: ^1.3.0
  url_launcher: 
  flutter_session:
  shared_preferences:
  ```

## In general

Student-Bag is an app to give the student the ablility to hold his curriculum in his mobile phone. The student will be able to see his lessons, make quizes, and take marks on his work.

> For sure this app can be developed more in the future to make a teacher account, and a student account where the teacher will has a special interface to push the lessons, quizes, and notes to the students.

## Here are some images from the app.


![](https://hadi.yallaproductionz.com/demo_edu_ira/screenshots/1.png)

![](https://hadi.yallaproductionz.com/demo_edu_ira/screenshots/2.png)

![](https://hadi.yallaproductionz.com/demo_edu_ira/screenshots/3.png)

![](https://hadi.yallaproductionz.com/demo_edu_ira/screenshots/4.png)

![](https://hadi.yallaproductionz.com/demo_edu_ira/screenshots/5.png)

![](https://hadi.yallaproductionz.com/demo_edu_ira/screenshots/6.png)

![](https://hadi.yallaproductionz.com/demo_edu_ira/screenshots/7.png)
