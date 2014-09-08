class Player
  attr_accessor :name, :game, :rating

  GAMES = [
    "Angry Birds",
    "Chess",
    "Russian Roulette",
    "Spin the Bottle",
    "Texas Hold'em Poker",
    "Tic-Tac-Toe"
  ]

  def self.collection
    @collection ||= []
  end

  def self.create(name, game, rating)
    new.tap do |player|
      player.name = name
      player.game = game
      player.rating = rating
      collection.push(player)
    end
  end
end
