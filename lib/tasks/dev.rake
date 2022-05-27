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
          piecetyperoll = "bishop"
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

  # alice has a blue knight and red pawn
  # bob has a blue pawn and yellow queen
  # carol has a blue rook and purple bishop
  Piece.create(owner_id: 11, teamcolor: "blue", piecetype: "knight", points: 3)
  Piece.create(owner_id: 11, teamcolor: "red", piecetype: "pawn", points: 1)
  Piece.create(owner_id: 12, teamcolor: "blue", piecetype: "pawn", points: 1)
  Piece.create(owner_id: 12, teamcolor: "yellow", piecetype: "queen", points: 9)
  Piece.create(owner_id: 13, teamcolor: "blue", piecetype: "rook", points: 5)
  Piece.create(owner_id: 13, teamcolor: "purple", piecetype: "bishop", points: 3)


# set up the games. This will look similar to the actual initialization of the games.
  Game.create(whiteteamcolor: "red" blackteamcolor: "blue" boardposition: "a2a4b7b5" movehistory: "" turn: 3)
  Game.create(whiteteamcolor: "yellow" blackteamcolor: "brown" boardposition: "" movehistory: "" turn: 1)
  Game.create(whiteteamcolor: "green" blackteamcolor: "orange" boardposition: "e2e4e7e5d2d4e5d4" movehistory: "" turn: 5)
  Game.create(whiteteamcolor: "pink" blackteamcolor: "purple" boardposition: "d2d4" movehistory: "" turn: 1)


  # We're not going to make moves here. That'll happen when someone logs in. I'll check with the API to see if it's legal,
  # and if it is, it'll call Move.create. 

  # Moves can all be referenced as the square they were going from and the square they're going to. So d2d4 is how you'd 
  # note 1. d4, and d2d4e2e4d4de4 is how you'd show 1. d4 e4 2. dxe4.
  # https://chess-api.herokuapp.com/
  # https://chess-api.herokuapp.com/next_best/d2d4g8f6

  # Vote.create() will also follow that same pattern, because the move needs to be created before we can vote on it.

  games = Game.all

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