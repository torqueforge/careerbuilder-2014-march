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
    "#{current_how_many(verse_number).capitalize} #{current_container(verse_number)} of beer on the wall, "+
    "#{current_how_many(verse_number)} #{current_container(verse_number)} of beer.\n"+
    "#{action(verse_number)}, "+
    "#{remaining_how_many(verse_number)} #{remaining_container(verse_number)} of beer on the wall.\n"
  end

  private

  def action(verse_number)
    case verse_number
    when 0
      'Go to the store and buy some more'
    else
      "Take #{pronoun(verse_number)} down and pass it around"
    end
  end

  def current_container(verse_number)
    case verse_number
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def remaining_container(verse_number)
    case verse_number
    when 2
      'bottle'
    else
      'bottles'
    end
  end

  def current_how_many(verse_number)
    case verse_number
    when 0
      'no more'
    else
      verse_number.to_s
    end
  end

  def remaining_how_many(verse_number)
    case verse_number
    when 0
      MAX_VERSES
    when 1
      'no more'
    else
      verse_number - 1
    end
  end

  def pronoun(verse_number)
    case verse_number
    when 1
      'it'
    else
      'one'
    end
  end
end
