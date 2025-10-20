import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.read_csv("Walmart.csv")
df.info()
df.describe()
df.head()
# Convert Date
df['Date'] = pd.to_datetime(df['Date'], dayfirst=True)


# Check for missing values
print(df.isnull().sum())

# Remove duplicates
df.drop_duplicates(inplace=True)
# Handle missing values (example: fill with mean for numerical columns)
numerical_cols = df.select_dtypes(include=['float64', 'int64']).columns 
for col in numerical_cols:
    df[col].fillna(df[col].mean(), inplace=True)
# Handle missing values (example: fill with mode for categorical columns)
categorical_cols = df.select_dtypes(include=['object']).columns 
for col in categorical_cols:
    df[col].fillna(df[col].mode()[0], inplace=True)

# Extract Month and Year
df['Month'] = df['Date'].dt.month
df['Year'] = df['Date'].dt.year

# Aggregate monthly sales
monthly_sales = df.groupby(['Year', 'Month'])['Weekly_Sales'].sum().reset_index()


sns.barplot(x='Store', y='Weekly_Sales', data=df, estimator=sum)
plt.title("Total Sales per Store")
plt.show()

sns.boxplot(x='Holiday_Flag', y='Weekly_Sales', data=df)
plt.title("Holiday vs Non-Holiday Sales")
plt.show()

df.to_csv("Cleaned_Walmart_Sales.csv", index=False)
