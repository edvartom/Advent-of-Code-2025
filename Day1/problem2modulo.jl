"Takes a rotation and a current position, and returns the new position."
function new_position_mod(old_position::Int,
                      rotation::String,
                      nr_of_positions::Int = 100,
                      )
    nr_of_steps::Int = parse(Int, rotation[2:end])
    new_position::Int = 0
    counter::Int = 0
    if rotation[1] == 'L'
        new_position = old_position - nr_of_steps
        counter += div(new_position, nr_of_positions)
        new_position %= nr_of_positions
        if new_position < 0
            new_position += nr_of_positions
            counter += 1
        elseif new_position == 0
            counter += 1
        end
    else
        new_position = old_position + nr_of_steps
        counter += div(new_position, nr_of_positions)
        new_position %= nr_of_positions
        if new_position == 0
            counter += 1
        end
    end
    print(", position2: ", new_position)
    return new_position, counter
end

"For each line in the txt-file, update the position. Count the zeros and find the password"
function change_position_mod(filepath::String, starting_point::Int = 50)
    i::Int = 0
    current_point::Int = starting_point
    password::Int = 0
    for rotation::String in eachline(filepath)
        current_point, counter = new_position_mod(current_point, rotation)
        password += counter
        i += 1
        if i in [110, 111]
            print("rotation: ", rotation, "\t")
            print("position: ", current_point, "\t")
            println("password: ", password)
        end
    end
    return password
end

change_position_mod("Day1/input1.txt")