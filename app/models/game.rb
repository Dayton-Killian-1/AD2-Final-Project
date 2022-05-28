class Game < ApplicationRecord
  has_many  :moveoptions, class_name: "Move", dependent: :destroy
  has_many  :usercomments, class_name: "Comment", dependent: :destroy
  enum status: { playing: "playing", complete: "complete" }
end
