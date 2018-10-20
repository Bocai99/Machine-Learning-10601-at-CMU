function [output] = inner_product_forward(input, layer, param)

output.height = input.height;
output.width = input.width;
output.channel = input.channel;
output.batch_size = input.batch_size;

d = size(input.data, 1);
k = size(input.data, 2);
n = size(param.w, 2);

batch_size = input.batch_size;

% Replace the following line with your implementation.
%output.data = zeros([n, k]);
    
output.data = (param.w)'*input.data

for i=1:k
    
output.data(:,i)=output.data(:,i) + (param.b)';

end