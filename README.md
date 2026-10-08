# Ghost Gun Prevalence in California, 2013-2024

An animated county-level map of ghost guns recovered by law enforcement in California, showing how recoveries per 100,000 residents changed from 2013 to 2024.

![Animated map of ghost gun recoveries per 100,000 residents in California counties, 2013-2024](ghost_gun_final.gif)

*Rate of ghost guns recovered per 100,000 residents, by county and year.*

## Overview

Ghost guns are privately made firearms that lack serial numbers, which makes them difficult to trace. This project, created for a data visualization class, uses county-level data from The Trace to show where and when recoveries have increased across California's 58 counties.

Statewide recoveries rose from 3 in 2013 to roughly 10,900 in 2021 and have since declined to about 7,400 in 2024. Rates are highest in the Central Valley and Inland Empire, with Kern, Madera, and San Bernardino leading the state in 2024. The color scale is fixed across all years so frames can be compared directly.

## Data

- **Source:** [The Trace, Gun Violence Data Hub](https://datahub.thetrace.org/dataset/california-ghost-guns-stolen-guns-and-more/)
- **File:** `ca_ghost_guns_by_county-2025-11-14.csv`
- **Boundaries:** U.S. Census Bureau county shapefiles via the `tigris` package

## Tools

R, with `tidyverse`, `sf`, `tigris`, `gganimate`, and `showtext`.

## How to run

1. Download this repository.
2. Open `Project2.R` in RStudio and install any missing packages.
3. Run the script and select `ca_ghost_guns_by_county-2025-11-14.csv` when prompted.
4. The animation is saved as `ghost_gun_final.gif`.

## Limitations

- "Recovered" counts reflect law enforcement activity and reporting practices as well as how many ghost guns exist, so trends are not a direct measure of prevalence.
- Small-population counties can have volatile per-capita rates, since a few recoveries can shift the rate substantially.
- Early years have very few recoveries, so the first frames of the animation look nearly uniform.
