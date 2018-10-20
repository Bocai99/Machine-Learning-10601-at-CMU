function [input_od] = pooling_layer_backward(output, input, layer)


h_in = input.height;
w_in = input.width;
c = input.channel;
k = layer.k;
batch_size = input.batch_size;

input_n.height = h_in;
input_n.width = w_in;
input_n.channel = c;

h_out = output.height;
w_out = output.width;

% Replace the following line with your implementation.
input_od = zeros(size(input.data));

for n = 1:batch_size
    input_n.data = input.data(:, n);    
    col = im2col_conv(input_n, layer, h_out, w_out);
    col = reshape(col, k*k, c, h_out*w_out);
    mask = zeros(size(col));
    grad = reshape(output.diff(:,n),h_out*w_out,c);
    grad = grad';
    grad = reshape(grad,1,c, h_out*w_out);
    [m,i] = max(col);
    %m = m.*grad;
    
    for x=1:c
    for y=1:h_out*w_out    
    mask(i(1,x,y),x,y) = grad(1,x,y);  
    end
    end
    mask = reshape(mask,k*k*c,h_out*w_out);
    mask = col2im_conv(mask(:), input, layer, h_out, w_out);   

    input_od(:, n) = mask(:);
end

end
