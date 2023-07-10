# Facebook Clone

The goal of this project is to create a clone of facebook using rails MVC. This will be a CRUD app and will also feature authentication via OmniAuth and a rails mailer. Users will have their own profile and be able to have similar relationships with posts and other users as the original Facebook app. See the original project requirements on <a href="https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project">The Odin Project</a>.

Project Features:
* Devise user authentication
* Complex rails associations between multiple models
* PostgreSQL
* User commenting on posts
* User show page shows profile info and posts
* Send and receive friend requests on users index page
* Notifications for new friend requests, comments
* Like/unlike posts and comments

In Progress:
* Notifications for likes

To Do:
* Edit and delete comments (restricted to comment author)
* Set view state on notifications to differentiate between ones that have already been seen
* Destroy friend request notification once request is accepted or deleted
* Navbar
* display comments and likes with posts on posts index page
* Sort posts on posts index page by date
* User profile photo
* OmniAuth signin
* Mailer for welcome email

Project Extensions:
* Set posts to private, friends-only or public
* Refactor to move friendship methods from controller to model
* Display other users who also liked post/comment
