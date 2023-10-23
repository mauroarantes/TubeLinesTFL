# TubeLinesTFL

    This is an iOS app that displays a list of TFL Tube Lines and their current status. The app is written in Swift and SwiftUI and uses MVVM architecture.

## Project Description 

This shows a short list of TFL Tube Lines and their current status after getting them from TFL API (https://api.tfl.gov.uk/)

## Table of Contents

In the structure files contains: Model, View, ViewModel, Services and tests part. Tests contains ViewModelTests with MockResponse file and its data.

# Installation
Can be used with Xcode 13.4 and above. Compatible with iPhone and iPad with minimum iOS version 15.0.

# How to use
1. Download the code from GitHub provided link
2. Open the project in Xcode 13.4 or above.
3. Under Constants folder, edit Credentials.plist and add app_id and app_key.
4. Run it in the Simulator and it should work fine.
5. In order to run test cases go to Product Menu on Xcode and click in Test.

# Framework
SwiftUI 

# Architecture
This application uses MVVM for the views and clean architecture for the URL calls.

# Design Patterns
Publisher/ Subscriber/ Combine Framework.

# Accessibility
Voice over and dynamic fonts available.

# Testing
Units tests for success and failure situations. Mocked responses using MockAPIService class having test data from MockResponse.json file.

# Screenshots

|List of Tube Lines|
|---|
| ![Simulator Screen Shot - iPhone 12 - 2023-10-23 at 09 46 09](https://github.com/mauroarantes/TubeLinesTFL/assets/94620494/c03595a3-5766-408b-8431-08ea0868e87c)
  |
