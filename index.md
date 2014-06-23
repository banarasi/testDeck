---
title       : Predict Child's Height using Parent's Height
subtitle    : 
author      : Banarasi Tippa
job         : Database Engineer
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Dataset details

1.  This dataset was tabulated by Galton in 1885  

2.  Dataset has two variables child and parent

3.  Child - Child's height

4.  Parent - the "midparent" height, an average of fathers height and 1.08 time the mother's

--- .class #id 
## Lets look at the dataset





```r
data(galton)
str(galton)
```

```
## 'data.frame':	928 obs. of  2 variables:
##  $ child : num  61.7 61.7 61.7 61.7 61.7 62.2 62.2 62.2 62.2 62.2 ...
##  $ parent: num  70.5 68.5 65.5 64.5 64 67.5 67.5 67.5 66.5 66.5 ...
```


--- .class #id 

## Model Creation


```r
fit <- lm(child ~ parent, galton)
# summary(fit)
coef(fit)
```

```
## (Intercept)      parent 
##     23.9415      0.6463
```

<b> Model : 

child height = 23.9415 + parent * 0.6463 </b>

--- .class #id 
## Use the model to predict

Lets see what's the child's height given parent's height = 70


```r
y <- predict(fit, newdata = data.frame(parent = 70))
ggplot(galton, aes(parent, child)) + geom_point() + geom_smooth(method = "glm", 
    col = "steelblue") + geom_point(aes_string(x = 70, y = y), color = "red", 
    shape = 8, size = 5) + labs(title = paste("Estimated Child Height :", y))
```

![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4.png) 

