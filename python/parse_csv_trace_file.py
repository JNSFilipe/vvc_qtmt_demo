"""
Parse CSV trace file containing coding unit information.
"""

import pandas as pd


def parse_csv_trace_file(filename: str) -> pd.DataFrame:
    """
    Parse CSV trace file with coding unit information.

    Args:
        filename: Path to CSV trace file

    Returns:
        DataFrame with columns: x, y, w, h, qp
    """
    # Read the file line by line and parse key=value pairs
    data = []
    with open(filename, 'r') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue

            # Skip chroma CU lines - we only want luma CUs
            if line.startswith('[chroma CU]'):
                continue

            # Parse key=value pairs
            pairs = {}
            for item in line.split(','):
                item = item.strip()
                if '=' in item:
                    key, value = item.split('=', 1)
                    pairs[key.strip()] = float(value.strip())

            if pairs:
                data.append(pairs)

    # Create DataFrame
    trace = pd.DataFrame(data)

    # Remove rows with missing values
    trace = trace.dropna()

    return trace
