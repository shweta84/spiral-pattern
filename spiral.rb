class Spiral

  def self.pattern(num)
    col = (num/2.0).ceil - 1
    row = num.odd? ? col : col+1
    matrix = {}
    num.times {|i| matrix.merge!(i => Array.new(num))}
    max_travel = 1
    current_num = 1
    max_num = num*num
    matrix[row][col] = current_num
    next_route = nil

    while current_num < max_num
      2.times do
        next_route = set_next_route(next_route)
        max_travel.times do
          break if current_num == max_num
          row, col = set_index(next_route, row, col)
          matrix[row][col] = current_num+=1
        end
      end
      max_travel+=1
    end

    matrix.each_value do |v|
      puts v.map {|i| format("%0#{max_num.to_s.size}d",i) }.join(' ')
    end
  end

  def self.set_index(symbol, row, col)
    case symbol
      when :R
        [row, col+1]
      when :U
        [row-1, col]
      when :L
        [row, col-1]
      when :D
        [row+1, col]
    end
  end

  def self.set_next_route(route)
    case route
      when :R
        :U
      when :U
        :L
      when :L
        :D
      when :D
        :R
      else
        :R
    end
  end

  puts "Enter a number"
  Spiral.pattern(gets.chomp.to_i)

end
