class Bottles

  def verse arg1
    case arg1
    when 2
       "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
       "#{arg1} bottles of beer on the wall, #{arg1} bottles of beer.\nTake one down and pass it around, #{arg1-1} bottles of beer on the wall.\n"
    end
  end

  def verses(arg1, arg2)
    arg1.downto(arg2).map {|number|
    verse(number) << "\n"}.join
  end

  def sing
   verses(99,0)
  end
end