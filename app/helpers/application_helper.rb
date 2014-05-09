module ApplicationHelper

  QUOTES = [
    'The one and only troll tracking tool!',
    'Be afraid, be very afraid!',
    'The asshole tracker for the 21st century!',
    'Winter is coming!',
    'All your base are belong to us!',
    'Machete don\'t troll.',
    'Are you not entertained! Are you not entertained! Is this not why you are here!',
    'Nuke \'em!',
    'Hail to the king, baby.',
    'I see dead people. (trolls!)',
    'Yippie kay-yay, motherfucker.',
    'He slimed me.',
    'Don\'t cross the streams!',
    'War. War never changes.',
    'But our princess is in another castle!',
    'The cake is a lie.',
    'Do a barrel roll!',
    'FINISH HIM!',
    'No more Mr. Nice Gaius!',
  ].freeze

  def random_quote
    QUOTES.sample
  end

end
