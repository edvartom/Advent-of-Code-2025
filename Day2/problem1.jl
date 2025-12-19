# Getting the input
function get_input(filepath::String)
    input::String = readline(filepath)
    # Make a list of all ranges
    ranges::Vector{String} = String.(split(input, ","))
    answer::Int = 0
    for range::String in ranges
        min_int::Int, max_int::Int = parse.(Int, String.(split(range, "-")))
        i::Int = min_int
        while i < max_int
            i_str::String = string(i)
            if i_str[1:div(length(i_str) + 1, 2)] == i_str[div(length(i_str) + 1, 2) + 1:length(i_str)]
                answer += i
                println(i)
            end
            i += 1
        end
    end
    return answer
end

get_input("Day2/input.txt")