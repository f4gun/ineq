# Income Inequality
This project aims to measure income inequality in selected countries (Germany, India, the United Kingdom, and the United States) for the years 1980 and 2014. By comparing these two time points, we can observe how inequality has changed over three and a half decades.
## Data, Methodology and Tools Used
The project uses R and a few additional packages that you may need to install: 
1. dplyr (for data manipulation) 
2. ineq (for calculating Gini coefficient and graphing Lorenz curve) 
3. ggplot2 (for plotting)

**Data source:**  https://jackblun.github.io/Globalinc/ 
It provides PPP-adjusted income distribution data for many countries from 1980 until 2014. I’ve also attached the CSV file within the repository. 

**Countries selected:** Germany, India, the UK, and the US 

**Time period:** From 1980 to 2014

**Methods:** Lorenz Curve, Gini coefficient. 

The Lorenz curve graphically represents the distribution of income within a population, while the Gini coefficient provides a single numerical measure of inequality, ranging from 0 (perfect equality) to 1 (perfect inequality). We will also plot the time series of Gini coefficients between 1980 and 2014 to visualize trends in inequality over time for the selected countries. 

**The results will be found in the PDF titled "Results".**

## Moving Forward

In the future, I would like to be able to build upon this project. 
1. **Compare Regional Disparity** in places like the Middle East, thanks to their widely different economic and political situation.
2. **Include other forms of Inequality** such as Health Inequality, Gender Inequality, Wealth Inequality (for whichever there is substantial data).
3. **Understand the impact of policies on inequality.** Examples: How Scandinavian countries maintain low Gini coefficients through their social welfare systems. Or what was the impact of the UK's austerity measures post-2008 on income inequality.

## License

This project is licensed under MIT License.

~f4gun

