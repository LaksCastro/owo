# flutter_starter_kit
A flutter starter kit with bloc pattern to manage flutter app and updated with latest flutter version and bloc version 

## Adding Bloc pattern for state management
  * Read more about [bloc](https://pub.dev/packages/bloc#-readme-tab-) (business logic components) pattern to manage this project

  * Must Read about [flutter_bloc](https://pub.dev/packages/flutter_bloc#-readme-tab-)
    - this helps to implement the bloc pattern in flutter project
  
  * [Equatable](https://pub.dev/packages/equatable) used to compare two instance of  class
    and used to maintaine bloc state and event class comparable
    - Equatable overrides == and hashCode for you so you don't have to waste your time writing lots of boilerplate code

## Command to run the app in following environmet
  * In Dev mode:
    - flutter run -t lib/main_dev.dart
  * In prod mode build apk
    - flutter build apk --split-per-abi -t lib/main_prod.dart
  
## App icon 
  * text: T&C, font-family: stalemate