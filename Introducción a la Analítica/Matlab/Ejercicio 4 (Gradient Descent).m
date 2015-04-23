function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

    X = [ones(m, 1), data(:,1)]
    y = data(:, 2)
    theta = zeros(2, 1)
    m = length(y);

    J_history = zeros(num_iters, 1);

    for iter = 1:num_iters

        h = X*theta
        
        theta(1,1) = theta(1,1) - (alpha/m)*(h-y)'*X(:,1)
        theta(2,1) = theta(2,1) - (alpha/m)*(h-y)'*X(:,2)

        J_history(iter) = computeCost(X, y, theta);

    end

end
