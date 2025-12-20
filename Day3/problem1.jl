function find_total_output_joltage(filepath::String)
    total_output_joltage::Int = 0
    for line in eachline(filepath)
        int_vec::Vector{Int} = parse.(Int, String.(split(line, "")))    # Splitting each line into a vector of ints 
        max_idx1::Int = argmax(int_vec[begin:end-1])                    # Index of the maximum digit, that is not the last digit
        first_digit::Int = int_vec[max_idx1]
        rest_of_ints::Vector{Int} = int_vec[max_idx1+1:end]             # The last digit must be the largest digit within the rest of int_vec
        max_idx2::Int = argmax(rest_of_ints)                            # Index of the second maximum digit
        second_digit::Int = rest_of_ints[max_idx2]
        largest_nr::Int = parse(Int, string(first_digit)*string(second_digit))
        total_output_joltage += largest_nr
    end
    return total_output_joltage
end

find_total_output_joltage("Day3/input.txt")