import pytest
from google.auth.credentials import AnonymousCredentials
from google.cloud import bigtable
from google.cloud.bigtable.instance import Instance


@pytest.fixture(scope="session")
def instance() -> Instance:
    return bigtable.Client(
        project="project", credentials=AnonymousCredentials(), admin=True
    ).instance("instance")


@pytest.fixture(scope="session", autouse=True)
def setup_db(instance):
    instance.table("table").create()
