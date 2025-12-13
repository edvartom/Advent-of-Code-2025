"For each line in the txt-file, update the position. Count the zeros and find the password"
function change_position_comp(filepath::String, starting_point::Int = 50)
    current_point1::Int = starting_point
    current_point2::Int = starting_point
    current_point3::Int = starting_point
    password1::Int = 0
    password2::Int = 0
    password3::Int = 0
    i::Int = 0
    for rotation::String in eachline(filepath)
        i += 1
        # First function
        current_point1, counter = new_position_and_count_log2(current_point1, rotation)
        password1 += counter
        # Second function
        current_point2, counter = new_position_mod(current_point2, rotation)
        password2 += counter
        # Third function
        current_point3, counter = new_position_log(current_point3, rotation)
        password3 += counter
        println("position1: ", current_point1, " position2: ", current_point2, " position3: ", current_point3)
        # if password1 != password2
        #     print("i=", i, "\t")
        #     println("password1 is ", password1, " but password2 is ", password2, ", password3 is ", password3)
        #     break
        # elseif password1 != password3
        #     print("i=", i, "\t")
        #     println("password1 is ", password1, " but password3 is ", password3, ", password2 is ", password2)
        #     break
        # elseif password2 != password3
        #     print("i=", i, "\t")
        #     println("password2 is ", password2, " but password3 is ", password3, ", password1 is ", password1)
        #     break
        # end
    end
    return password1, password2, password3
end

change_position_comp("Day1/input1.txt")