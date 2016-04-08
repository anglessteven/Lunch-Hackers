tests = gets.strip.to_i
(1..tests).each do
    blocks = *(1..gets.strip.to_i)
    # kitty is false, katty is true
    # starting with an inverse turn
    turn = true;
    turn = false if blocks.size == 1
    while blocks.size > 1 do
      turn = !turn
      if blocks.size == 2
        if turn == false
          choices = [blocks[0], blocks[1]] if (blocks[0] - blocks[1])%3 == (1 || 0)
          choices = [blocks[1], blocks[0]] if (blocks[1] - blocks[0])%3 == (1 || 0)
        elsif turn == true
          choices = [blocks[0], blocks[1]] if (blocks[0] - blocks[1])%3 == (2 || 0)
          choices = [blocks[1], blocks[0]] if (blocks[1] - blocks[0])%3 == (2 || 0)
        end
      end
      choices = blocks.sample(2) if choices == nil
      choices.each do |choice|
          blocks.delete_at(blocks.index(choice))
      end
      blocks << choices[0] - choices[1]
      choices = nil
    end
    case blocks[0]%3
      when 0
        puts "Kitty" if turn == false
        puts "Katty" if turn == true
      when 1
        puts "Kitty"
      when 2
        puts "Katty"
    end
end
