library(tidyverse)
library(extrafont)
loadfonts()

##################################################-
## Four faces ----
##################################################-
dat <- matrix(c(3, 5, 4, 1), nrow = 2) |>
  as_tibble() |>
  rownames_to_column(var = "roll") |>
  gather("die", "face", starts_with("V")) |>
  mutate(roll = as.integer(roll),
         die = as.integer(factor(die)))

ggplot(data = dat, aes(x = roll, y = die, label = face))+
  geom_text(family = "Dice", size = 80)+
  scale_x_continuous(expand = c(0, 0.5))+
  scale_y_continuous(expand = c(0, 0.5))+
  theme_void()+
  theme_sub_plot(background = element_rect(fill = "white"), margin = unit(c(0, 0, 2, 0), "lines"))+
  coord_equal(clip = "off")
ggsave("static/icon.png", width = 6.4, height = 6.4, dpi = 80, units = "in")

##################################################-
## Spectral properties of favicon choices ----
##################################################-
spect <- crossing(x1 = 1:6, x2 = 1:6, x3 = 1:6, x4 = 1:6) |>
  mutate(uni = pmap_lgl(.l = list(..1 = x1, ..2 = x2, ..3 = x3, ..4 = x4),
                        .f = ~length(unique(c(..1, ..2, ..3, ..4))) == 4L)) |>
  filter(uni) |>
  mutate(mat = pmap(.l = list(..1 = x1, ..2 = x2, ..3 = x3, ..4 = x4),
                    .f = ~matrix(c(..1, ..2, ..3, ..4), ncol = 2)),
         e = map(.x = mat, .f = eigen),
         e1 = map_dbl(.x = e, .f = ~.x$values[1]),
         e2 = map_dbl(.x = e, .f = ~.x$values[2]),
         ss = map(.x = mat, .f = ~popbio::stable.stage(.x)),
         ss1 = map_dbl(.x = ss, .f = ~.x[1]),
         ss2 = map_dbl(.x = ss, .f = ~.x[2]),
         ssrat = log10(ss1/ss2),
         lambda = map_dbl(.x = e, .f = ~max(.x$values)))

ggplot(spect, aes(x = e1, y = e2, fill = ssrat))+
  geom_point(shape = 21, size = 2, position = position_jitter(width = 0.1, height = 0.1))+
  scale_fill_distiller(type = "div", palette = 3)
