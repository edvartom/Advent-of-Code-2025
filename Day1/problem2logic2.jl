function new_position_and_count_log2(old_position::Int, rotation::String)
    direction::Char = rotation[1]
    nr_of_steps::Int = parse(Int, rotation[2:end])
    new_pos = new_position_log2(old_position, direction, nr_of_steps)
    counter = count_log2(old_position, direction, nr_of_steps)
    return new_pos, counter
end

function new_position_log2(old_position::Int, direction::Char, nr_of_steps::Int)
    new_pos::Int = 0
    steps_left::Int = nr_of_steps % 100
    if direction == 'L'
        if steps_left <= old_position
            new_pos = old_position - steps_left
        else
            new_pos = old_position - steps_left + 100
        end
    else
        if steps_left < (100 - old_position)
            new_pos = old_position + steps_left
        else
            new_pos = old_position + steps_left - 100
        end
    end
end

function count_log2(old_position::Int, direction::Char, nr_of_steps::Int)
    steps_left = nr_of_steps % 100
    counter::Int = div(nr_of_steps, 100)
    if direction == 'L' && steps_left >= old_position && old_position != 0
        counter += 1
    elseif direction == 'R' && steps_left >= (100 - old_position) && old_position != 0
        counter += 1
    end
    return counter
end