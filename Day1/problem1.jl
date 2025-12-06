"Takes a rotation and a current position, and returns the new position."
function new_position(old_position::Int, rotation::String)
    println(rotation)
    nr_of_steps::Int = parse(Int, rotation[2:end])
    println(rotation)
    new_position::Int = 0
    println(typeof(rotation[1]), typeof('L'))
    if rotation[1] == 'L'
        new_position = old_position - nr_of_steps
    else
        print("Helo")
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