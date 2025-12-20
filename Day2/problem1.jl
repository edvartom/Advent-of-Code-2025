function get_invalid_ids1(filepath::String)
    input::String = readline(filepath)
    ranges::Vector{String} = String.(split(input, ","))         # Make a list of all ranges
    sum_ids::Int = 0 # Sum of invalid ids
    for range::String in ranges
        minmax_val = parse.(Int, String.(split(range, "-")))
        min_val::Int, max_val::Int = minmax_val                 # Finding minimum and maximum value in each range
        for i in [min_val:max_val;]
            i_str::String = string(i)
            split_idx::Int = div(length(i_str) + 1, 2)          # Split index
            # If the first and the last part of the number are equal ...
            if i_str[1:split_idx] == i_str[split_idx + 1:length(i_str)]
                sum_ids += i                                    # This is an invalid ID
            end
        end
    end
    return sum_ids
end

get_invalid_ids1("Day2/input.txt")