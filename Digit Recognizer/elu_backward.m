function [input_od] = elu_backward(output, input, layer)

alpha = 1.0;
% Replace the following line with your implementation.
input_od = alpha * (output.diff .* exp(input.data));

for i=1:size(input.data,1)
for j=1:size(input.data,2)
for k=1:size(input.data,3)
if 0 < input.data(i,j,k)
input_od(i,j,k) = output.diff(i,j,k);
end
end
end
end

end
