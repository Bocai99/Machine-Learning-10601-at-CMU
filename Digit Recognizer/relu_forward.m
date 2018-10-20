function [output] = relu_forward(input, layer)
output.height = input.height;
output.width = input.width;
output.channel = input.channel;
output.batch_size = input.batch_size;

% Replace the following line with your implementation.
%output.data = zeros(size(input.data));

output.data = input.data;

for i=1:input.height
for j=1:size(input.data,2)
if 0>input.data(i,j)
output.data(i,j)=0;
end
end
end

end
