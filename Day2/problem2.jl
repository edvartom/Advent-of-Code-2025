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
            equal::Bool = false
            for n in [1:div(length(i_str), 2);]
                parts::Vector{String} = [i_str[j:min(j + n - 1, end)] for j in 1:n:length(i_str)]
                if allequal(parts)
                    equal = true
                end
            end
            if equal
                answer += i
            end
            i += 1
        end
    end
    return answer
end

get_input("Day2/input.txt")