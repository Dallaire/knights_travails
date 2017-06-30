class Square
  attr_accessor :coordinate, :neighbors

  def initialize(coordinate)
    @coordinate = coordinate
    @neighbors = []
    generate_neighbors
  end

  def generate_neighbors
    moves = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]

    moves.each do |x,y|
      if legal(@coordinate, [x,y])
        @neighbors << ([@coordinate[0]+x, @coordinate[1]+y])
      end
    end
  end

  def legal(location, move)
    if location == nil || move == nil || location.length != 2 ||  move.length != 2
      return false
    end
    if location[0] + move[0] >=0 and location[0] + move[0] <8 and location[1] + move[1] >=0 and location[1] + move[1] <8
      return true
    end
    return false
  end

  def to_s
    return @coordinate.to_s
  end
end
