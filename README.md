# NY-Times

A simple app to Load the NY Times Most Popular Articles API and:

- Show a list of articles
- Shows details when articles on the list are tapped. 

We'll are using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key To test this API, 

For testAPI we used 
* all-sections for the section path component in the URL
* 7 for period

This is configurable in AppConstants.Swift file in Project. 
We used MVVM Design pattern and swift generic approach to develop this application.

We are generating TestCase in NY_TimesTests file for UnitUI testing

# Library Used
- [SDWebImage](https://github.com/rs/SDWebImage) - This library provides an async image downloader with cache support.
Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.
- [ReachabilitySwift ](https://github.com/ashleymills/Reachability.swift) - Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.


# Installation

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Incase of build fail due to dependency SDWebImageView, install SDWebImageView using CocoaPods.
* Incase of build fail due to dependency ReachabilitySwift, install ReachabilitySwift using CocoaPods.
* Press run icon in Xcode or command + R to run the project on Simulator

