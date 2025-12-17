"""
# Arguments

- `old_position::Integer`: The previous position of the dial.
- `rotation`: The rotation given to get to the next position.

# Returns
- `::Integer`: The new position of the dial.
- `::Integer`: The number of times the dial pointed at zero to get to the new position.
"""
function new_position_and_count_log2(old_position::Int, rotation::String)
    direction::Char = rotation[1]
    nr_of_steps::Int = parse(Int, rotation[2:end])
    new_pos = new_position_log2(old_position, direction, nr_of_steps)
    counter = count_log2(old_position, direction, nr_of_steps)
    return new_pos, counter
end

"Finds the new position of the dial"
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
    return new_pos
end

"""
Counts the number of times the dial points at zero 
for a given initial position and rotation.
"""
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

"""
For each line in the txt-file, update the position.
Count the zeros and find the password
"""
function change_position_comp(filepath::String, starting_point::Int = 50)
    current_point1::Int = starting_point
    password1::Int = 0
    for rotation::String in eachline(filepath)
        current_point1, counter = new_position_and_count_log2(current_point1, rotation)
        password1 += counter
    end
    return password1
end

change_position_comp("Day1/input1.txt")