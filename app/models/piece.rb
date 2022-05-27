class Piece < ApplicationRecord
  belongs_to :owner_id, class_name: "User"
  enum teamcolor: { red: "red" orange: "orange" yellow: "yellow" green: "green" blue: "blue" purple: "purple" pink: "pink" brown: "brown" }
  enum piecetype: { pawn: "pawn" knight: "knight" bishop: "bishop" rook: "rook" queen: "queen" }


end