require_relative 'square'
class Board
  attr_accessor :squares, :visited

  def initialize
    @visited = []
    @squares = []
    @edge = {}
    (0..7).each do |x|
      (0..7).each do |y|
        @squares << Square.new([x,y])
      end
    end
  end

 def square_coordinate(coordinate)
   @squares.each {|i| return i if i.coordinate == coordinate}
 end

 def path(start)
   queue = []
   queue << square_coordinate(start)
   @visited << square_coordinate(start)
   while queue.any?
     current = queue.shift
     current.neighbors.each do |square|   #if you accidentally allowed for neighbors outside of the board you won't have a good time
       if !@visited.include?(square_coordinate(square))
         queue << square_coordinate(square)
         @visited << square_coordinate(square)
         @edge[square_coordinate(square)] = current
       end
     end
   end
 end

 def shortest_path(start, target)
   path = []
   current = square_coordinate(target)
   while current != square_coordinate(start)    #pro tip dont try and compare the coordinate array with the actual data stucture, you will get stuck
     path.unshift(current)
     current = @edge[current]
   end
   path.unshift(square_coordinate(start))
 end

end
