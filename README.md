# 🍕 Maven Pizza Sales Data Analysis

## 📖 Project Overview

This project presents an end-to-end sales analysis of a pizza restaurant using SQL and Power BI. The objective is to transform raw transactional data into actionable business insights that can support strategic decision-making, improve operational efficiency, and drive revenue growth.

By analyzing customer orders, pizza categories, sizes, sales trends, and product performance, this project identifies key revenue drivers, customer preferences, peak demand periods, and opportunities for business optimization.

---

## 🎯 Business Objectives

The primary goals of this analysis are:

- Measure overall business performance through key sales KPIs.
- Identify top-performing and underperforming pizza products.
- Understand customer purchasing behavior.
- Analyze sales patterns across different days and times.
- Evaluate revenue contribution by pizza category and size.
- Generate insights that support inventory planning and marketing strategies.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|--------|----------|
| SQL | Data extraction, cleaning, and business analysis |
| Power BI | Dashboard creation and visualization |
| Excel | Initial data exploration and validation |
| DAX | KPI calculations and measures |
| Data Modeling | Relationship creation and reporting |

---

## 📂 Dataset Description

The dataset consists of transactional sales records containing:

### Orders Table
- Order ID
- Order Date
- Order Time

### Order Details Table
- Order Detail ID
- Order ID
- Pizza ID
- Quantity

### Pizzas Table
- Pizza ID
- Pizza Type ID
- Size
- Price

### Pizza Types Table
- Pizza Name
- Category
- Ingredients

---

## 📊 Key Performance Indicators (KPIs)

The following KPIs were developed to evaluate business performance:

### Revenue Metrics
- Total Revenue
- Average Order Value
- Revenue per Pizza Category
- Revenue per Pizza Size

### Sales Metrics
- Total Orders
- Total Pizzas Sold
- Average Pizzas per Order

### Customer Behavior Metrics
- Peak Ordering Hours
- Busiest Days of the Week
- Monthly Sales Trends

### Product Performance Metrics
- Best-Selling Pizzas
- Worst-Selling Pizzas
- Category-wise Performance
- Size-wise Demand Analysis

---

# SQL Analysis

The analysis was conducted using SQL to answer critical business questions.


# 📈 Dashboard Features

The Power BI dashboard was designed to provide an executive-level  of business performance.

### Executive KPI Section
- Total Revenue
- Total Orders
- Total Pizzas Sold
- Average Order Value
- Average Pizza Price

### Sales Trend Analysis
- Daily Sales Trend
- Monthly Revenue Trend
- Hourly Order Distribution

### Product Analysis
- Top Sellers
- Bottom Sellers
- Revenue by Pizza Category
- Revenue by Pizza Size

### Interactive Features
- Category Filters
- Dynamic Visualizations
- Drill-Down Analysis
- Cross-Filtering

---

# 🔍 Deep Business Insights

## 1. Revenue Concentration

A relatively small group of pizza products contributes a significant share of total revenue. This indicates that customer demand is concentrated around a few highly popular menu items.

### Business Impact
The restaurant should ensure these products remain consistently available and maintain high quality standards.

---

## 2. Peak Demand Hours

Order volume increases significantly during lunch and dinner periods, reflecting customer dining patterns.

### Business Impact
- Schedule additional staff during peak hours.
- Increase kitchen capacity during high-demand periods.
- Reduce customer waiting time.

---

## 3. Weekend Sales Surge

Sales tend to be higher on weekends compared to weekdays.

### Business Impact
Weekend-focused promotions can further increase revenue while ensuring adequate inventory availability.

---

## 4. Size Preference Analysis

Certain pizza sizes contribute disproportionately to revenue despite not representing the highest order count.

### Business Impact
Premium pricing strategies can be optimized around these high-revenue sizes.

---

## 5. Category Performance

Some pizza categories consistently outperform others in both revenue and quantity sold.

### Business Impact
- Expand successful categories.
- Introduce new flavors based on customer preferences.
- Reevaluate low-performing menu categories.

---

