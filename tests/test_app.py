from app import add_two


def test_add_two_works():
    x = 2
    y = add_two(x)
    assert y == 4
