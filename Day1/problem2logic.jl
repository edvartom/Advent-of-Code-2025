"Takes a rotation and a current position, and returns the new position."
function new_position_log(old_position::Int,
                      rotation::String,
                      )
    nr_of_steps::Int = parse(Int, rotation[2:end])
    new_position::Int = 0
    counter::Int = 0
    nr_of_rounds::Int = 0
    if rotation[1] == 'L'
        if nr_of_steps < old_position
            new_position = old_position - nr_of_steps
        elseif nr_of_steps == old_position
            new_position = 0
            counter += 1
        else
            nr_of_steps -= old_position
            counter +=1
            nr_of_rounds = div(nr_of_steps, 100)
            counter += nr_of_rounds
            steps_left = nr_of_steps % 100
            new_position = 100 - steps_left
        end
    else
        if nr_of_steps < (100 - old_position)
            new_position = old_position + nr_of_steps
        elseif nr_of_steps == (100 - old_position)
            new_position = 0
            counter += 1
        else
            nr_of_steps -= (100 - old_position)
            counter += 1
            nr_of_rounds = div(nr_of_steps, 100)
            counter += nr_of_rounds
            new_position = nr_of_steps % 100
        end
    end
    println(", position3: ", new_position)
    return new_position, counter
end

function find_password_log(filepath::String, start_position::Int = 50)
    current_position::Int = start_position
    password::Int = 0
    for rotation::String in eachline(filepath)
        current_position, counter = new_position_log(current_position, rotation)
        password += counter
    end
    return password
end

find_password_log("Day1/input1.txt")