# WalmartNaruto

--- TASK ---

Navigate to h"ps://api.jikan.moe/v3/search/anime?q=naruto
This is the endpoint, you'd like consume the API, and display the content in the native app.
It's preferred to use native networking API, and native UI to display the content
Plus point: image caching
Plus point: use SwiftUI to build the UI
Plus point: add a page to search by anime characters such as ‘naruto’, ‘kakegurui’, ‘goku’, ‘susuke’ etc. (note: you can simply replace query parameter on your search url)

Project Description:

- Implemented using storyboards and XIBs.
- Used design patterns: MVVM and Singleton.
   - Used MVVM because it allows me to easily scale my application by dividing functions into different modules, which makes it easier to read and understand the     behavior of the code.
   - Singleton is used in the APIHandler file because the API is used at runtime and can be used in multiple places.
- Used by TableView to display search results.
- Implemented a system of universal queries and URL building using EndPoints for different types of requests.
- Implemented automatic shutdown of the keyboard when you press anywhere or on the return button.
- Uses the Codable protocol to parse JSON using a generic type.
- Created the ImageDownloader method with caching functionality.
- Implemented reusable View with tableView functionality.
- APIHandler and ViewModels covered by UnitTests.
- No third-party libraries, only native code.

Screenshots:

[![Simulator-Screen-Shot-i-Phone-11-Pro-Max-2021-07-28-at-08-46-42.png](https://i.postimg.cc/CMZDPFmJ/Simulator-Screen-Shot-i-Phone-11-Pro-Max-2021-07-28-at-08-46-42.png)](https://postimg.cc/YjHhjwcm)
[![Simulator-Screen-Shot-i-Phone-11-Pro-Max-2021-07-28-at-08-46-55.png](https://i.postimg.cc/h4HmNHYn/Simulator-Screen-Shot-i-Phone-11-Pro-Max-2021-07-28-at-08-46-55.png)](https://postimg.cc/kDvDbh9Y)
