"Takes a rotation and a current position, and returns the new position."
function new_position(old_position::Int, rotation::String)
    nr_of_steps::Int = parse(Int, rotation[2:end])
    new_position::Int = 0
    if rotation[1] == 'L'
        new_position = old_position - nr_of_steps
    else
        new_position = old_position + nr_of_steps
    end
    while new_position < 0
        new_position += 100
    end
    while new_position > 99
        new_position -= 100
    end
    return new_position
end

"For each line in the txt-file, update the position. Count the zeros and find the password"
function change_position(filepath::String)
    current_point::Int = 50
    password::Int = 0
    for rotation::String in eachline(filepath)
        current_point = new_position(current_point, rotation)
        if current_point == 0
            password += 1
        end
    end
    return password
end

change_position("Day1/input1.txt")
