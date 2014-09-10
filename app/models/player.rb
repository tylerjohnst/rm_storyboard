class Player
  attr_accessor :id, :name, :game, :rating

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
      player.id = next_id
      player.name = name
      player.game = game
      player.rating = rating
      collection.push(player)
    end
  end


  def self.next_id
    collection.length + 1
  end

  def save
    self.class.collection.push(self)
  end

  def new?
    id.nil?
  end
end
