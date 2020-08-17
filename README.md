# DomestikaTech

Domestica iOS Challenge

The App must show the folowing information from the api http://mobile-assets.domestika.org/challenge/home.json

Two screens: CoursesList and CourseDetail.

1. CoursesLists displays two carousels of thumbnails with buttons. The top carousel will be paginated will display the first four courses (paginated) and the second one will display the rest.
2. Tapping on a specific course should open ​CourseDetail​ where the course trailer will be automatically played. The user should be able to play/pause the video and fast forward/rewind the video for 10 seconds. There’s also a Back button in the header to go back to the CoursesList screen.

## Prerequisites

- Xcode 14 beta 4
- Swift 5
- CocoaPods
- For full functional testability an iOS 14 beta device is required

## Installing

Run 'pods install' in DomestikaTech root folder.

Open generated 'DomestikaTech.xcworkspace'.

## Running the tests

Tests can be run from the Tests navigation tab.


## Built With

MVVM arquitecture based in SwiftUI and Combine

Dependencies:

* SDWebImageSwiftUI: https://github.com/SDWebImage/SDWebImageSwiftUI
* SwiftLint: https://github.com/realm/SwiftLint
* OHHTTPStubs https://github.com/AliSoftware/OHHTTPStubs

## Authors

* **Javier Morgaz**

## License

This project is licensed under the [MIT License](https://github.com/javiermorgaz/DomestikaTech/blob/master/LICENSE)
