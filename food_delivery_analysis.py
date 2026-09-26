import pandas as pd

pd.set_option("display.max_columns", None)


file = r"C:\Users\Gyatri pawar\OneDrive\Documents\Desktop\Food_Delivery_Analytics\Data\food_delivery_raw_data.xlsx"
df = pd.read_excel(file, sheet_name="Raw_Data")

# DATA LOADING & BASIC EXPLORATION*
df.describe()
df.isnull().sum()
df["Restaurant"].nunique()
df["Restaurant"].value_counts()
df["Order_Value"].sum()

             
#Area revenue
df["Order_Category"] = df["Order_Value"].apply(
    lambda x: "High" if x >= 500 else "Medium" if x >= 300 else "Low"
)
print(df[["Order_Value", "Order_Category"]])

print(df.groupby("Area")["Order_Value"].sum())                    #Area revenue
print(df.groupby("Area")["Order_Value"].count())                   #Area order count
print(df.groupby(["Restaurant", "Area"])["Order_Value"].count())  # Restaurant + Area order count

#Delivery Status
df["Delivery_Status"] = df["Delivery_Time"].apply(
    lambda x: "On Time" if x <= 40 else "Delayed"
)
print(df[["Delivery_Time", "Delivery_Status"]])

print(df["Delivery_Status"].value_counts())
total_orders = len(df)

#REVENUE & RATING ANALYSIS
#Restaurant Revenue
Restaurant_Revenue = (
    df.groupby("Restaurant")["Order_Value"]
    .sum()
    .sort_values(ascending=False)
)
print(Restaurant_Revenue)

#Area Revenue
Area_Revenue=(
    df.groupby("Area")["Order_Value"]
    .sum()
    .sort_values(ascending=False)
)
print(Area_Revenue)

#Food Category Revenue
Food_Category=(
    df.groupby("Category")["Order_Value"]
    .sum()
    .sort_values(ascending=False)
)
print(Food_Category)

#Restaurant Average Rating
Average_Rating=(
    df.groupby("Restaurant")["Rating"]
    .mean()
    .sort_values(ascending=False)
)
print(Average_Rating)
print(Average_Rating.head(1))

 #Average delivery time by area
Average_Delivery_Time=(
    df.groupby("Area")["Delivery_Time"].mean().sort_values(ascending=True)
)
print(Average_Delivery_Time)

#Orders by payment mode
Payment_Mode_Orders=(
    df.groupby("Payment_Mode")["Order_Value"].count().sort_values(ascending=False)
)
print(Payment_Mode_Orders)

#Average order value by category
Category_Average_Order_Value =(
    df.groupby("Category")["Order_Value"].mean().sort_values(ascending=False)
)
print(Category_Average_Order_Value )

#Repeat customers
Customer_Order_Count=(
    df.groupby("Customer_ID")["Order_Value"]
    .count()
)
print(Customer_Order_Count[Customer_Order_Count > 1].sort_values(ascending=False))

#Customer spending
Customer_Spent_Money=(
    df.groupby("Customer_ID")["Order_Value"]
    .sum()
    .sort_values(ascending=False   )
)
print(Customer_Spent_Money)

#Delivery status count
Delivery_Status_Category=(
    df.groupby("Delivery_Status")["Order_Value"].count()
)
print(Delivery_Status_Category)

 # On-time percentage
on_time_orders = (df["Delivery_Status"] == "On Time").sum()
on_time_percentage = (on_time_orders / total_orders) * 100
print(on_time_percentage)

                   #Delayed percentage
delayed_orders= (df["Delivery_Status"]=="Delayed").sum()
delayed_percentage=(delayed_orders/total_orders*100)
print(delayed_percentage)

#Average delivery time by restaurant
Restaurant_Average_Delivery_Time=(
    df.groupby("Restaurant")["Delivery_Time"]
    .mean()
    .sort_values(ascending=True)
)
print(Restaurant_Average_Delivery_Time)

#Total orders by area
Total_Orders=(
    df.groupby("Area")["Order_Value"].count()
    .sort_values(ascending=False)
)
print(Total_Orders)

#Orders by category
Category_Orders=(
    df.groupby("Category")["Order_Value"].count()
    .sort_values(ascending=False)
)
print(Category_Orders)

# Average order value by area
Average_Order_Value=(
    df.groupby("Area")["Order_Value"].mean()
    .sort_values(ascending=False)
)
print(Average_Order_Value)

#Orders by restaurant
Restaurant_Order_Count=(
    df.groupby("Restaurant")["Order_Value"].count()
    .sort_values(ascending=False)
)
print(Restaurant_Order_Count)

#Highest-revenue restaurant with at least 3 orders
Restaurant_Revenue=(
    df.groupby("Restaurant")["Order_Value"]
    .agg(["sum","count"])
)
Restaurant_Revenue= Restaurant_Revenue[Restaurant_Revenue["count"] >= 3]
Restaurant_Revenue= Restaurant_Revenue.sort_values("sum", ascending=False).head(1)
print(Restaurant_Revenue)

#Average rating by category
Average_Customer_Rating=(
    df.groupby("Category")["Rating"]
    .mean()
    .sort_values(ascending=False)
)
print(Average_Customer_Rating)

#Highest-revenue category
Category_Revenue=(
    df.groupby("Category")["Order_Value"]
    .sum()
    .sort_values(ascending=False).head(1)
)
print(Category_Revenue)

#Area with highest average delivery time
Area_Average_Delivery_Time=(
    df.groupby("Area")["Delivery_Time"].mean()
    .sort_values(ascending=False).head(1)
)
print(Area_Average_Delivery_Time)    

#Highest-spending customer
customer_spent_money=(
    df.groupby("Customer_ID")["Order_Value"]
    .sum()
    .sort_values(ascending=False)
    .head(1)
)
print(customer_spent_money)
