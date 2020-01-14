library(tidyverse)

df <- data_frame(
  outcome = c(8,10,9,10,9,7,8,5,8,5,4,8,7,5,7),
  group   = c(rep(1, 5), rep(2, 5), rep(3, 5)),
  id      = 1:length(group)
) %>%
  mutate(group = factor(group, labels = c("A", "B", "C")))

df %>%
  group_by(group) %>%
  furniture::table1(outcome)
df %>%
  ggplot(aes(group, outcome)) +
  geom_jitter(alpha = .5) +
  geom_boxplot(alpha = .5) +
  theme_minimal()

df %>%
  car::leveneTest(outcome ~ group,
                  data = .,
                  center = mean)

fit_anova <- df %>%
  afex::aov_4(outcome ~ group + (1|id), 
      data = .) 

fit_anova
fit_anova$Anova

df %>%
  dplyr::group_by(group) %>%
  summarize(means = mean(outcome),
            ses   = sd(outcome)/sqrt(n()))
df %>%
  ggplot(aes(group, outcome)) +
    stat_summary()

  
  
## Chapter 14 Example Data

library(tidyverse)

df <- read_csv("Slides/Data/data_ch14.csv") %>%
  mutate(Group = factor(Group)) %>%
  na.omit %>%
  as.tibble
df

df %>%
  tidyr::gather("Drug", "value", 2:4) %>%
  group_by(Group, Drug) %>%
  summarize(marginal_means = mean(value))

df %>%
  tidyr::gather("Drug", "value", 2:4) %>%
  dplyr::group_by(Group) %>%
  dplyr::summarize(marginal_means = mean(value)) %>%
  ggplot(aes(Group, marginal_means)) +
  geom_line() +
  geom_point()

df %>%
  tidyr::gather("Drug", "value", 2:4) %>%
  dplyr::group_by(Drug) %>%
  dplyr::summarize(marginal_means = mean(value)) %>%
  ggplot(aes(Drug, marginal_means)) +
  geom_line() +
  geom_point()

df %>%
  tidyr::gather("Drug", "value", 2:4) %>%
  dplyr::group_by(Group, Drug) %>%
  dplyr::summarize(marginal_means = mean(value)) %>%
  ggplot(aes(Drug, marginal_means, group = Group, color = Group)) +
    geom_line() +
    geom_point()





