function [ output_args ] = compute_thresh( threshold_array, value )

output_args = 0;

for i=2:length(threshold_array)
    if(value > threshold_array(i))
        output_args=i;
    end
end

if(output_args==0)
    output_args = 1;
end
end

