function [ pyramid ] = laplacian_pyramid(image, level)
% Build Laplacian pyramid
pyramid = cell(level, 1);
gaussian = cell(level, 1);
gaussian{1} = image;

% Build Gaussian pyramid first
for i = 2:level
    smoothed = imgaussfilt(gaussian{i-1}, 1);
    gaussian{i} = impyramid(smoothed, 'reduce');
end

% Build Laplacian pyramid
for i = 1:level-1
    % Expand the next level
    expanded = impyramid(gaussian{i+1}, 'expand');
    
    % Match sizes (expansion might create size mismatch)
    [M, N] = size(gaussian{i});
    [M_exp, N_exp] = size(expanded);
    if M_exp ~= M || N_exp ~= N
        expanded = imresize(expanded, [M, N]);
    end
    
    % Laplacian is difference
    pyramid{i} = gaussian{i} - expanded;
end
pyramid{level} = gaussian{level};
end

