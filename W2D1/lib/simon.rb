class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(3)
    system 'clear'
    if @seq == require_sequence
      system 'clear'
      round_success_message
      @sequence_length += 1
    else
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    puts 'Watch closely!'
    puts @seq.to_s
  end

  def require_sequence
    puts 'Your turn! Enter a space between each color'
    input = gets.chomp
    answer = []
    input.split(' ').each { |color| answer << color.to_s }
    answer
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts 'Right on!'
  end

  def game_over_message
    puts 'Game over!'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
