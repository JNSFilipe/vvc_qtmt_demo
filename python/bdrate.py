"""
Bjontegaard metric calculation for rate-distortion curves.

Bjontegaard's metric allows to compute the average gain in PSNR or the
average per cent saving in bitrate between two rate-distortion curves.

References:
[1] G. Bjontegaard, Calculation of average PSNR differences between
    RD-curves (VCEG-M33)
[2] S. Pateux, J. Jung, An excel add-in for computing Bjontegaard metric and
    its evolution

(c) 2010 Giuseppe Valenzise
"""

import numpy as np


def bdrate(r1: list, psnr1: list, r2: list, psnr2: list) -> float:
    """
    Calculate Bjontegaard-Delta rate metric.

    Args:
        r1: Rate values for curve 1
        psnr1: PSNR values for curve 1
        r2: Rate values for curve 2
        psnr2: PSNR values for curve 2

    Returns:
        Percentage of bitrate saving between data set 1 and data set 2
    """
    # Convert to numpy arrays
    r1 = np.array(r1)
    psnr1 = np.array(psnr1)
    r2 = np.array(r2)
    psnr2 = np.array(psnr2)

    # Convert rates to logarithmic units
    lr1 = np.log(r1)
    lr2 = np.log(r2)

    # Fit 3rd degree polynomial
    p1 = np.polyfit(psnr1, lr1, 3)
    p2 = np.polyfit(psnr2, lr2, 3)

    # Integration interval
    min_int = min(np.min(psnr1), np.min(psnr2))
    max_int = max(np.max(psnr1), np.max(psnr2))

    # Integrate polynomials
    p_int1 = np.polyint(p1)
    p_int2 = np.polyint(p2)

    int1 = np.polyval(p_int1, max_int) - np.polyval(p_int1, min_int)
    int2 = np.polyval(p_int2, max_int) - np.polyval(p_int2, min_int)

    # Calculate average difference
    avg_exp_diff = (int2 - int1) / (max_int - min_int)
    avg_diff = (np.exp(avg_exp_diff) - 1) * 100

    return avg_diff
