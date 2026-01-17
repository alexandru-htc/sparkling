"""testing using spark"""

from installed import get_test_df
from pyspark.sql import SparkSession


def test_get_test_df(fx_spark: SparkSession) -> None:
    """just a simple test to check if the DataFrame is created correctly"""
    df = get_test_df(fx_spark)
    assert df.count() == 3
    assert df.columns == ["Name", "age"]
    # Additional checks can be added here
