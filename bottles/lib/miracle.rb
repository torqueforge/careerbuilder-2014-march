require 'delegate'

class Fixnum
  def to_bottle_number
    if Object.const_defined?("BottleNumber#{self}")
      Object.const_get("BottleNumber#{self}").new(self)
    else
      BottleNumber.new(self)
    end
  end

  def to_beer_bottle_number
    if Object.const_defined?("BeerSongNumber#{self}")
      Object.const_get("BeerSongNumber#{self}").new(self.to_bottle_number)
    else
      BeerSongNumber.new(self.to_bottle_number)
    end
  end
end

class BottleNumber < SimpleDelegator
  def to_s
    "#{how_many} #{container}"
  end

  def how_many
    __getobj__.to_s
  end

  def container
    'bottles'
  end
end

class BottleNumber1 < BottleNumber
  def container
    'bottle'
  end
end

class BottleNumber0 < BottleNumber
  def how_many
    'no more'
  end
end

class BottleNumber6 < BottleNumber
  def how_many
    1
  end

  def container
    'six-pack'
  end
end

class BeerSongNumber < SimpleDelegator
  def action
    "Take #{pronoun} down and pass it around"
  end

  def next
    pred.to_beer_bottle_number
  end

  private

  def pronoun
    'one'
  end
end

class BeerSongNumber1 < BeerSongNumber
  private

  def pronoun
    'it'
  end
end

class BeerSongNumber0 < BeerSongNumber
  def action
    "Go to the store and buy some more"
  end

  def pred
    99
  end
end

class BeerSongNumber6 < BeerSongNumber
  private

  def pronoun
    'a beer'
  end
end
