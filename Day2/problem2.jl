# Getting the input
function get_input(filepath::String)
    input::String = readline(filepath)
    ranges::Vector{String} = String.(split(input, ","))
    answer::Int = 0 # Answer to day 2 of advent of code
    for range::String in ranges
        min_int::Int, max_int::Int = parse.(Int, String.(split(range, "-")))
        for i in [min_int:max_int;]
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
        end
    end
    return answer
end

get_input("Day2/input.txt")

print("right answer: 11323661261")