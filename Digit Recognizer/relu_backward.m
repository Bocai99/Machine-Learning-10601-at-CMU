function [input_od] = relu_backward(output, input, layer)

% Replace the following line with your implementation.

input_od = output.diff;

for i=1:input.height
for j=1:size(input.data,2)

if 0 > input.data(i,j)
input_od(i,j) = 0;
end

end
end

end
