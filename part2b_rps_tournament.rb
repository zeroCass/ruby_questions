# Part 2: Rock-Paper-Scissors
#
# (b) A rock, paper, scissors tournament is encoded as a bracketed array of games - that is, each
# element can be considered its own tournament.
# [
# [
#  [ ["Kristen", "P"], ["Dave", "S"] ],
#  [ ["Richard", "R"], ["Michael", "S"] ],
# ],
# [
#  [ ["Allen", "S"], ["Omer", "P"] ],
#  [ ["David E.", "R"], ["Richard X.", "P"] ]
# ]
# ]
# Under this scenario, Dave would beat Kristen (S>P), Richard would beat Michael (R>S), and
# then Dave and Richard would play (Richard wins since R>S); similarly, Allen would beat Omer,
# Richard X would beat David E., and Allen and Richard X. would play (Allen wins since S>P);
# and finally Richard would beat Allen since R>S, that is, continue until there is only a single
# winner.
# ● Write a method rps_tournament_winner that takes a tournament encoded as a
# bracketed array and returns the winner (for the above example, it should
# return [“Richard”, “R”]).
# ● Tournaments can be nested arbitrarily deep, i.e., it may require multiple rounds to get to
# a single winner. You can assume that the initial array is well formed (that is, there are
# 2^n players, and each one participates in exactly one match per round).

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


tournament = [
    [
        [ ["Kristen", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"], ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]



def rps_game_winner(game)
    # [[name, play], [name, play]]
    win_conditions = {"R" => "S", "S" => "P", "P" => "R"}
    raise WrongNumberOfPlayersError unless game.length == 2
    
    # check player strategy
    game.each { |player| raise NoSuchStrategyError unless ["P", "R", "S"].include?(player[1]) }
    
    
    # desctruct the array into two players -> position[0] = player name, poistion[1] = player strategy
    player_one, player_two = game  

    if player_one[1] == player_two[1] || player_two[1] == win_conditions[player_one[1]]
        return player_one
    else
        return player_two
    end
end




def rps_tournament(tournament)

    # check if is a pair [[player1], [player2]]
    if tournament[0][0].is_a?(String)
        # return the winner of the pair
        return rps_game_winner(tournament)
    end
    
    # otherwise execute recursion
    return rps_game_winner([rps_tournament(tournament[0]), rps_tournament(tournament[1])])
end



puts "#{rps_tournament(tournament)}"
