function [output] = elu_forward(input, layer)
output.height = input.height;
output.width = input.width;
output.channel = input.channel;
output.batch_size = input.batch_size;

alpha = 1.0;
% Replace the following line with your implementation.
%output.data = zeros(size(input.data));

output.data = input.data;

for i=1:size(input.data,1)
for j=1:size(input.data,2)
for k=1:size(input.data,3)
if 0>input.data(i,j,k)
output.data(i,j,k)= alpha * (exp(input.data(i,j,k))-1);
end
end
end


end
