"""
Calculate average complexity delta between two encoding methods.
"""

import numpy as np


def avg_comp_delta(cr: list, cm: list) -> float:
    """
    Calculate average complexity delta.

    Args:
        cr: Reference complexity values (list or array)
        cm: Method complexity values (list or array)

    Returns:
        Average complexity delta as percentage
    """
    cr = np.array(cr)
    cm = np.array(cm)

    cd = np.mean((cm - cr) / cr) * 100

    return cd
