# Seed Counts
user_count = 25
brewery_favorite_count = 50
brewery_like_count = 100
brewery_review_count = 35
circuit_count = 100
circuit_favorite_count = 50
circuit_like_count = 100
circuit_review_count = 65
follow_count = 50
notification_count = 0 # No random notifications, just the generated ones from favorites, likes, follows, reviews
breweries_circuit_count = 5 # breweries per circuit


# Seed Helper Methods
def factorial(n)
    if n == 0
        1
    else
        n * factorial(n-1)
    end
end

def pair_combinations_count(array_1_count, array_2_count)
    if array_1_count > array_2_count
        n = array_1_count
        k = array_2_count
    else
        n = array_2_count
        k = array_1_count
    end
    factorial(n)/factorial(n-k)
end

def id_pair_combinations(class_1_ids, class_2_ids, count)
    # Check max number of combinations
    max = pair_combinations_count(class_1_ids.count, class_2_ids.count)
    count = max if count > max
    # Create combinations
    id_pairs = []
    until id_pairs.count == count
        id_pairs.push([class_1_ids.sample, class_2_ids.sample]).uniq!
    end
    id_pairs
end

# Clear Old Seeds (Not database is setup to cascade delete)
Brewery.destroy_all
User.destroy_all

# User Seeds
user_count.times do
    user = User.create(
        email: Faker::Internet.email,
        password: "password",
        password_confirmation: "password",
        first_name: Faker::Name.first_name,
        middle_name: Faker::Name.middle_name,
        last_name: Faker::Name.last_name,
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        postal_code: Faker::Address.zip_code,
        country: "United States",
        about: Faker::Lorem.paragraph
    )
    # Create welcome notification
    user.new_user_notification
end

# Brewery Seeds
require_relative '../app/apis/open_brewery_db/client.rb'
seattle_breweries.each do |brewery|
    if brewery["longitude"] && brewery["latitude"]
        Brewery.create(brewery)
    end
end

# Brewery Favorite Seeds
id_pairs = id_pair_combinations(Brewery.ids, User.ids, brewery_favorite_count)
brewery_favorite_count.times do |n|
    BreweryFavorite.create(
        brewery_id: id_pairs[n].first,
        user_id: id_pairs[n].last)
end

# Brewery Like Seeds
id_pairs = id_pair_combinations(Brewery.ids, User.ids, brewery_like_count)
brewery_like_count.times do |n|
    BreweryLike.create(
        brewery_id: id_pairs[n].first,
        user_id: id_pairs[n].last)
end

# Brewery Review Seeds
id_pairs = id_pair_combinations(Brewery.ids, User.ids, brewery_review_count)
brewery_review_count.times do |n|
    BreweryReview.create(
        title: Faker::Beer.name,
        content: Faker::Hipster.sentence,
        rating: rand(1..5),
        brewery_id: id_pairs[n].first,
        user_id: id_pairs[n].last)
end

# Circuit Seeds
circuit_count.times do
    Circuit.create(
        title: Faker::Beer.name,
        description: Faker::ChuckNorris.fact,
        public: Faker::Boolean.boolean,
        user_id: User.all.sample.id)
end

# Circuit Favorite Seeds
id_pairs = id_pair_combinations(Circuit.ids, User.ids, circuit_favorite_count)
circuit_favorite_count.times do |n|
    circuit_favorite = CircuitFavorite.create(
        circuit_id: id_pairs[n].first,
        user_id: id_pairs[n].last
    )
    # New favorite, send notification to circuit author
    circuit_favorite.new_favorite_notification
end

# Circuit Like Seeds
id_pairs = id_pair_combinations(Circuit.ids, User.ids, circuit_like_count)
circuit_like_count.times do |n|
    circuit_like = CircuitLike.create(
        circuit_id: id_pairs[n].first,
        user_id: id_pairs[n].last
    )
   # New like, send a notification to the circuit author
   circuit_like.new_like_notification
end

# Circuit Review Seeds
id_pairs = id_pair_combinations(Circuit.ids, User.ids, circuit_review_count)
circuit_review_count.times do |n|
    circuit_review = CircuitReview.create(
        title: Faker::Book.title,
        content: Faker::Lorem.sentence,
        rating: rand(1..5),
        circuit_id: id_pairs[n].first,
        user_id: id_pairs[n].last
    )
    # Send a notification to the circuit author
    circuit_review.new_review_notification
end

# Follow Seeds
id_pairs = id_pair_combinations(User.ids, User.ids, follow_count)
follow_count.times do |n|
    follow = Follow.create(
        followee_id: id_pairs[n].first,
        follower_id: id_pairs[n].last
    )
    # New follow, send the followee a notification
    follow.new_follow_notification
end

# Notification Seeds
notification_count.times do
    Notification.create(
        title: Faker::Company.catch_phrase,
        content: Faker::Lorem.sentence,
        read: Faker::Boolean.boolean,
        user_id: User.all.sample.id)
end

# Breweries Circuit Seeds
Circuit.all.each do |circuit|
    breweries_circuit_count.times do
        BreweriesCircuit.create(
            brewery_id: Brewery.all.sample.id,
            circuit_id: circuit.id)
    end
end
