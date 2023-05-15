install.packages("pacman")
require(pacman)
library(pacman)

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkfown, kshiny, stringr, tidyr)

p_unload(all)

