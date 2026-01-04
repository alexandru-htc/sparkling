"""Module to create a test DataFrame using PySpark."""
from pyspark.sql import SparkSession, DataFrame

spark: SparkSession = SparkSession.builder.getOrCreate()  # type: ignore


def get_test_df() -> DataFrame:
    "just a test dataframe"
    data = [
        ("Ana", 25),
        ("Bob", 26),
        ("Clark", 27),
    ]
    columns = ["Name", "age"]
    return spark.createDataFrame(data, columns)


if __name__ == "__main__":
    df = get_test_df()
    df.show()
