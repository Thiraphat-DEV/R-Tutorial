install.packages('googlesheets4')

library(googlesheets4)

gs4_deauth()
df_sheets <- read_sheet("https://docs.google.com/spreadsheets/d/1T1cdiGVSDYphFespiUPCehNGaP3cHE1M5Lh5vTEZ7GQ/edit?usp=sharing", sheet = 1)