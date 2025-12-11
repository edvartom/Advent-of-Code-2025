### This file needs to be looked over, since I deleted the changes

"Takes a rotation and a current position, and returns the new position."
function new_position(old_position::Int,
                      rotation::String,
                      nr_of_positions::Int = 100,
                      min_position::Int = 0,
                      max_position::Int = 99)
    nr_of_steps::Int = parse(Int, rotation[2:end])
    new_position::Int = min_position
    counter::Int = 0
    if rotation[1] == 'L'
        new_position = old_position - nr_of_steps
        #println("rotation[1]=", rotation[1], "=L")
    else
        new_position = old_position + nr_of_steps
        #println("rotation[1]=", rotation[1], "=R")
    end
    if new_position == 0
        counter += 1
        #println("counter+=1")
    else
        while new_position < min_position
            #println("new_position < min_position:$new_position < $min_position")
            new_position += nr_of_positions
            counter += 1
        end
        while new_position > max_position
            #println("new_position > max_position")
            new_position -= nr_of_positions
            counter += 1
        end
    end
    print("position1: ", new_position)
    return new_position, counter
end

"For each line in the txt-file, update the position. Count the zeros and find the password"
function change_position(filepath::String, starting_point::Int = 50)
    current_point::Int = starting_point
    password::Int = 0
    for rotation::String in eachline(filepath)
        current_point, counter = new_position(current_point, rotation)
        password += counter
        if current_point == 0
            password += 1
        end
    end
    return password
end

change_position("Day1/input1.txt")
