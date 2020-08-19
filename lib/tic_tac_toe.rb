require 'pry'
class TicTacToe
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, player_token = "X")
    @board[index] = player_token
  end
  
  def position_taken?(index)
    if @board[index] != " "
      true
    else
      false
    end
  end
  
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8)
      true
    else
      false
    end
  end
  

  def turn_count
    @board.count{|x| x != " "}
  end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Where would you like to go? Select 1-9"
    user_input = gets
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end
  
  def full?
    if !@board.include?(" ")
      true
    end
  end
  
  def draw?
    if !won? && full?
      true
    else
      false
    end
  end
  
  def over?
    if draw? || won?
      true
    end
  end
  
  def winner
    winner = won?
    # binding.pry
    if @board[winner[0]] == "X"
      "X"
    elsif @board[winner[0]]  == "O"
      "O"
    else
      nil
    end
  end
  
  def play
    until over? do
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's game!"
    end
  end
      
      
    
  
  
    
  
  
    
  
  
    
  
end