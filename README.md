# iOS_FootballApp
A Football application based upon the foundations of MVVM and Protocol Oriented Programming using Swift 5. The application  includes five major screens, showcasing a dynamic newsfeed, gallery, top Teams, top Players based upon the Firebase database. The final screen presents the use of MetaWeather APIs to show the location coordinates for all cities starting with he prefix, “San”.

# Instructions
- Run 'pod install' in root directory
- Open 'iOSTrainingProject.xcworkspace'

# Architecture

The core architecture of the application is based upon the principles of Generic Programming where a single Network Engine interface is utilised by all view models through specialised service classes to load data for their respective Views. Furthermore, caches including ImageCache and Link Cache are used to improve efficiency of the application.

<p align="center">
    <img src="https://user-images.githubusercontent.com/15052850/64109592-574f0e80-cd99-11e9-87a2-42beb4ab665d.png">  
</p>

# Screens

## News Feed

The News Feed Screen shows a table view populated by a plethora of custom designed cells. These cells are divided into three categories, Videos, Facts and News Links, each of which can be interacted to view details in a separate screen. Pagination is implemented where initially only for cells displayed on the screen are loaded. The data for further cells are loaded as per the needs

<p align="center">
    <img src="https://user-images.githubusercontent.com/15052850/64110671-3b00a100-cd9c-11e9-830a-62a0bf8234b7.png" width = 300>  
</p>

- ## Gallery

The Gallery screen presents the images of top football players in a neatly organised Collection View. These images are loaded through links from Firebase using the ImageManager and ImageCache classes. Each image can further be double tapped to open a Share sheet.

<p align="center">
    <img src="https://user-images.githubusercontent.com/15052850/64110672-3b993780-cd9c-11e9-9232-d856abaf6805.png" width =300>  
  <img src="https://user-images.githubusercontent.com/15052850/64110673-3b993780-cd9c-11e9-8636-c4dad9faf239.png" width =320> 
</p>

- ## Teams Ranking

The Teams Ranking screen shows the top 20 international football teams as fetched from the Firebase database. The screen shows a table view with the Ranking, Flag and Name of the respective country alongside an icon representing the improvement or decline of the country’s ranking. Each cell can be further tapped to open a details view that gives a detailed team description and its national points.

<p align="center">
    <img src="https://user-images.githubusercontent.com/15052850/64110674-3b993780-cd9c-11e9-88a9-1cccf06eed39.png" width=300>
  <img src="https://user-images.githubusercontent.com/15052850/64110675-3c31ce00-cd9c-11e9-8e06-cab0e1e64502.png" width=305> 
</p>

- ## Players Ranking

The Player Ranking screen, akin to the Teams Ranking screen, shows the top 20 international football players. The screen shows a table view with the Ranking, Image and Name of the respective player alongside an icon representing the improvement or decline of the player’s ranking. Each cell can be further tapped to open a details view that gives a detailed description regarding the player.

<p align="center">
    <img src="https://user-images.githubusercontent.com/15052850/64110676-3c31ce00-cd9c-11e9-9ae2-1edcfd421f30.png" width=300>
  <img src="https://user-images.githubusercontent.com/15052850/64110678-3c31ce00-cd9c-11e9-91c6-17901dc81b9b.png" width=305> 
</p>

- ## Cities

The Cities screen showcases the use of MetaWeather APIs to show the cities with names starting from the prefix, “San”. Each table view cell on the screen shows the city name and its location coordinates.

<p align="center">
    <img src="https://user-images.githubusercontent.com/15052850/64110680-3cca6480-cd9c-11e9-958d-bc85f0b78fe6.png" width = 300">  
</p>

# Pods

- ## Firebase
Firebase Core and Database is used to connect the application to firebase and load the data populating all screens.
https://cocoapods.org/pods/Firebase

- ## SwiftLinkPreview

Swift Link Preview is used to populate the NewsLink cells on the News Feed. The Pod is useful in getting the image to be presented on the view.
https://cocoapods.org/pods/SwiftLinkPreview

- ## Youtube iOS Player Helper

The Pod is used to load the Youtube player in the Video News Feed cells and their respective detail view cells.
https://cocoapods.org/pods/youtube-ios-player-helper

- ## Lottie iOS

Lottie iOS Pod is used to present the loading animation at the startup while the application is loading the initial data for each screen.
https://cocoapods.org/pods/lottie-ios

--------------------------
Muhammad Usman Nazir
