"""Module to create a test DataFrame using PySpark."""

from pyspark.sql import DataFrame, SparkSession


def get_test_df(spark: SparkSession) -> DataFrame:
    "just a test dataframe"
    data = [
        ("Ana", 25),
        ("Bob", 26),
        ("Clark", 27),
    ]
    columns = ["Name", "age"]
    return spark.createDataFrame(data, columns)
