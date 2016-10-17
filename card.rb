class Card

  attr_accessor :suit,
                :face,
                :value

  def initialize(face,suit)
    self.face = face
    self.suit = suit
    determine_value
  end

  def determine_value
    if face == "A"
      self.value = 11
    elsif face == "K"
      self.value = 10
    elsif face == "Q"
      self.value = 10
    elsif face == "J"
      self.value = 10
    else
      self.value = face.to_i
    end
  end
  def to_s
    "#{@face} of #{@suit}"
  end
end
