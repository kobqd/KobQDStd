# pytest file start with test_ or end with _test
# pytest method name start with test
# code wrapped in method only
import pytest


@pytest.mark.smoke
def test_firstProgram():
    print("Hello")

def test_secondProgram():
    print("Good Morning")

def test_crossBrowser(crossBrowser):
    print(crossBrowser)