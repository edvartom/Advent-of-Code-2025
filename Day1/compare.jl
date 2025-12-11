"For each line in the txt-file, update the position. Count the zeros and find the password"
function change_position_comp(filepath::String, starting_point::Int = 50)
    current_point::Int = starting_point
    password1::Int = 0
    password2::Int = 0
    password3::Int = 0
    i::Int = 0
    for rotation::String in eachline(filepath)
        i += 1
        # First function
        current_point, counter = new_position(current_point, rotation)
        password1 += counter
        if current_point == 0
            password1 += 1
        end
        # Second function
        current_point, counter = new_position_mod(current_point, rotation)
        password2 += counter
        if current_point == 0
            password2 += 1
        end
        # Third function
        current_point, counter = new_position_log(current_point, rotation)
        password3 += counter
        if current_point == 0
            password3 += 1
        end
        if password1 != password2
            print("i=", i, "\t")
            println("password1 is ", password1, " but password2 is ", password2)
            break
        elseif password1 != password3
            print("i=", i, "\t")
            println("password1 is ", password1, " but password3 is ", password3)
            break
        elseif password2 != password3
            print("i=", i, "\t")
            println("password2 is ", password2, " but password3 is ", password3)
            break
        end
    end
    return password1, password2, password3
end

change_position_comp("Day1/input1.txt")