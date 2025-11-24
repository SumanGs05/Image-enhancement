function [W1, W2] = norm_weight(WL1, WS1, WSat1, WL2, WS2, WSat2)
% Normalize weights across two images
% Combine weights
W1 = (WL1 + WS1 + WSat1) + 0.1;  % Add small constant to avoid division by zero
W2 = (WL2 + WS2 + WSat2) + 0.1;

% Normalize
W_total = W1 + W2;
W1 = W1 ./ W_total;
W2 = W2 ./ W_total;
end

