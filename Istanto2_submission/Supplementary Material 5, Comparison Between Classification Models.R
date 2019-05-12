# Initialize values
SVM_LR = c(0.71544715,0.70731707,0.72086721,0.72086721,0.7100271,0.71815718,0.71273713,0.71544715,0.71273713,0.71815718)
LR_only = c(0.71544715,0.71544715,0.71544715,0.71544715,0.71544715,0.71544715,0.71544715,0.71544715,0.71544715,0.71544715)
NN_only = c(0.77435662,0.7622549,0.74862132,0.77665441,0.75735294,0.77895221,0.75903799,0.77205882,0.76685049,0.76976103)

groups =  c(rep("SVM_LR", length(SVM_LR)), rep("LR_only", length(LR_only)), rep("NN_only", length(NN_only)))

# ANOVA
fit = lm(formula = c(SVM_LR, LR_only, NN_only) ~ groups)
av = aov(fit)

library(agricolae)
HSD_result = HSD.test(fit, trt="groups")

plot(HSD_result, main="Tukey HSD Test on Different Classification Approaches", xlab="Approach", ylab="Mean Test Accuracy")
