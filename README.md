# Animal Shelter Project (Fall 2016)
This project was completed by a team of three students, led by me. The class was "App Development for iOS," however, this project went far beyond what was required and in truth became more a personal project than an assignment.
## The Idea
The purpose of the app was to connect potential pet adopters with pets up for adoption at an animal shelter. To accomplish this purpose the following features were implemented:
* Have a database that stores pet "profiles" (information about pets up for adoption, such as breed, age, picture)
* Have a way to update the database as pets are adopted or added
* Allow users to search for pets using a filtering mechanism
* Allow users to send a message to the animal shelter to inquire about a pet
* Provide directions to the animal shelter from the user's current location
## Technologies Used
* MySQL - Database management system used to create and interact with database of pet profiles. The database was hosted on my personal website, which no longer exists.
* PHP - In addition to the iOS application, I created a custom web application that allowed the animal shelter to easily add and remove pet profiles. This information in this database was pulled down to the iOS app via a custom built API that utilized JSONs. This was a project in its own right. Features included:
  * Password protected login interface (password was hashed for added security)
  * Image upload interface (for uploading images of pets)
  * Ability to add, update, and delete pet profiles.
  * Custom build API used by the iOS app
* Swift - The language used to build the iOS app. The app had a tabbed designed, meaning the user tapped on the tabs at the bottom of the screen to navigate to the three main features of the app (search for a pet, view favorites, get directions). The layout of the app can be seen below.
![storyboard v1](https://user-images.githubusercontent.com/22783091/46446815-0fb4a280-c744-11e8-8254-7111f0e157c9.png)
* Google Maps API - This allowed the user to get directions from their current location to the animal shelter. It showed a map with a line connecting their current location and the pet shelter and also had the option to present a written list of directions to the animal shelter. This feature was meant for me to explore using the phones GPS sensor and the Google Maps API more than anything.
* MailGun API - This allowed the user to send a message to the animal shelter via email. When the user tapped the "Send Message" button, an email was generated and actually sent.
