class House
  def recite
    (1..pieces.length).map {|i| line(i) << "\n"}.join
  end

  def line(number)
    "This is %s.\n" % pieces[0...number].reverse.join(' ')
  end

  private

  def pieces
    [
      'the house that Jack built',
      'the malt that lay in',
      'the rat that ate',
      'the cat that killed',
      'the dog that worried',
      'the cow with the crumpled horn that tossed',
      'the maiden all forlorn that milked',
      'the man all tattered and torn that kissed',
      'the priest all shaven and shorn that married',
      'the rooster that crowed in the morn that woke',
      'the farmer sowing his corn that kept',
      'the horse and the hound and the horn that belonged to'
    ]
  end
end
