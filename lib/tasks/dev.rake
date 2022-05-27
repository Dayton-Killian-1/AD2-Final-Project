task :sample_data do
  p "Creating sample data"
  starting = Time.now

  # Game.delete_all
  # Move.delete_all
  # Vote.delete_all
  # Comment.delete_all
  # Piece.delete_all
  # User.delete_all

  people = Array.new(10) do
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    }
  end

  
  people << { first_name: "Alice", last_name: "Smith" }
  people << { first_name: "Bob", last_name: "Smith" }
  people << { first_name: "Carol", last_name: "Smith" }
  people << { first_name: "Doug", last_name: "Smith" }

  people.each do |person|
    username = person.fetch(:first_name).downcase

    user = User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
      points: 0,
      wins: 0
    )

    p user.errors.full_messages
  end






end