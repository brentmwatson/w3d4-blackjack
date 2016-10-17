class Card
  attr_accessor :suit,
                :face,
                :value

  def initialize(face, suit)
    self.face = face
    self.suit = suit
    determine_value
  end

  def determine_value
    self.value = if face == 'A'
                   11
                 elsif face == 'K'
                   10
                 elsif face == 'Q'
                   10
                 elsif face == 'J'
                   10
                 else
                   face.to_i
                 end
  end

  def to_s
    "#{@face} of #{@suit}"
  end
end
