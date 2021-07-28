# WalmartNaruto

--- TASK ---

Navigate to h"ps://api.jikan.moe/v3/search/anime?q=naruto
This is the endpoint, you'd like consume the API, and display the content in the native app.
It's preferred to use native networking API, and native UI to display the content
Plus point: image caching
Plus point: use SwiftUI to build the UI
Plus point: add a page to search by anime characters such as ‘naruto’, ‘kakegurui’, ‘goku’, ‘susuke’ etc. (note: you can simply replace query parameter on your search url)

Project Description:

- Implemented using Storyboards and XIB.
- Used design patterns: MVVM and Singleton.
  - MVVM used because it allows me to easily scale my application, due to the differentiation of functionality into different modules, makes it easy to read and understand the behavior of the code.
  - Singleton used in APIHandler file because API using during runtime and can be used in multiple places.
- Used TableView to show search result.
- Implemented universal request and URL builder system using EndPoints for different types of requests.
- Implemented automatic keyboard resignation when tapping anywhere or on the return button.
- Used Codable protocol to parse JSON using model.
- APIHandler and ViewModels covered with UnitTests.
- No third-party libraries, only native code.

Screenshots:

[![Simulator-Screen-Shot-i-Phone-11-Pro-Max-2021-07-28-at-08-46-42.png](https://i.postimg.cc/CMZDPFmJ/Simulator-Screen-Shot-i-Phone-11-Pro-Max-2021-07-28-at-08-46-42.png)](https://postimg.cc/YjHhjwcm)
[![Simulator-Screen-Shot-i-Phone-11-Pro-Max-2021-07-28-at-08-46-55.png](https://i.postimg.cc/h4HmNHYn/Simulator-Screen-Shot-i-Phone-11-Pro-Max-2021-07-28-at-08-46-55.png)](https://postimg.cc/kDvDbh9Y)
