% Check whether the objective value has converged 
% by comparing the difference between consecutive 
% objective values to the tolerance

function hasConverged = LR_CheckConvg(oldObj,newObj,tol)

    % Input:
    % oldObj (1, 1): Contains the old objective value
    % newObj (1, 1): Contains the new objective value
    % tol (1, 1): Contains the convergence tolerance
    % Output:
    % hasConverged (1,1): Contains a boolean whether SGD has converged.

    % Your code here
    
    if abs(oldObj-newObj)<tol
    hasConverged = logical(1);
    else
    hasConverged = logical(0);

end
