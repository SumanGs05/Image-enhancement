function [ saliency ] = saliency_detection(image)
% Compute saliency map using spectral residual approach
image = im2double(image);
if size(image, 3) == 3
    grayImg = rgb2gray(image);
else
    grayImg = image;
end

% Spectral Residual
imgFFT = fft2(grayImg);
amplitude = abs(imgFFT);
phase = angle(imgFFT);

% Log spectrum
logAmplitude = log(amplitude + 1);

% Spectral residual
avgFilter = fspecial('average', 3);
spectralResidual = logAmplitude - imfilter(logAmplitude, avgFilter, 'replicate');

% Reconstruct
saliencyFFT = exp(spectralResidual + 1i * phase);
saliencyMap = abs(ifft2(saliencyFFT)).^2;

% Smooth with Gaussian
saliency = mat2gray(imgaussfilt(saliencyMap, 10));
end

