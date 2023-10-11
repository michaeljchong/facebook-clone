# Facebook Clone

The goal of this project was to create a clone of facebook using rails MVC. Users have their own profiles and are able to have similar relationships with posts and other users as the original Facebook app. See the <a href="https://mchong-facebook-clone.fly.dev">Live Preview</a>.

Project Features:
<<<<<<< Updated upstream
* Devise user authentication
* Complex rails associations between multiple models
* PostgreSQL
* User commenting on posts
* User show page shows profile info and posts
* Send and receive friend requests on users index page
* Notifications for new friend requests, comments, and likes
* Like/unlike posts and comments
* Navbar (User profile, posts, users, notifications, edit profile, log in/out)
* Only post/comment author can edit and delete post/comment

In Progress:
* User profile photo

To Do:
* Notifications
  * Set view state on notifications to differentiate between ones that have already been seen
  * Destroy friend request notification once request is accepted or deleted
  * Fix error in notifications after destroying like, post, or comment (association with dependent destroy)
* OmniAuth signin
* Mailer for welcome email
* Change links to buttons
* Edit comments and posts without being redirected to an edit page

Project Extensions:
* Set posts to private, friends-only or public
* Refactor to move friendship methods from controller to model
* Display other users who also liked post/comment
* Notifications link to referenced post/comment, or allows user to respond to friend request
=======

- Devise user authentication
- Complex rails associations between multiple models
- PostgreSQL
- User commenting on posts
- User page shows profile info (name, email, photo) and posts
- Send and receive friend requests on users index page
- Notifications for new friend requests, comments, and likes
- Like/unlike posts and comments
- Navbar (User profile, posts, users, notifications, edit profile, log in/out)
- Only post/comment author can edit and delete post/comment
- Hosting via fly.io

In Progress:

- User profile photo
  - Set default image src
  - Upload option in devise new and edit
  - Display image on navbar, posts, comments

To Do:

- Notifications
  - Set view state on notifications to differentiate between ones that have already been seen
  - Destroy friend request notification once request is accepted or deleted
  - Fix error in notifications after destroying like, post, or comment (association with dependent destroy)
- OmniAuth signin
- Mailer for welcome email
- Change links to buttons
- Edit comments and posts without being redirected to an edit page
- Display new post form on posts page
- Seed db

Project Extensions:

- Set posts to private, friends-only or public
- Refactor to move friendship methods from controller to model
- Display other users who also liked post/comment
- Notifications link to referenced post/comment, or allows user to respond to friend request
- Hide all comments except for the first
>>>>>>> Stashed changes
