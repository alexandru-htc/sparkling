"""Module to create a test DataFrame using PySpark."""

from pyspark.sql import DataFrame, SparkSession


def get_test_df(spark: SparkSession) -> DataFrame:
    "just a test dataframe"
    data: list[tuple[str, int]] = [
        ("Ana", 25),
        ("Bob", 26),
        ("Clark", 27),
    ]
    columns: list[str] = ["Name", "age"]
    return spark.createDataFrame(data, schema=columns)
