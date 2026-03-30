import pathlib

from pyspark.sql import DataFrame, SparkSession


def import_my_csv(name:str, spark:SparkSession)->DataFrame:
    """import a csv file and return a DataFrame"""
    pth = "../resources/" + name
    assert pathlib.Path(pth).exists(), f"File not found: {pth}"

    df = spark.read.csv(name, header=True, inferSchema=True)
    return df
