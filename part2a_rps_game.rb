# Part 2: Rock-Paper-Scissors
#
# In a game of rock-paper-scissors, each player chooses to play Rock (R), Paper (P), or Scissors
# (S). The rules are: Rock beats Scissors, Scissors beats Paper, but Paper beats Rock.
# A rock-paper-scissors game is encoded as a list, where the elements are 2-element lists that
# encode a player’s name and a player’s strategy.
# [ [ "Kristen", "P" ], [ "Pam", "S" ] ]
# # => returns the list ["Pam", "S"] wins since S>P
# (a) Write a method rps_game_winner that takes a two-element list and behaves as follows:
# - If the number of players is not equal to 2, raise WrongNumberOfPlayersError
# - If either player's strategy is something other than "R", "P" or "S" (case-insensitive), raise
# NoSuchStrategyError
# - Otherwise, return the name and strategy of the winning player. If both players use the same
# strategy, the first player is the winner.
# We'll get you started:
# class WrongNumberOfPlayersError < StandardError ; end
# class NoSuchStrategyError < StandardError ; end
# def rps_game_winner(game)
# raise WrongNumberOfPlayersError unless game.length == 2
# # your code here
# end


class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


def rps_game_winner(game)
    win_conditions = {"R" => "S", "S" => "P", "P" => "R"}

    raise WrongNumberOfPlayersError unless game.length == 2
    # check player strategy
    game.each { |player| raise NoSuchStrategyError unless ["P", "R", "S"].include?(player[1]) }

    # desctruct the array into two players -> position[0] = player name, poistion[1] = player strategy
    player_one, player_two = game  

    if player_one[1] == player_two[1] || player_two[1] == win_conditions[player_one[1]]
        return "#{player_one[0]} wins!"
    else
        return "#{player_two[0]} wins!"
    end
end



puts rps_game_winner([[ "Kristen", "P" ], [ "Pam", "S" ]]) #Pam wins
puts rps_game_winner([[ "Kristen", "R" ], [ "Pam", "S" ]]) #Kristen wins
puts rps_game_winner([[ "Kristen", "S" ], [ "Pam", "P" ]]) #Kristen wins
puts rps_game_winner([[ "Kristen", "R" ], [ "Pam", "P" ]]) #Pam wins
puts rps_game_winner([[ "Kristen", "S" ], [ "Pam", "S" ]]) #Kristen wins