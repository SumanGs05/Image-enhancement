function [ result ] = hisStretching(image)
% Contrast stretching by histogram normalization
image = im2double(image);
[M, N, C] = size(image);
result = zeros(M, N, C);
for c = 1:C
    channel = image(:,:,c);
    minVal = min(channel(:));
    maxVal = max(channel(:));
    if maxVal > minVal
        result(:,:,c) = (channel - minVal) / (maxVal - minVal);
    else
        result(:,:,c) = channel;
    end
end
end

