# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
  - A User has_many Orders
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  - An Order belongs_to a User
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
  - An Order has_many MenuItems, through OrderItems
  - A MenuItem has_many Orders, through OrderItems
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  - A MenuItems has_many OrderItems
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  - An Order includes a name_for_pickup attribute as a mandatory field
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - A User must have a name, email and password. The email address must be unique.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  - Navigating to orders/completed shows a list of all Orders where completed is true
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  - Users can sign in with a Google account
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - Navigating to users/1/orders shows all orders taken by that user
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  - When logged in, a new Order is created at user/:user_id/orders/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  - Creating a MenuItem without a name renders the form with an error message saying MenuItems cannot be blank.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
