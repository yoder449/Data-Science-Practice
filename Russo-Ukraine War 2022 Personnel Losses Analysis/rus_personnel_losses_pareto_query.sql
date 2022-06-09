/********************************************************************
rus_personnel_losses_pareto_query.sql
8 June 2022
Cody Yoder

File Description: 
This queries a sample data set (herein referred to as the "database") which consists of a running tally of Russian personnel losses by date.
The query finds the daily losses as the difference between each day's losses, then divides each day's losses by the total Russian losses 
incurred to date (31,360). This yields an output ready for visualization via Python or Excel.

The database columns consist of the following values from left to right:
    
| Date | Running Count of Conflict Days Elapsed | Running Count of Total Losses | Running Count of Total POWs |

Data set found here: https://www.kaggle.com/datasets/piterfm/2022-ukraine-russian-war
SQL query ran via: https://sqliteonline.com/
********************************************************************/

SELECT 
    c1 as date, 
    c3 as running_losses, 
    c3 - LAG (c3) OVER (ORDER BY c3) AS daily_losses, -- LAG accesses the column's prior row value, which we subtract from the current row for each entry
    NULLIF((c3 - LAG (c3) OVER (ORDER BY c3)), 0) * 1.0 / 31360 as percentage_of_losses 
    --Here we control for null values with NULLIF and multiply by 1.0 as an easy workaround for a decimal result
FROM "russia_losses_personnel"
ORDER BY percentage_of_losses DESC;
/* ----- END OF QUERY ----- */