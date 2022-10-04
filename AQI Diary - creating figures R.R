
################################################################################################
## Emma Armstrong-Carter - 2022 - AQI  plots 
################################################################################################
#libraries 
library(openxlsx)
library(haven)
library(lme4)
library(lmerTest)
library(ggplot2)
library(cowplot)
library(viridis)
library(mjs)
library(ggpubr)
library(tidyr)
library(standardize)
library(Hmisc)
library(openxlsx)
library(MASS)
library(tidyverse)
library(data.table)
library(stringr)
library(lme4) 
library(lavaan)
library(sjPlot)
library(sjmisc)
library(interactions)
library(effectsize)

options(scipen = 100)

set_theme(base = theme_classic2(), #To remove the background color and the grids
          theme.font = 'Times New Roman',   #To change the font type
          axis.title.size = 2.0,  #To change axis title size
          axis.textsize.x = 1.5,  #To change x axis text size
          axis.textsize.y = 1.5)

################################################################################################

setwd("~/Dropbox/Independent Projects/AQI")
data_dir <- paste0(getwd(), "/Data")
d <- read_dta(paste0(data_dir, "/", "AQI-Diary for R", ".dta"))


################################################################################################
#CNO2 & fatigue

m1 = lmer(burnout~ cno2 + mno2 + weekday + zaphysical + cno2*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)


p<-plot_model(m1, type = "int", colors= "bw")
p<-p + labs(x = "Daily NO2 (mean centered)", #editing plot
            y = "Same Day Fatigue", 
            colour= "Physical Symptoms", 
            fill='Physical Symptoms',
            title = "")  
p
sim_slopes(m1, pred= "cno2",  modx="zaphysical", digits= 3)
summary(m1)

r.squaredGLMM(m1)


################################################################################################
#CNO2 & Distress

m1 = lmer(distress~ cno2 + mno2 + weekday + zaphysical + cno2*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)

p<-plot_model(m1, type = "int", colors= "bw")
p<-p + labs(x = "Daily NO2 (mean centered)", #editing plot
            y = "Same Day Distress", 
            colour= "Physical Symptoms", 
            title = "")  
p
sim_slopes(m1, pred= "cno2",  modx="zaphysical", digits= 3)



################################################################################################
#CCO & fatigue

m1 = lmer(burnout~ cco + cco + weekday + zaphysical + cco*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)

p<-plot_model(m1, type = "int", colors= "bw")
p<-p + labs(x = "Daily CO (mean centered)", #editing plot
            y = "Same Day Fatigue", 
            colour= "Physical Symptoms", 
            title = "")  
p
sim_slopes(m1, pred= "cco",  modx="zaphysical", digits= 3)

################################################################################################
#CCO & Distress

m1 = lmer(distress~ cco + mco + weekday + zaphysical + cco*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)

p<-plot_model(m1, type = "int", colors= "bw")
p<-p + labs(x = "Daily CO (mean centered)", #editing plot
            y = "Same Day Distress", 
            colour= "Physical Symptoms", 
            title = "")  
p
sim_slopes(m1, pred= "cco",  modx="zaphysical", digits= 3)


################################################################################################
    #next day co and distress
################################################################################################

m1 = lmer(distress_nd ~ cdistress + cco + mco + weekday + zaphysical + cco*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)

p<-plot_model(m1, type = "int", colors= "bw")
p<-p + labs(x = "Daily CO (mean centered)", #editing plot
            y = "Distress Next Day", 
            colour= "Physical Symptoms", 
            legend=c("-1SD", "+1SD"),
            title = "") 
p


sim_slopes(m1, pred= "cco",  modx="zaphysical", digits= 3)
summary(m1)

################################################################################################
#next day co and distress
################################################################################################

f1 = lmer(burnout~ cno2 + mno2 + weekday   +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)
f2 = lmer(burnout~ cno2 + mno2 + weekday + zaphysical + cno2*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)
f3 = lmer(burnout~ cco + mco + weekday   +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)
f4 = lmer(burnout~ cco + mco + weekday + zaphysical + cno2*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)
f3 = lmer(burnout~ cozone + mozone + weekday   +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)
f4 = lmer(burnout~ cozone + mozone + weekday + zaphysical + cno2*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)
f5 = lmer(burnout~ cso2 + mso2 + weekday   +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)
f6 = lmer(burnout~ cso2 + mso2 + weekday + zaphysical + cno2*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)
summary(f2)


################################################################################################
#3 days later NO2 and ozone --> fatigue
################################################################################################

m1 = lmer(burnout_plus3lag ~ cburnout + cno2 + mno2 + weekday + zaphysical + cno2*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)

p<-plot_model(m1, type = "int", colors= "bw")
p<-p + labs(x = "Daily NO2 (mean centered)", #editing plot
            y = "Fatigue three days later", 
            colour= "Physical Symptoms", 
            legend=c("-1SD", "+1SD"),
            title = "") 
p


sim_slopes(m1, pred= "cno2",  modx="zaphysical", digits= 3)
summary(m1)


m1 = lmer(burnout_plus3lag ~ cburnout + cozone + mozone + weekday + zaphysical + cozone*zaphysical +  (1 | id) +  (1 | id:year), data = d,  REML=FALSE)

p<-plot_model(m1, type = "int", colors= "bw")
p<-p + labs(x = "Daily Ozone (mean centered)", #editing plot
            y = "Fatigue three days later", 
            colour= "Physical Symptoms", 
            legend=c("-1SD", "+1SD"),
            title = "") 
p


sim_slopes(m1, pred= "cozone",  modx="zaphysical", digits= 3)
summary(m1)
