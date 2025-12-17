"Finds the new position of the dial"
function find_new_position(old_position::Int, direction::Char, nr_of_steps::Int)
    new_position::Int = 0
    steps_left::Int = nr_of_steps % 100
    if direction == 'L'
        if steps_left <= old_position
            new_position = old_position - steps_left
        else
            new_position = old_position - steps_left + 100
        end
    else
        if steps_left < (100 - old_position)
            new_position = old_position + steps_left
        else
            new_position = old_position + steps_left - 100
        end
    end
    return new_position
end

"""
Counts the number of times the dial points at zero 
for a given initial position and rotation.
"""
function count(old_position::Int, direction::Char, nr_of_steps::Int)
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
function find_password(filepath::String, starting_position::Int = 50)
    current_position::Int = starting_position
    password::Int = 0
    for rotation::String in eachline(filepath)
        # Extract infromation from the rotation
        direction::Char = rotation[1]
        nr_of_steps::Int = parse(Int, rotation[2:end])
        # Update password
        counter::Int = count(current_position, direction, nr_of_steps)
        password += counter
        # Find new position
        current_position = find_new_position(current_position, direction, nr_of_steps)
    end
    return password
end

find_password("Day1/input.txt")