library(tidyverse)
library(tigris)
library(showtext)
library(gganimate)
library(sf)

font_add_google("Poppins", "poppins")
showtext_auto()
options(showtext.render = "system") ## fixes text rendering in animated plots on Mac OS

ghost <- read.csv(file.choose()) 
## https://datahub.thetrace.org/dataset/california-ghost-guns-stolen-guns-and-more/
glimpse(ghost)

options(tigris_use_cache = TRUE)

ca_counties <- counties(state = "CA", cb = TRUE) %>%
  st_as_sf() %>%
  st_transform(4326)

ghost$county <- str_to_title(ghost$county)

ghost_map <- ca_counties %>%
  left_join(ghost, by = c("NAME" = "county"))


p <- ggplot(ghost_map) +
  geom_sf(aes(fill = ghost_guns_per_100k), color = "black", size = 0.5) +
  scale_fill_gradientn(
    colours = c("#fff4b8", "#ff9f42", "#b30000", "#7a1fa2", "#003f88"), 
    name = "Ghost Guns\nper 100,000") + 
  labs(
    title = "Ghost Gun Prevalence in California By Year (2013-2024)",
    subtitle = "Rate recovered per 100,000 residents by county in {closest_state}",
    caption = "Source: Gun Violence Data Hub"
  ) +
  theme_minimal() +
  theme(
    plot.title      = element_text(family = "poppins", face = "bold", size = 20),
    plot.subtitle   = element_text(family = "poppins", size = 14, margin = margin(t = 4, b = 8)),
    plot.caption    = element_text(family = "poppins", size = 10),
    legend.title    = element_text(family = "poppins", face = "bold", size = 12),
    legend.text     = element_text(family = "poppins", size = 10),
    axis.text       = element_text(family = "poppins"),
    axis.title      = element_text(family = "poppins"),
    legend.position = "right"
  ) +
  transition_states(year, transition_length = 5, state_length = 10) + 
  ease_aes("cubic-in-out")

final <- animate(
  p,
  nframes = 250,
  fps = 10,
  width = 800,
  height = 600
)
final

anim_save("ghost_gun_final.gif", animation = final)


