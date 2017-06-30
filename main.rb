require_relative 'board'
require_relative 'square'

def knight_moves(start, target)
 board = Board.new
 board.path(start)
 shortest = board.shortest_path(start, target)
 puts "Move accomplished in #{(shortest.length) -1} moves"
 puts "Here is the path:"
 shortest.each do |square|
   puts square.to_s
 end
end

knight_moves([3,3],[4,3])
