# Install BioconductoT packages
install.packages("BiocManager")
library(BiocManager)
# install the ALL package
BiocManager::install("ALL")
library("ALL")

# View patient metadata
data("ALL")
df2 <- pData(ALL)

# Quick summary
summary(pData(ALL)[, c("age", "sex", "BT", "relapse")])

# mean and median age
mn <- mean(df2$age) # this will return NA
md <- median(df2$age) # this will return NA

mn <- mean(df2$age, na.rm = TRUE) # this will work
md <- median(df2$age, na.rm = TRUE) # this will work

# standard deviation and variance
std <- sd(df2$age, na.rm = TRUE)
vr <- var(df2$age, na.rm = TRUE)

# Extremes
mxx <- max(df2$age, na.rm = T)
mnn <- min(df2$age, na.rm = T)

# Table and (Frequency)
age_dit <- table(df2$age)

# Quick summary
summary(df2[, c("age", "sex", "BT", "relapse")])

# Patients older than 40
older_patients <- subset(df2, age > 40)

# Patients who relapsed
relapsed_patients <- subset(df2, relapse == TRUE)

# Subsetting and Filtering 
# subset()
subset(df2, Age > 40 & Relapse == TRUE)

# Indexing with [
df2[df2$Age > 40, ]                # filter rows
df2[df2$Age > 40 & df2$Relapse, ]   # multiple conditions (same as df$Relapse == T)
df2[, c("Age", "BT")]             # select columns
df <- df2[df$Sex == "F", ] # female patients only (#Assignment with condition)
  
# with()
with(df, df[Age > 40 & Relapse == TRUE, ]) #for cleaner syntax
df[which(df$Age > 40), ] # more cleanr syntax 
  
#match() / %in% (matching values)
  df[df$BT %in% c("B2", "B3"), ]
  
# Logical indexing directly
  df[df$Relapse == TRUE | df$Sex == "F", ]
  
