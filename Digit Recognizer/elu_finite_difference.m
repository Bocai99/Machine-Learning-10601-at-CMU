function [input_od_approx] = elu_finite_difference(output, input, h)

%input_od_approx = zeros(size(input.data));
%output=elu_forward(input, layer);

%input_h.height = input.height;
%input_h.width = input.width;
%input_h.channel = input.channel;
%input_h.batch_size = input.batch_size;

input_h.data = input.data + h;

output_h = elu_forward(input_h, layer);

input_od_approx = ((output_h.data - output.data) .* output.diff)/h;

end
