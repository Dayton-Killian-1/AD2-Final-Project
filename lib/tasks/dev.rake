task :sample_data do
  p "Creating sample data"
  starting = Time.now

  Game.delete_all
  Move.delete_all
  Vote.delete_all
  Comment.delete_all
  Piece.delete_all
  User.delete_all

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

  users = User.all

  users.each do |user|
    rand(1..4).times {
      Piece.create(
        owner_id: user.id
        teamcolor: ["red", "orange", "yellow", "green", "blue", "purple", "pink", "brown"].sample
        pieceroll = rand(1..15)
        piecetyperoll = ""
        pointsroll = 0
        if pieceroll < 9 
          piecetyperoll = "pawn"
          pointsroll = 1
        elsif pieceroll < 11
          piecetyperoll = "knight"
          pointsroll = 3
        elsif pieceroll < 13
          piecetyperoll = "bisop"
          pointsroll = 3
        elsif pieceroll < 15
          piecetyperoll = "rook"
          pointsroll = 5
        else
          piecetyperoll = "queen"
          pointsroll = 9
        end
        piecetype: piecetyperoll
        points: pointsroll
      )
    }
    
  end

  Game.create(whiteteamcolor: red blackteamcolor: blue boardposition: "asdf1234" movehistory: "" turn: 1)
  Game.create(whiteteamcolor: yellow blackteamcolor: brown boardposition: "asdf1234" movehistory: "" turn: 1)
  Game.create(whiteteamcolor: green blackteamcolor: orange boardposition: "asdf1234" movehistory: "" turn: 1)
  Game.create(whiteteamcolor: pink blackteamcolor: purple boardposition: "asdf1234" movehistory: "" turn: 1)

  games = Game.all

  games.each do |game|
# CREATE MOVES

  end


# CREATE VOTES

# CREATE COMMENTS

  ending = Time.now
  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Piece.count} pieces."
  p "There are now #{Game.count} games."
  p "There are now #{Move.count} moves."
  p "There are now #{Comment.count} comments."
  p "There are now #{Vote.count} votes."
  

end