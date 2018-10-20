function [output] = pooling_layer_forward(input, layer)

h_in = input.height;
w_in = input.width;
c = input.channel;
batch_size = input.batch_size;
k = layer.k;
pad = layer.pad;
stride = layer.stride;

h_out = (h_in + 2*pad - k) / stride + 1;
w_out = (w_in + 2*pad - k) / stride + 1;

output.height = h_out;
output.width = w_out;
output.channel = c;
output.batch_size = batch_size;

input_n.height = h_in;
input_n.width = w_in;
input_n.channel = c;

% Replace the following line with your implementation.
output.data = zeros([h_out * w_out * c, batch_size]);

for n = 1:batch_size
    input_n.data = input.data(:, n);
    col = im2col_conv(input_n, layer, h_out, w_out);
    col = reshape(col, k*k, c, h_out*w_out);
    m = max(col);
    m = reshape(m,c,h_out*w_out);
    m = m';
    m = reshape(m, h_out*w_out*c,1);
    
    %m = zeros ([h_out *w_out *c,1]);
    
    %for i = 1:h_out *w_out *c  
    %m(i,1)= max(col((k*k*(i-1)+1) : (k*k*i) , 1));
    %end
   
    %m = reshape(m, h_out, w_out, c);
    %for j=1:c
    %m(:,:,j) = (m(:,:,j))';
    %end
    %m = reshape(m,h_out*w_out*c,1);
    
    %m = reshape(m,h_out*w_out,c);
    %m = m';
    %m = reshape(m,h_out*w_out*c,1);
    
   output.data(:,n) = m;
end

end
 
