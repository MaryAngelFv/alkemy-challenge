# Alkemy-challenge

## How the app works

![alt text](https://github.com/MaryAngelFv/alkemy-challenge/tree/main/Screenshots/AppWorkingVideo.gif)

## Instalation
- This project require XCode 13.0, Swift 5.0 and should be run on device with iOS 15+
you should `run` the app.
- On the root foolder run the command "pod install"
- Open the file "alkemy-challenge.xcworkspace"
- Run on XCode

## Architecture
This project uses MVVM architecture, this architecture is conformed by 3 layers(Model, View, ViewModel) and this allow us to have code decoupled, testable, and scalable.

## Project Structure

### Screens
In this folder we have each app module. In this case we have a Home, and DetailMovie modules.

![alt text](https://github.com/MaryAngelFv/alkemy-challenge/tree/main/Screenshots/ScreensCapture.png)

### Helpers
The main idea of this folder is have a transversal module which help us with reusables functions and components.
- **Networking:** This allows us to separate in a single context everything related to networking and web services. 
- **UI:** Contains visual reusable components and extensions.

![alt text](https://github.com/MaryAngelFv/alkemy-challenge/tree/main/Screenshots/HelpersCapture.png)

### Services
In this folder we have the classes which responsability is communicate with the network and retry data.

![alt text](https://github.com/MaryAngelFv/alkemy-challenge/tree/main/Screenshots/ServiceCapture.png)

### Unit Test
In this section we have the unit test structure, this folder meets the MVVM architecture requirements.

![alt text](https://github.com/MaryAngelFv/alkemy-challenge/tree/main/Screenshots/UnitTestCapture.png)
