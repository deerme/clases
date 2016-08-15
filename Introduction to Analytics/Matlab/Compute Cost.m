function J = computeCost(X, y, theta)

    X = [ones(m, 1), data(:,1)]
    y = data(:, 2)
    theta = zeros(2, 1)
    m = length(y);

    J = 0;

    h = X*theta
    J = (1/(2*m))*((h-y)'*(h-y))
    J

end
