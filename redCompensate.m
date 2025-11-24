function ret = redCompensate( im, w )
% RED COMPENSATE - Reduced strength to prevent over-saturation
a = 0.3;  % Reduced from 1 to 0.3 to prevent excessive red
r = im2double(im(:,:,1));
g = im2double(im(:,:,2));
b = im2double(im(:,:,3));
[height,width,~] = size(im);
padsize = [(w-1)/2,(w-1)/2];
padr = padarray(r, padsize, 'symmetric', 'both');
padg = padarray(g, padsize, 'symmetric', 'both');
ret = im2double(im);
for i = 1:height
    for j = 1:width
        slider = padr(i:i+w-1,j:j+w-1);
        slideg = padg(i:i+w-1,j:j+w-1);
        r_mean = mean(mean(slider));
        g_mean = mean(mean(slideg));
        Irc = r(i,j) + a * (g_mean - r_mean) * (1-r(i,j)) * g(i,j);
        % Clamp values to prevent over-saturation
        Irc = min(max(Irc, 0), 1);
        ret(i, j, 1) = Irc;
    end
end
end

