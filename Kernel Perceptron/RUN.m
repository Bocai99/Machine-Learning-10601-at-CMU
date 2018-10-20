K2 = polykernel(test.X,train.X);
for i=1:size(test.X,2); 
    test_pred(i) = kernel_perceptron_pred(w, train.y, K2, i);
 
end

testnacc = test_pred == test.y;
testacc = sum(testnacc) / length(test.y);

fprintf('Your testing accuracy is:%6.4f%%\n', 100 * testacc);
