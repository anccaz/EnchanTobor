# filter_org_data.R
args <- commandArgs(trailingOnly=TRUE)
category <- args[1]
print("Hello2")
library(dplyr)
library(stringr)
stu_org <- read.csv("C:/Users/sueso/Downloads/stu_org.csv")
stu_org <- stu_org %>% 
  select(-Contact.Information.Email, -Picture) %>%
  rename(President = Purpose, Email = and.Organization.Description, Image = President.s.Full.Name)
stu_org$CategoryClean <- str_extract(stu_org$Category, "\\w+")
stu_org[334, 7] <- "Fraternity"

stu_org <- stu_org %>% 
  mutate(CategoryClean = ifelse(CategoryClean == "Club", "Sports", CategoryClean)) %>%
  mutate(CategoryClean = ifelse(CategoryClean == "Service", "Services", CategoryClean)) %>%
  mutate(CategoryClean = ifelse(CategoryClean == "Arts", "Arts and Music", CategoryClean)) %>%
  mutate(CategoryClean = ifelse(CategoryClean == "Art", "Arts and Music", CategoryClean)) %>%
  mutate(CategoryClean = ifelse(CategoryClean == "Departmental", "Departmental/Educational", CategoryClean)) %>%
  mutate(CategoryClean = ifelse(CategoryClean == "Educational", "Departmental/Educational", CategoryClean)) %>%
  mutate(CategoryClean = ifelse(CategoryClean == "University", "University Department", CategoryClean)) %>%
  mutate(CategoryClean = ifelse(CategoryClean == "Fraternity", "Fraternity & Sorority", CategoryClean)) %>%
  mutate(CategoryClean = ifelse(CategoryClean == "Honor", "Honor Society", CategoryClean)) %>%
  mutate(CategoryClean = ifelse(CategoryClean == "Special", "Special Interest", CategoryClean))

stu_org[302, 7] <- "Cultural"
stu_org[280, 7] <- "Arts and Music"
stu_org[318, 7] <- "University Department"
stu_org[382, 7] <- "University Department"
stu_org[348, 7] <- "University Department"

filteredOrgData <- stu_org %>%
  filter(CategoryClean == category) # Filter based on organization category

cat(toJSON(filteredData, pretty = TRUE))
