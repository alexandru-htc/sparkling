import pytest

from installed import get_test_df

def test_get_test_df(fx_spark):
    df = get_test_df(fx_spark)
    assert df.count() == 3
    assert df.columns == ["Name", "age"]
    # Additional checks can be added here