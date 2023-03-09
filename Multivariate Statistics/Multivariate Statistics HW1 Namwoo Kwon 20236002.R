# Multivariate Statistics Week 1 HW1
# UNIST Biztics Namwoo Kwon (20236002)

# Goal : Perform the principal component analysis of ANY photo.
# Process : Create different versions of the photo 
  # 1. Two largest eigenvalues
  # 2. Ten largest eigenvalues
  # 3. 11th through 100th eigenvalues
  # 4. 100 largest eigenvalues
  # 5. First half of the eigenvalues
  # 6. All the eigenvalues

# Intro 1 : Set path of file

getwd() # '/Users/namwoo'
setwd('/Users/namwoo/Desktop/UNIST/lecture/1-1/Multivaraiate Statistics')
getwd() # /Users/namwoo/Desktop/UNIST/lecture/1-1/Multivaraiate Statistics

# Intro 2 : Load Image File

install.packages('jpeg')
library(jpeg)

img <- readJPEG('Home_Work_1_image.jpeg')

dim(img) # image size 1440, 1440, 3

## Check Original Image
plot(1:2, type='n')
rasterImage(as.raster(img[,,1:3]), 1.2, 1.0, 1.73, 1.99, interpolate=FALSE)

str(img)
nrow(img) # 1440
ncol(img) # 1440

# Intro 3 : Separate Matrix by RGB

r <- img[,,1]
g <- img[,,2]
b <- img[,,3]

# Intro 4 : Let's PCA

## 'center=F' : To reverse the data back to the original without reprocessing the mean
img.r.pca <- prcomp(r, center=F)
img.g.pca <- prcomp(g, center=F)
img.b.pca <- prcomp(b, center=F)

## Check importance of principal component
r_importance <- summary(img.r.pca)$importance
g_importance <- summary(img.g.pca)$importance
b_importance <- summary(img.b.pca)$importance

r_importance[, 1:5]
g_importance[, 1:5]
b_importance[, 1:5]

## Save the result of PCA 
rgb.pca <- list(img.r.pca, img.g.pca, img.b.pca)

# Do Home Work 1

num = c(2, # Two largest eigenvalues
        10, # Ten largest eigenvalues
        11, # 11th through 100th eigenvalues
        100, # 100 largest eigenvalues
        720, # First half of the eigenvalues
        1440) # All the eigenvalues

for (i in num) {
  pca.img <- sapply(rgb.pca, function(j) {
    # Restore compressed images based on their principal components
    # If HW1 part 3, Change the parameter
    if (i == 11) { compressed.img <- j$x[, 11:100]%*%t(j$rotation[, 11:100])}
    else {compressed.img <- j$x[, 1:i]%*%t(j$rotation[, 1:i])}
    
  }, simplify = 'array')
  # Save the Image
  # If HW1 part 3, Change the parameter
  if (i==11){writeJPEG(pca.img, paste('HW_1_PCA_', i, '- 100', '.jpg', sep=''))}
  else {writeJPEG(pca.img, paste('HW_1_PCA_', i, '.jpg', sep=''))}
}

# View an image of My homework's final product

img_2 <- readJPEG('HW_1_PCA_2.jpg') # Picture quality is very choppy
img_10 <- readJPEG('HW_1_PCA_10.jpg') # Better than before, but not as good quality
img_11 <- readJPEG('HW_1_PCA_11- 100.jpg') # Fine lines indicate contours
img_100 <- readJPEG('HW_1_PCA_100.jpg') # Shows much better quality images
img_720 <- readJPEG('HW_1_PCA_720.jpg') # Doesn't look much different from the original image
img_1440 <- readJPEG('HW_1_PCA_1440.jpg') # Doesn't look much different from the original image

# Save Final Product

jpeg(filename="Final Result by HW1.png",
     width=600,
     height=300,
     unit="px",
     bg="transparent")

par(mfrow=c(2:3))
plot(1:2, main="Two largest eigenvalues", sub="PCA 1:2") 
rasterImage(img_2, 1.2, 1.0, 1.73, 1.99)
plot(1:2, main="Ten largest eigenvalues", sub="PCA 1:10") 
rasterImage(img_10, 1.2, 1.0, 1.73, 1.99)
plot(1:2, main="11th through 100th eigenvalues", sub="PCA 11:100") 
rasterImage(img_11, 1.2, 1.0, 1.73, 1.99)
plot(1:2, main="100 largest eigenvalues", sub="PCA 1:100") 
rasterImage(img_100, 1.2, 1.0, 1.73, 1.99)
plot(1:2, main="First half of the eigenvalues", sub="PCA 1:720") 
rasterImage(img_720,1.2, 1.0, 1.73, 1.99)
plot(1:2, main="All the eigenvalues", sub="PCA 1:1440") 
rasterImage(img_1440, 1.2, 1.0, 1.73, 1.99)

dev.off()

# View Image in Rstudio

par(mfrow=c(2:3))
plot(1:2, main="Two largest eigenvalues", sub="PCA 1:2") 
rasterImage(img_2, 1.2, 1.0, 1.73, 1.99)
plot(1:2, main="Ten largest eigenvalues", sub="PCA 1:10") 
rasterImage(img_10, 1.2, 1.0, 1.73, 1.99)
plot(1:2, main="11th through 100th eigenvalues", sub="PCA 11:100") 
rasterImage(img_11, 1.2, 1.0, 1.73, 1.99)
plot(1:2, main="100 largest eigenvalues", sub="PCA 1:100") 
rasterImage(img_100, 1.2, 1.0, 1.73, 1.99)
plot(1:2, main="First half of the eigenvalues", sub="PCA 1:720") 
rasterImage(img_720,1.2, 1.0, 1.73, 1.99)
plot(1:2, main="All the eigenvalues", sub="PCA 1:1440") 
rasterImage(img_1440, 1.2, 1.0, 1.73, 1.99)

# END
