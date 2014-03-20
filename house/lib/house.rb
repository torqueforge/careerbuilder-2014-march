class House
  attr_reader :phrases

  def initialize(phrases=Phrases.new.pieces)
    @phrases=phrases
  end

  def recite
    (1..phrases.length).map {|i| line(i) << "\n"}.join
  end

  def line(number)
    "This is %s.\n" % phrases[0...number].reverse.join(' ')
  end
end

class Phrases
  attr_reader :parts

  def initialize(parts = PARTS)
    @parts = parts
  end

  def pieces
    parts.map { |actor, action| "#{actor} #{action}" }
  end

  PARTS = [
    ['the house', 'that Jack built'],
    ['the malt', 'that lay in'],
    ['the rat', 'that ate'],
    ['the cat', 'that killed'],
    ['the dog', 'that worried'],
    ['the cow with the crumpled horn', 'that tossed'],
    ['the maiden all forlorn', 'that milked'],
    ['the man all tattered and torn', 'that kissed'],
    ['the priest all shaven and shorn', 'that married'],
    ['the rooster that crowed in the morn', 'that woke'],
    ['the farmer sowing his corn', 'that kept'],
    ['the horse and the hound and the horn', 'that belonged to']
  ]
end

class TotallyRandomPhrases < Phrases
  def parts
    super.transpose.map { |part| part.shuffle }.transpose
  end
end
