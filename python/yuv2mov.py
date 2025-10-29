"""
yuv2mov creates arrays from a YUV file.
    yuv2mov('Filename', width, height, format) reads the specified file
    using width and height for resolution and format for YUV-subsampling.

    Filename --> Name of File (e.g. 'Test.yuv')
    width    --> width of a frame  (e.g. 352)
    height   --> height of a frame (e.g. 280)
    format   --> subsampling rate ('400','411','420','422' or '444')

example: frames_rgb, frames_yuv = yuv2mov('Test.yuv', 352, 288, '420')
"""

import numpy as np
import os
from typing import Tuple, List


def yuv2mov(file_path: str, width: int, height: int, format: str) -> Tuple[List[dict], List[dict]]:
    """
    Load YUV video file and return frames in both RGB and YUV format.

    Args:
        file_path: Path to YUV file
        width: Frame width in pixels
        height: Frame height in pixels
        format: YUV subsampling format ('400', '411', '420', '422', '444')

    Returns:
        frames_rgb: List of dictionaries with 'cdata' key containing RGB frames as uint8 arrays
        frames_yuv: List of dictionaries with 'cdata' key containing YUV frames as uint8 arrays
    """
    frames_rgb = []
    frames_yuv = []

    # Set factor for UV-sampling
    if format == '400':
        fwidth = 0
        fheight = 0
    elif format == '411':
        fwidth = 0.25
        fheight = 1
    elif format == '420':
        fwidth = 0.5
        fheight = 0.5
    elif format == '422':
        fwidth = 0.5
        fheight = 1
    elif format == '444':
        fwidth = 1
        fheight = 1
    else:
        raise ValueError('Error: wrong format')

    # Get filesize and frame number
    file_bytes = os.path.getsize(file_path)
    frame_number = int(file_bytes / (width * height * (1 + 2 * fheight * fwidth)))

    if file_bytes % (width * height * (1 + 2 * fheight * fwidth)) != 0:
        raise ValueError('Error: wrong resolution, format or filesize')

    print(f'Loading {frame_number} frames from {file_path}...')

    # Read YUV frames
    for frame_idx in range(frame_number):
        if (frame_idx + 1) % 10 == 0 or frame_idx == 0:
            print(f'Loading frame {frame_idx + 1}/{frame_number}')

        yuv = load_file_yuv(file_path, width, height, frame_idx + 1, fheight, fwidth)
        frames_yuv.append({'cdata': yuv, 'colormap': None})

        # Convert YUV to RGB
        rgb = ycbcr2rgb(yuv)
        frames_rgb.append({'cdata': rgb, 'colormap': None})

    print('Done!')
    return frames_rgb, frames_yuv


def load_file_yuv(file_name: str, width: int, height: int, frame: int,
                  teil_h: float, teil_b: float) -> np.ndarray:
    """
    Load a specific frame from YUV file.

    Args:
        file_name: Path to YUV file
        width: Frame width
        height: Frame height
        frame: Frame number (1-indexed)
        teil_h: Height subsampling factor
        teil_b: Width subsampling factor

    Returns:
        YUV frame as uint8 array of shape (height, width, 3)
    """
    with open(file_name, 'rb') as f:
        # Get size of U and V
        width_h = int(width * teil_b)
        height_h = int(height * teil_h)

        # Compute factor for framesize
        factor = 1 + (teil_h * teil_b) * 2
        framesize = width * height

        # Seek to the correct frame
        f.seek(int((frame - 1) * factor * framesize))

        # Read Y plane
        y_data = np.frombuffer(f.read(width * height), dtype=np.uint8)
        y_matrix = y_data.reshape((height, width))

        # Initialize YUV array
        yuv = np.zeros((height, width, 3), dtype=np.uint8)
        yuv[:, :, 0] = y_matrix

        # Read U and V planes
        if teil_h == 0:
            yuv[:, :, 1] = 127
            yuv[:, :, 2] = 127
        else:
            u_data = np.frombuffer(f.read(width_h * height_h), dtype=np.uint8)
            u_matrix = u_data.reshape((height_h, width_h))

            v_data = np.frombuffer(f.read(width_h * height_h), dtype=np.uint8)
            v_matrix = v_data.reshape((height_h, width_h))

            # Upsample U and V based on subsampling factor
            u_matrix_upsampled = upsample_chroma(u_matrix, height, width, teil_h, teil_b)
            v_matrix_upsampled = upsample_chroma(v_matrix, height, width, teil_h, teil_b)

            yuv[:, :, 1] = u_matrix_upsampled
            yuv[:, :, 2] = v_matrix_upsampled

    return yuv


def upsample_chroma(chroma: np.ndarray, target_h: int, target_w: int,
                    teil_h: float, teil_b: float) -> np.ndarray:
    """
    Upsample chroma component based on subsampling factors.

    Args:
        chroma: Chroma plane (U or V)
        target_h: Target height
        target_w: Target width
        teil_h: Height subsampling factor
        teil_b: Width subsampling factor

    Returns:
        Upsampled chroma plane
    """
    h, w = chroma.shape

    # Width upsampling
    if teil_b == 1:
        upsampled_w = chroma
    elif teil_b == 0.5:
        upsampled_w = np.repeat(chroma, 2, axis=1)
    elif teil_b == 0.25:
        upsampled_w = np.repeat(chroma, 4, axis=1)
    else:
        upsampled_w = chroma

    # Height upsampling
    if teil_h == 1:
        upsampled = upsampled_w
    elif teil_h == 0.5:
        upsampled = np.repeat(upsampled_w, 2, axis=0)
    elif teil_h == 0.25:
        upsampled = np.repeat(upsampled_w, 4, axis=0)
    else:
        upsampled = upsampled_w

    return upsampled[:target_h, :target_w]


def ycbcr2rgb(yuv: np.ndarray) -> np.ndarray:
    """
    Convert YCbCr (YUV) to RGB.

    Args:
        yuv: YUV image as uint8 array of shape (height, width, 3)

    Returns:
        RGB image as uint8 array of shape (height, width, 3)
    """
    # Convert to float for calculations
    yuv_float = yuv.astype(np.float32)

    # Extract Y, Cb, Cr channels
    y = yuv_float[:, :, 0]
    cb = yuv_float[:, :, 1] - 128
    cr = yuv_float[:, :, 2] - 128

    # YCbCr to RGB conversion (ITU-R BT.601)
    r = y + 1.402 * cr
    g = y - 0.344136 * cb - 0.714136 * cr
    b = y + 1.772 * cb

    # Stack channels and clip to valid range
    rgb = np.stack([r, g, b], axis=2)
    rgb = np.clip(rgb, 0, 255).astype(np.uint8)

    return rgb
