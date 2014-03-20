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



require 'forwardable'

class Verse

  extend Forwardable
  delegate [:current_container, :current_how_many, :action, :remaining_how_many, :remaining_container] => :strategy

  attr_reader :strategy

  def initialize(number)
    @strategy = SuitableVerseStrategy.for(number)
  end

  def to_s
    "#{current_how_many.capitalize} #{current_container} of beer on the wall, "+
    "#{current_how_many} #{current_container} of beer.\n"+
    "#{action}, "+
    "#{remaining_how_many} #{remaining_container} of beer on the wall.\n"
  end

end



class VerseStrategy
  MAX_VERSES = 99

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def current_container
    'bottles'
  end

  def remaining_container
    'bottles'
  end

  def current_how_many
    number.to_s
  end

  def remaining_how_many
    number - 1
  end

  def pronoun
    'one'
  end

end

class VerseStrategy0 < VerseStrategy

  def action
    'Go to the store and buy some more'
  end

  def current_how_many
    'no more'
  end

  def remaining_how_many
    MAX_VERSES
  end

end

class VerseStrategy1 < VerseStrategy

  def current_container
    'bottle'
  end

  def remaining_how_many
    'no more'
  end

  def pronoun
    'it'
  end

end

class VerseStrategy2 < VerseStrategy

  def remaining_container
    'bottle'
  end
end



class SuitableVerseStrategy

  def self.for(number)
    if Object.const_defined?("VerseStrategy#{number}")
      Object.const_get("VerseStrategy#{number}")
    else
      VerseStrategy
    end.new(number)
  end
end
