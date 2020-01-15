# Central Perk

A coffee shop, point-of-sale application build with Ruby on Rails.

☕️

## Installation

1. Fork the repository
1. Clone the files to your computer
1. Run `bundle install`
1. Run `rake db:migrate`
1. Run `rails s` to start the server

## Seeding the Database

To test out the app using dummy data, follow these steps.

1. In the root level of the directory, create a `.env` file
1. Add the following, replacing `your_password` with a string to `.env`. This will be the login for the user account Gunther. All seed orders will belong to and be nested under Gunther.

```
PASSWORD=your_password
```

3. Run `rake db:seed` to populate the database with a user (Gunther), orders and menu items.

## Enable Google Login

To enable oAuth with Google login, add the following to the `.env` file, replacing the string `YOUR_CLIENT_ID` and `YOUR_CLIENT_SECRET` with a your Google Client ID and Secret.

```
GOOGLE_CLIENT_ID="YOUR_CLIENT_ID"
GOOGLE_CLIENT_SECRET="YOUR_CLIENT_SECRET"
```

Detailed instructions on creating the Google Client keys can be seen here: [Google Authentication Strategy for Rails 5 Application](https://medium.com/@rachel.hawa/google-authentication-strategy-for-rails-5-application-cd37947d2b1b)

> **Note**: Since the `.env` file contains sensitive information, it should not be tracked, committed or push to Github. Please see this post on [Hiding Sensitive Information with Environmental Variables in Ruby](https://shannoncrabill.com/blog/hiding-sensitive-information-with-environmental-variables-in-ruby/) for more information.

## Plans for the future

- Add _most_popular_ flag to menu items on the order page
- Sort menu_items alphabetically on new order page
- Images and descriptions with menu_item selections

## Additional Links

- [Spec](spec.md)
