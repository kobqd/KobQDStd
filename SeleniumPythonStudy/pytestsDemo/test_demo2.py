import pytest


@pytest.mark.smoke
@pytest.mark.skip
def test_firstProgram():
    msg = "Hello"
    assert msg == "Hi", "Test failed because string do not match"

def test_secondProgram():
    a = 4
    b = 6
    assert a + 2 == b, "Err"