## 6. Underperforming Products

Several pizzas show low sales volume and limited revenue contribution.

### Business Impact
- Consider menu redesign.
- Improve product visibility.
- Bundle with popular products.
- Remove consistently poor performers.

---

## 7. Customer Purchase Behavior

Average pizzas per order indicate customers frequently purchase multiple items in a single transaction.

### Business Impact
Cross-selling and combo meal strategies can increase average order value.

---

# 💼 Strategic Recommendations

## Revenue Growth Strategies

### Product Bundling
Create combo offers featuring best-selling pizzas with beverages or side items.

### Upselling Opportunities
Encourage customers to upgrade from medium to large sizes through targeted promotions.

### Dynamic Promotions
Offer discounts during low-demand periods to increase order volume.

---

## Inventory Optimization

- Maintain higher inventory levels for top-selling pizzas.
- Reduce stock allocation for low-demand products.
- Improve forecasting using historical sales trends.

---

## Operational Improvements

### Workforce Planning
Align staffing levels with peak demand periods.

### Kitchen Efficiency
Prioritize preparation workflows for high-volume products.

### Delivery Optimization
Increase delivery resources during lunch and dinner rush hours.

---

## Marketing Recommendations

### Customer Retention
Launch loyalty programs for repeat customers.

### Category Promotion
Promote high-margin pizza categories through digital campaigns.

### Seasonal Campaigns
Introduce limited-time menu offerings during holidays and special events.

---

# 📊 Expected Business Value

Implementation of the insights generated through this analysis can help the business:

- Increase revenue
- Improve customer satisfaction
- Optimize inventory management
- Enhance operational efficiency
- Support data-driven decision making
- Improve profitability

---l

## 📖 Project Overview

This project presents an end-to-end sales analysis of a pizza restaurant using SQL and Power BI. The objective is to transform raw transactional data into actionable business insights that can support strategic decision-making, improve operational efficiency, and drive revenue growth.

By analyzing customer orders, pizza categories, sizes, sales trends, and product performance, this project identifies key revenue drivers, customer preferences, peak demand periods, and opportunities for business optimization.

---

## 🎯 Business Objectives

The primary goals of this analysis are:

- Measure overall business performance through key sales KPIs.
- Identify top-performing and underperforming pizza products.
- Understand customer purchasing behavior.
- Analyze sales patterns across different days and times.
- Evaluate revenue contribution by pizza category and size.
- Generate insights that support inventory planning and marketing strategies.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|--------|----------|
| SQL | Data extraction, cleaning, and business analysis |
| Power BI | Dashboard creation and visualization |
| Excel | Initial data exploration and validation |
| DAX | KPI calculations and measures |
| Data Modeling | Relationship creation and reporting |

---

## 📂 Dataset Description

The dataset consists of transactional sales records containing:

### Orders Table
- Order ID
- Order Date
- Order Time

### Order Details Table
- Order Detail ID
- Order ID
- Pizza ID
- Quantity

### Pizzas Table
- Pizza ID
- Pizza Type ID
- Size
- Price

### Pizza Types Table
- Pizza Name
- Category
- Ingredients

---

## 📊 Key Performance Indicators (KPIs)

The following KPIs were developed to evaluate business performance:

### Revenue Metrics
- Total Revenue
- Average Order Value
- Revenue per Pizza Category
- Revenue per Pizza Size

### Sales Metrics
- Total Orders
- Total Pizzas Sold
- Average Pizzas per Order

### Customer Behavior Metrics
- Peak Ordering Hours
- Busiest Days of the Week
- Monthly Sales Trends

### Product Performance Metrics
- Best-Selling Pizzas
- Worst-Selling Pizzas
- Category-wise Performance
- Size-wise Demand Analysis

---

# SQL Analysis

The analysis was conducted using SQL to answer critical business questions.

### Total Revenue

```sql
SELECT ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales;
```

### Average Order Value

```sql
SELECT ROUND(
SUM(total_price) /
COUNT(DISTINCT order_id),2)
AS Avg_Order_Value
FROM pizza_sales;
```

