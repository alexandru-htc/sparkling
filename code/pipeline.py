# Databricks notebook source
from typing import TYPE_CHECKING

from databricks.sdk.runtime import dbutils as DU
from importer import import_my_csv
from pyspark.sql import SparkSession

if TYPE_CHECKING:
    spark = SparkSession.builder.getOrCreate()

# COMMAND ----------
DU.widgets.dropdown(name="file_to_import",
                    choices=["file1.csv", "file2.csv"],
                    defaultValue="file1.csv",
                    label="Select a file to import")


# COMMAND ----------
file_to_import = DU.widgets.get("file_to_import")
print(f"Selected file to import: {file_to_import}")
df = import_my_csv(name=file_to_import, spark=spark)


# COMMAND ----------
# display(df)   # type: ignore
