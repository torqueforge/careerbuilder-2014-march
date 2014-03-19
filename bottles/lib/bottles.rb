require_relative 'miracle'

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

  def verse(verse_number)
    bottle_number = verse_number.to_beer_bottle_number
    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n"+
    "#{bottle_number.action}, "+
    "#{bottle_number.next} of beer on the wall.\n"
  end
end
