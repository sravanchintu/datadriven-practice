SELECT
    ad_campaign,
    COUNT(impression_time) AS impressions,
    SUM(revenue) AS total_revenue,
    ROUND(
        SUM(clicked) * 100.0 / COUNT(impression_time),
        1
    ) AS ctr_percentage
FROM ad_impressions
GROUP BY ad_campaign
HAVING COUNT(impression_time) > 15
ORDER BY
    ctr_percentage DESC,
    ad_campaign ASC;
