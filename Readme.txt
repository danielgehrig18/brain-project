Team Name:      Fit happens

Team Members:   Daniel Gehrig
                Adrian Ruckli
                Maximillian Göttgens

Summary of Approach:

1. - No preprocessing steps.

2. - Generate an intensity histogram of every brain with 5000 bins.
     Every bin has a width of 1 intensity unit and thus counts the number of 
     voxels with intensity i. Voxels with intensity 0 are excluded as they 
     correspond to background.
    
   - The histograms are normalized to control for varying brain volume.
   
   - The intensity histogram generally exhibits 3 peaks which are used for
     feature extraction. Three features are extracted from the intensity:
     - voxels in the range 170-270 around the first peak (including limits).
     - voxels in the range 715-785 around the second peak (including limits).
     - voxels in the range 1340-1560 around the third peak (including limits). 
    These are called [x1, x2, x3]

   - The parameters where chosen to minimize the Bayesian Information Criterion (BIC), 
     which is a measure for the tradeoff between model complexity and goodness of fit.

3. - Fit a quartic polynomial with interaction terms for the three features. 
     The final feature vector has the form: 
     X = [x1, x2, x3, x2^3, x1*x3, x2*x3, x2^4, x2^3*x3] and the age prediction
     has the following formula:
     y = b0 + x*b where b = [b1; b2; b3; b4; b5; b6; b7; b8] 

   - The specific form of the polynomial was chosen to minimize the BIC of the fit.
   
   - b is chosen through MLE with weighted LS. The weight matrix is of a bisquare
     type so as to reduce the impact of outliers on the fit. A second weight matrix
     is multiplied to take into account the high density of old and young test subject.
     The final formula for b is:
     
     b = (X^T*W*X)^-1*X^T*W*y 

     where W is the weight matrix, X is the data matrix and y are the targets.

4. - No post processing steps.