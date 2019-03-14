# NYTimesApp
NYTimesApp is a Master Detail App showing most viewed articles from the New York Times.

1)MaterView shows the Article Image Thumbnail,Article Title,date and contributor of the article.
2)Detail View shows the Large Image and other detailed description of that article.


TestCase for the validation of the data from the following GET API
https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=W82VRNnMzr6RB3ZAtFp956d0vrj4mIuc

and synchronous connetion is included in NYTimesAppTests

-> Period used is 7 for the API
-> API Key generated from NYTimes developer account - W82VRNnMzr6RB3ZAtFp956d0vrj4mIuc


TravisCI is used for Continuous Integration:
-> travis.yml file is included in the project
-> Whenever there is a pull request or push request,the build is automatically generated in Travis Dashboard.
-> Credentials for Travis are same as Git.

Following script is used for building the application:

- xcodebuild -scheme NYTimesApp -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.1' build test











