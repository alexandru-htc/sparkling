import pathlib
from typing import TYPE_CHECKING

from pyspark.sql import DataFrame, SparkSession

if TYPE_CHECKING:
    spark = SparkSession.builder.getOrCreate()

def import_my_csv(name:str)->DataFrame:
    """import a csv file and return a DataFrame"""
    pth = "../resources/" + name
    assert pathlib.Path(pth).exists(), f"File not found: {pth}"

    df = spark.read.csv(name, header=True, inferSchema=True)
    return df
