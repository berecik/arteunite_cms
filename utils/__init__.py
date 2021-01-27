import math

from .singleton import Singleton
from .tail_recursion import tail_call_optimized


def is_nan(val):
    try:
        return math.isnan(val)
    except TypeError:
        return False


def is_numeric(value):
    try:
        float(value)
        return True
    except Exception:
        return False


def bool_value(value):

    if is_nan(value):
        return False

    try:
        value = float(value)
    except ValueError:
        pass

    return bool(value)