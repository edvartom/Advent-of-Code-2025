function get_invalid_ids2(filepath::String)
    input::String = readline(filepath)
    ranges::Vector{String} = String.(split(input, ","))         # Make a list of all ranges
    sum_ids::Int = 0 # Sum of invalid ids
    for range::String in ranges
        minmax_val = parse.(Int, String.(split(range, "-")))
        min_val::Int, max_val::Int = minmax_val                 # Finding minimum and maximum value in each range
        for i in [min_val:max_val;]
            i_str::String = string(i)
            # For each n between 1 and lenght(current number)/2 ...
            for n in [1:div(length(i_str), 2);]
                # ... split current number for each n'th character, and put it into a list
                parts::Vector{String} = [i_str[j:min(j + n - 1, end)] for j in 1:n:length(i_str)]
                if allequal(parts)                              # If all parts are equal
                    sum_ids += i                                # The number is an invalid ID
                    break                                       # Go on to the next number
                end
            end
        end
    end
    return sum_ids
end

get_invalid_ids2("Day2/input.txt")