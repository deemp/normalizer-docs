# %%

import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from datetime import datetime
from matplotlib.ticker import MaxNLocator

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
# %%

df = df[~df["Developer"].isin(["renovate[bot]", "github-actions[bot]"])]
df.loc[df["Developer"] == 'eyihluyc', "Developer"] = "Violetta Sim"
df

# %%

df1 = df[["Developer", "Date"]]

df1

# %%

# Grouping data by 'Date' and 'Developer' and counting occurrences
commit_counts = df1.groupby(["Date", "Developer"]).size().reset_index(name="Commits")
commit_counts = commit_counts[commit_counts["Commits"] > 0]
commit_counts["Commits"] = commit_counts["Commits"].clip(upper=1.0)

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

# from https://stackoverflow.com/a/30135182


def mk_plot(df_: pd.DataFrame, from_date: str, to_date: str):
    from_index = datetime.strptime(from_date, "%Y-%m-%d")
    to_index = datetime.strptime(to_date, "%Y-%m-%d")

    df_sliced = df_[from_index:to_index]
    df_sliced = df_sliced.dropna(axis=1, how="all")

    ax = df_sliced.plot(kind="bar", stacked=True, figsize=(40, 15))
    ax.legend(fontsize=30)

    # Make most of the ticklabels empty so the labels don't get too crowded
    ticklabels = [""] * len(df_sliced.index)
    # Every 4th ticklable shows the month and day
    ticklabels[::4] = [item.strftime("%b %d") for item in df_sliced.index[::4]]
    # Every 12th ticklabel includes the year
    ticklabels[::12] = [item.strftime("%b %d\n%Y") for item in df_sliced.index[::12]]
    ax.tick_params(axis="x", labelsize=30)
    ax.tick_params(axis="y", labelsize=30)
    ax.xaxis.set_major_formatter(ticker.FixedFormatter(ticklabels))
    ax.yaxis.set_major_locator(MaxNLocator(integer=True))
    plt.setp(
        ax.xaxis.get_majorticklabels(), rotation=-45, ha="left", rotation_mode="anchor"
    )
    plt.gcf().autofmt_xdate()


# %%

mk_plot(df_=df_complete, from_date="2024-06-01", to_date="2024-07-29")
