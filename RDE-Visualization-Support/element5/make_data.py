import pandas as pd

datasets = pd.read_csv('data environments and data sets.csv', index_col='dataset id')
tags = pd.read_csv('tags and datasets.csv', index_col='Dataset ID')

datasets.index.name = 'dataset_id'
tags.index.name = 'dataset_id'

joined = datasets.join(tags, how='left')

joined = joined.drop(['Data Set',], axis=1)

joined = joined.rename(columns=lambda x: x.lower().replace(' ', '_'))

joined.to_csv('data/rde.csv', index=True)
