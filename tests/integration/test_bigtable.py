def test_bigtable_table_count(instance):
    assert len(instance.list_tables()) == 1
