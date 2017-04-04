require_relative 'mancala'
require_relative 'player'
require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    counter = 0
    until counter == 14
      4.times do
        @cups[counter] << :stone unless counter == 6 || counter == 13
      end
      counter += 1
    end
  end

  def valid_move?(start_pos)
    if start_pos == 6 || start_pos > 12 || start_pos < 1
      raise RuntimeError.new("Invalid starting cup")
    end
  end

  def make_move(start_pos, current_player_name)
    current_stones = @cups[start_pos].length
    current_pos = start_pos
    @cups[start_pos] = []
    until current_stones.zero?
      if current_pos == 13
        current_pos = 0
      elsif current_pos == 12 && current_player_name == @name1
        current_pos = 0
      elsif current_pos == 5 && current_player_name == @name2
        current_pos = 7
      else
        current_pos += 1
      end
      @cups[current_pos] << :stone
      current_stones -= 1
    end
    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 13 || ending_cup_idx == 6
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all?(&:empty?)
      return true
    elsif @cups[7..12].all?(&:empty?)
      return true
    end
    false
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    return @name1 if @cups[6].length > @cups[13].length
    @name2
  end
end