### Total Orders

```sql
SELECT COUNT(DISTINCT order_id)
AS Total_Orders
FROM pizza_sales;
```

### Top 5 Best-Selling Pizzas

```sql
SELECT pizza_name,
SUM(quantity) AS Total_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sold DESC
LIMIT 5;
```

### Bottom 5 Performing Pizzas

```sql
SELECT pizza_name,
SUM(quantity) AS Total_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sold ASC
LIMIT 5;
```

---

# 📈 Dashboard Features

The Power BI dashboard was designed to provide an executive-level view of business performance.

### Executive KPI Section
- Total Revenue
- Total Orders
- Total Pizzas Sold
- Average Order Value

### Sales Trend Analysis
- Daily Sales Trend
- Monthly Revenue Trend
- Hourly Order Distribution

### Product Analysis
- Top Sellers
- Bottom Sellers
- Revenue by Pizza Category
- Revenue by Pizza Size

### Interactive Features
- Category Filters
- Dynamic Visualizations
- Drill-Down Analysis
- Cross-Filtering

---

# 🔍 Deep Business Insights

## 1. Revenue Concentration

A relatively small group of pizza products contributes a significant share of total revenue. This indicates that customer demand is concentrated around a few highly popular menu items.

### Business Impact
The restaurant should ensure these products remain consistently available and maintain high quality standards.

---

## 2. Peak Demand Hours

Order volume increases significantly during lunch and dinner periods, reflecting customer dining patterns.

### Business Impact
- Schedule additional staff during peak hours.
- Increase kitchen capacity during high-demand periods.
- Reduce customer waiting time.

---

## 3. Weekend Sales Surge

Sales tend to be higher on weekends compared to weekdays.

### Business Impact
Weekend-focused promotions can further increase revenue while ensuring adequate inventory availability.

---

## 4. Size Preference Analysis

Certain pizza sizes contribute disproportionately to revenue despite not representing the highest order count.

### Business Impact
Premium pricing strategies can be optimized around these high-revenue sizes.

---

## 5. Category Performance

Some pizza categories consistently outperform others in both revenue and quantity sold.

### Business Impact
- Expand successful categories.
- Introduce new flavors based on customer preferences.
- Reevaluate low-performing menu categories.

---

## 6. Underperforming Products

Several pizzas show low sales volume and limited revenue contribution.

### Business Impact
- Consider menu redesign.
- Improve product visibility.
- Bundle with popular products.
- Remove consistently poor performers.

---

## 7. Customer Purchase Behavior

Average pizzas per order indicate customers frequently purchase multiple items in a single transaction.

### Business Impact
Cross-selling and combo meal strategies can increase average order value.

---

# 💼 Strategic Recommendations

## Revenue Growth Strategies

### Product Bundling
Create combo offers featuring best-selling pizzas with beverages or side items.

### Upselling Opportunities
Encourage customers to upgrade from medium to large sizes through targeted promotions.

### Dynamic Promotions
Offer discounts during low-demand periods to increase order volume.

---

## Inventory Optimization

- Maintain higher inventory levels for top-selling pizzas.
- Reduce stock allocation for low-demand products.
- Improve forecasting using historical sales trends.

---

## Operational Improvements

### Workforce Planning
Align staffing levels with peak demand periods.

### Kitchen Efficiency
Prioritize preparation workflows for high-volume products.

### Delivery Optimization
Increase delivery resources during lunch and dinner rush hours.

---

## Marketing Recommendations

### Customer Retention
Launch loyalty programs for repeat customers.

### Category Promotion
Promote high-margin pizza categorithrough digital campaigns.

### Seasonal Campaigns
Introduce limited-time menu offerings during holidays and special events.

---

# 📊 Expected Business Value

Implementation of the insights generated through this analysis can help the business:

- Increase revenue
- Improve customer satisfaction
- Optimize inventory management
- Enhance operational efficiency
- Support data-driven decision making
- Improve profitability

---


## 👩‍💻 Author

**Saloni Jaiswal**



