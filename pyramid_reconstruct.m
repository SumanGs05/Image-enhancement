function [ result ] = pyramid_reconstruct(pyramid)
% Reconstruct image from Laplacian pyramid
level = length(pyramid);
result = pyramid{level};

for i = level-1:-1:1
    % Expand the result
    expanded = impyramid(result, 'expand');
    
    % Match sizes
    [M, N] = size(pyramid{i});
    [M_exp, N_exp] = size(expanded);
    if M_exp ~= M || N_exp ~= N
        expanded = imresize(expanded, [M, N]);
    end
    
    % Add Laplacian level
    result = expanded + pyramid{i};
end
end

