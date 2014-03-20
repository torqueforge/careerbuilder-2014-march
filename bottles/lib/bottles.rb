class Bottles
  MAX_VERSES = 99

  def sing
    verses(MAX_VERSES, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|i|
      verse(i) << "\n"
    }.join
  end

  def verse(number)
    Verse.new(number).to_s
  end

end



class Verse

  attr_reader :number

  def initialize(number)
    @number   = number
  end

  def to_s
    bottle_number = number.to_bottle_number

    "#{bottle_number.how_many.capitalize} #{bottle_number.container} of beer on the wall, "+
    "#{bottle_number.how_many} #{bottle_number.container} of beer.\n"+
    "#{bottle_number.action}, "+
    "#{bottle_number.next.how_many} #{bottle_number.next.container} of beer on the wall.\n"
  end

end

class Fixnum
  def to_bottle_number
    case self
    when 0
      BeerSongBottleNumber0.new(self)
    when 1
      BeerSongBottleNumber1.new(self)
    else
      BeerSongBottleNumber.new(self)
    end
  end
end


class BeerSongBottleNumber

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def container
    'bottles'
  end

  def how_many
    number.to_s
  end

  def pronoun
    'one'
  end

  def pred
    number.pred
  end

  def next
    pred.to_bottle_number
  end

end

class BeerSongBottleNumber0 < BeerSongBottleNumber

  def action
    'Go to the store and buy some more'
  end

  def how_many
    'no more'
  end

  def pred
    99
  end
end

class BeerSongBottleNumber1 < BeerSongBottleNumber
  def container
    'bottle'
  end

  def pronoun
    'it'
  end

end
