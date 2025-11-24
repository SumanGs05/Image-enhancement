# Image Enhancement - Underwater Image Processing

This project implements underwater image enhancement using fusion-based techniques with color correction, sharpening, and multi-scale image fusion.

## Prerequisites

- MATLAB (R2018b or later recommended)
- Image Processing Toolbox

## Project Structure

```
Image-enhancement/
├── aa.jpeg                    # Input image
├── mainfile.m                 # Main script to run
├── gammaCorrection.m          # Gamma correction function
├── redCompensate.m            # Red channel compensation
├── sharp.m                    # Image sharpening
├── hisStretching.m            # Histogram stretching
├── simple_color_balance.m     # White balance correction
├── rgb_to_lab.m               # RGB to LAB color space conversion
├── saliency_detection.m       # Saliency map computation
├── Saturation_weight.m        # Saturation weight calculation
├── norm_weight.m              # Weight normalization
├── gaussian_pyramid.m         # Gaussian pyramid construction
├── laplacian_pyramid.m        # Laplacian pyramid construction
├── pyramid_reconstruct.m      # Pyramid reconstruction
├── UIQM.m                     # Underwater Image Quality Measure
└── UCIQE.m                    # Underwater Color Image Quality Evaluation
```

## How to Run

### Step 1: Open MATLAB
Launch MATLAB and navigate to the `Image-enhancement` folder.

### Step 2: Set Current Folder
In MATLAB Command Window:
```matlab
cd 'C:\Users\Suman\image\Image-enhancement'
```

Or use the Current Folder browser to navigate to the folder.

### Step 3: Run the Main Script
In MATLAB Command Window:
```matlab
run('mainfile.m')
```

Or open `mainfile.m` in the MATLAB editor and click the **Run** button.

## What the Code Does

1. **Reads the input image** (`aa.jpeg`)
2. **Red Channel Compensation** - Corrects color attenuation in water
3. **White Balance Enhancement** - Applies gray world assumption
4. **Gamma Correction** - Adjusts luminance (gamma = 1.2)
5. **Sharpening** - Enhances image details using unsharp masking
6. **Weight Map Calculation**:
   - Laplacian contrast weight
   - Saliency weight
   - Saturation weight
7. **Multi-scale Fusion** - Uses Laplacian pyramids to blend two enhanced versions
8. **Quality Metrics** - Computes UIQM and UCIQE scores

## Output

The script will display:
- Original image
- Red channel compensated image
- White balanced image
- Gamma corrected image
- Sharpened image
- Final fused enhanced image

UIQM and UCIQE quality scores will be printed in the Command Window.

## Troubleshooting

### "Undefined function" error
- Ensure all `.m` files are in the same folder as `mainfile.m`
- Check that MATLAB's current folder is set to `Image-enhancement`
- Verify all function filenames match exactly (case-sensitive)

### "File not found" error
- Check that `aa.jpeg` exists in the folder
- To use a different image, change line 4 in `mainfile.m`:
  ```matlab
  im = imread('your_image.jpg');
  ```

### Image Processing Toolbox functions missing
- Some functions require the Image Processing Toolbox
- Verify it's installed: `ver` in Command Window

## Algorithm Overview

This implementation uses a fusion-based approach:
1. Two enhanced versions are created (gamma corrected and sharpened)
2. Weight maps are computed for each version based on contrast, saliency, and saturation
3. Multi-scale fusion using Laplacian pyramids blends the two versions
4. Quality is assessed using underwater-specific metrics (UIQM, UCIQE)

## Credits

Based on underwater image enhancement research using multi-scale fusion techniques.

