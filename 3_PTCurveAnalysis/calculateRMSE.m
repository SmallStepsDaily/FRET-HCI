function rmse = calculateRMSE(params,x, y_actual,t)
    % Calculate the root mean square error.(RMSE)
    % Input:
    %   params - Function parameters
    %   x - concentration
    %   y_actual - PT value
    % Output:
    %   rmse - Root Mean Square Error Value
    
    % Check whether the input dimensions are consistent
    if ~isequal(size(y_actual), size(x))
        error('Input dimensions do not match');
    end

    y_predicted = fun2h(x, params,t);
    % Calculate the mean of the squared errors, and then take the square root.
    rmse = sqrt(mean((y_actual - y_predicted).^2));
end
