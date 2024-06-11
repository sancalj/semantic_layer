import pandas as pd
from sklearn.preprocessing import MinMaxScaler
from dbt.context.providers import get_model_context

# Function to scale DataFrame
def min_max_scale_df(df):
    scaler = MinMaxScaler()
    df_scaled = pd.DataFrame(scaler.fit_transform(df), columns=df.columns)
    return df_scaled

# dbt model
def model(dbt, session):
    # Get the context
    context = get_model_context(dbt, session, dbt.config.credentials)

    # Get the input DataFrame (replace 'your_source_table' with your source table name)
    df = context['transformed_hbi']('raw_db', 'hr_raw_')

    # Apply the MinMaxScaler to the DataFrame
    scaled_df = min_max_scale_df(df)

    # Return the transformed DataFrame
    return scaled_df
