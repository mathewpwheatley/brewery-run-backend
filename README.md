# Brewery Run
Brewery Run is website that helps runners remain calorie neutral during those long runs by planning out routes with stops at your local breweries. Users can find created by the Brewery Run community via a name search or sort the circuits by rating, likes, favorites, etc. Circuit mapping, directions, and elevation maping is provided via the Google Maps API. A user can also create an accout which will grant them additional functionality such as the ability to follow users, write reviews, and create circuits. Each user also receives a customized dashboard which gathers their favorite circuits as well as those from users they are following, into a single page.

**Note:** This this served as my capstone project for my 2020 Flatiron School Software engineering course and now serves as a personal size project. Due to this some features might be disabled since features supported by paid APIs such as Google Maps can quickly reach the free use limit.

The remainder of this README.md will discuss the backend exclusivley. The frontend repository can be found [here](https://github.com/mathewpwheatley/brewery-run-frontend).

## Technology Leveraged
- Ruby
- Rails API
- Postgres database
- [Open Brewery DB](https://www.openbrewerydb.org)

## Features
- Rails API backend built with:
  - 12 models: User, Brewery, Circuit, Brewery Circuit (Join), Follow, Notification, Brewery Like, Circuit Like, Brewery Favorite, Circuit Favorite, Brewery Review, Circuit Review
  - Related model serializers for JSON creation
  - Authentication via JWT tokens sent/recieved via HTTP Only cookies
  - User password hashing via Bcrypt

## Installation
The user interface for Brewery Run is hosted on Heroku therefore you can access it directly from your browser at https://brewery-run.herokuapp.com. You will not have access to directly edit the backend interface from the website.

If you instead wanted to manipulate the backend you must install it locally via the following steps:
1. Assuming you are familiar with Git: Clone or fork/clone the [backend](https://github.com/mathewpwheatley/brewery-run-backend).
2. On your local machine, from the remote git directory, run the following commands:
  1. "bundle install" to install all required Ruby gems
  2. "rails db:create" to create database
  3. "rails db:migrate" to build database tables
  4. "rails db:seed" to seed database with sample data
  5. "rails s" to start the backend at default port (localhost:3000)

## Contributing
Contributions are welcome, submit a pull request!

## Authors
* **Mathew Wheatley** - [GitHub](https://github.com/mathewpwheatley)

## License
This project is licensed under the [GNU GPL](https://www.gnu.org/licenses/gpl-3.0.en.html)
