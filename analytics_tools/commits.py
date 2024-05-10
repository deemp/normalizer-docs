# %%

import pandas as pd
import matplotlib.pyplot as plt

# %%
df = pd.read_csv(
    "../data/commits.csv",
    sep="|",
    header=1,
    names=["Commit SHA", "Developer", "Date", "Commit message"],
)

# %%
df["Developer"] = df["Developer"].str.strip()
df["Date"] = df["Date"].str.strip()
df["Date"] = pd.to_datetime(df["Date"])

df
#%%

df = df[~df["Developer"].isin([ "renovate[bot]", "github-actions[bot]" ])]
# %%

df1 = df[["Developer", "Date"]]

df1

# %%

# Grouping data by 'Date' and 'Developer' and counting occurrences
commit_counts = df1.groupby(["Date", "Developer"]).size().reset_index(name="Commits")
commit_counts = commit_counts[commit_counts["Commits"] > 0]
commit_counts["Commits"] = commit_counts["Commits"].clip(upper=1.)

commit_counts
# %%

# Pivoting the DataFrame to get 'Date' as index and 'Developers' as columns
pivot_table = commit_counts.pivot(index="Date", columns="Developer", values="Commits")
pivot_table.columns.name = None
pivot_table.index.name = None

# Sorting the index to ensure the dates are in chronological order
pivot_table = pivot_table.sort_index()

pivot_table
# %%

df_grouped = pivot_table
date_range = pd.date_range(start=df_grouped.index.min(), end=df_grouped.index.max())
date_range

# %%
df_complete = df_grouped.reindex(date_range)

# take first 20 rows
df_complete.head(20)


# %%

# Plotting
df_complete.plot.bar(stacked=True, figsize=(40, 15))
plt.legend(fontsize=30)
