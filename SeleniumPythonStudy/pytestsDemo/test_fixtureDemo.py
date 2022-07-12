import pytest


@pytest.mark.usefixtures("setup")
class TestExample:
    def test_fixtureDemo(self):
        print("executing test_fixtureDemo method")

    def test_fixtureDemo1(self):
        print("executing test_fixtureDemo1 method")

    def test_fixtureDemo2(self):
        print("executing test_fixtureDemo2 method")