"""conftest module to set up SparkSession for tests."""

from typing import Generator

import pytest
from pyspark.sql import SparkSession


@pytest.fixture(scope="session", name="fx_spark")
def spark() -> Generator[SparkSession, None, None]:
    """Create a SparkSession for testing purposes."""
    spark_session = (
        SparkSession.builder.master("local[*]")  # type: ignore[attr-defined]
        .appName("TestApp")
        .config("spark.driver.host", "127.0.0.1")
        .config("spark.driver.bindAddress", "127.0.0.1")
        .getOrCreate()
    )
    yield spark_session
    spark_session.stop()
