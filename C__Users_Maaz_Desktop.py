#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import random
from datetime import datetime, timedelta

# Define dataset parameters
cities = ['LHE', 'KHI', 'MUL', 'ISB']
products = [
    "Wireless Earbuds - Audionic AirBuds 2",
    "Power Bank - Romoss 20000mAh",
    "Gaming Mouse - Redragon M711 Cobra",
    "Bluetooth Speaker - Audionic Mehfil Speaker",
    "Smartwatch - Xiaomi Mi Band 7",
    "Men’s Kurta - J. Cotton Kurta",
    "Women’s Lawn Suit - Khaadi 3-Piece Lawn",
    "Mens Sneakers - Servis Cheetah Shoes",
    "Womens Handbag - Stylo Leather Bag",
    "Men’s Formal Shirt - Bonanza Satrangi Shirt",
    "Electric Kettle - Dawlance 1.7L Kettle",
    "Rice Cooker - Westpoint 1.8L Rice Cooker",
    "Bed Sheet Set - Sapphire Cotton Bedsheet",
    "Non-Stick Cookware Set - Prestige 5-Piece",
    "Wall Clock - Quartz Designer Clock"
]
order_statuses = ["Shipped", "Returned"]
quantity_options = [1, 2, 3]

# Generate date range from Jan 1, 2024, to Jan 31, 2025
start_date = datetime(2024, 1, 1)
end_date = datetime(2025, 1, 31)
date_range = [start_date + timedelta(days=i) for i in range((end_date - start_date).days + 1)]

# Function to generate orders
def generate_orders(num_orders=1000):
    orders = []
    for order_id in range(1, num_orders + 1):
        city = random.choice(cities)
        product = random.choice(products)
        order_date = random.choice(date_range).strftime("%d-%b-%Y")
        quantity = random.choice(quantity_options)
        
        order_status = random.choice(order_statuses)  # No "Pending" orders
        
        orders.append([order_id, city, product, order_date, quantity, order_status])
    
    return orders

# Generate dataset
dataset = generate_orders(1000)  # Generating 1,000 orders

# Create DataFrame
df = pd.DataFrame(dataset, columns=["Order_ID", "City", "Product", "Order_Date", "Quantity", "Order_Status"])

# Save to CSV
df.to_csv("ecommerce_orders.csv", index=False)

print("Dataset created successfully and saved as 'ecommerce_orders.csv'")


# In[ ]:




