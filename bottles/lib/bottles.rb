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
    bottle_number =
      case number
      when 0
        BeerSongBottleNumber0.new(number)
      when 1
        BeerSongBottleNumber1.new(number)
      else
        BeerSongBottleNumber.new(number)
      end

    "#{bottle_number.how_many.capitalize} #{bottle_number.container} of beer on the wall, "+
    "#{bottle_number.how_many} #{bottle_number.container} of beer.\n"+
    "#{bottle_number.action}, "+
    "#{bottle_number.next.how_many} #{bottle_number.next.container} of beer on the wall.\n"
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

  def next
    pred = number.pred

    case pred
    when -1
      BeerSongBottleNumber.new(99)
    when 0
      BeerSongBottleNumber0.new(pred)
    when 1
      BeerSongBottleNumber1.new(pred)
    else
      BeerSongBottleNumber.new(pred)
    end
  end

end

class BeerSongBottleNumber0 < BeerSongBottleNumber

  def action
    'Go to the store and buy some more'
  end

  def how_many
    'no more'
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


