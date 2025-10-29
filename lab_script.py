#!/usr/bin/env python3
"""
Lab script for VVC (Versatile Video Coding) analysis.
Compares MTT (Multi-Type Tree) and QT (Quad-Tree) partitioning methods.

Translated from MATLAB to Python.
"""

import sys
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import matplotlib.animation as animation
from skimage.metrics import peak_signal_noise_ratio as psnr

# Add helper functions to path
sys.path.insert(0, './python')

from yuv2mov import yuv2mov
from parse_csv_trace_file import parse_csv_trace_file
from bdrate import bdrate
from avg_comp_delta import avg_comp_delta


def main():
    # Read Sequences
    print("Reading sequences...")
    orig_rgb, orig_yuv = yuv2mov('./sequences/ShakeNDry_640x360_120fps_420_8bit_YUV.yuv', 640, 360, '420')
    mtt_rgb, mtt_yuv = yuv2mov('./recs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_37_mtt.yuv', 640, 360, '420')
    qt_rgb, qt_yuv = yuv2mov('./recs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_37_qt.yuv', 640, 360, '420')

    # Play the Original Sequence
    print("\nPlaying original sequence...")
    print("Close the playback window to continue with analysis.")

    fig_video = plt.figure(figsize=(10, 6))
    ax_video = plt.gca()
    ax_video.axis('off')

    # Initialize with first frame
    im = ax_video.imshow(orig_rgb[0]['cdata'])
    title = ax_video.set_title(f'Original Sequence - Frame 1/{len(orig_rgb)}')

    def update_frame(frame_num):
        """Update function for animation"""
        im.set_array(orig_rgb[frame_num]['cdata'])
        title.set_text(f'Original Sequence - Frame {frame_num + 1}/{len(orig_rgb)}')
        return [im, title]

    # Create animation - 120fps at 30fps playback = 4x slower
    # interval is in milliseconds, so 1000/30 ≈ 33ms per frame
    anim = animation.FuncAnimation(
        fig_video,
        update_frame,
        frames=len(orig_rgb),
        interval=33,  # ~30 fps playback
        blit=True,
        repeat=True
    )

    plt.tight_layout()
    plt.show()

    print("Playback finished. Continuing with analysis...")

    # Show Diff between rec and orig
    frame = 0  # Python uses 0-indexing

    # Calculate differences for Y channel
    dmtt = orig_yuv[frame]['cdata'][:, :, 0].astype(np.float32) - mtt_yuv[frame]['cdata'][:, :, 0].astype(np.float32)
    dqt = orig_yuv[frame]['cdata'][:, :, 0].astype(np.float32) - qt_yuv[frame]['cdata'][:, :, 0].astype(np.float32)
    mmin = min(dmtt.min(), dqt.min())
    mmax = max(dmtt.max(), dqt.max())

    # Plot original and reconstructed frames
    fig1 = plt.figure(figsize=(15, 5))

    plt.subplot(1, 3, 1)
    plt.imshow(orig_rgb[frame]['cdata'])
    plt.title('Ref')
    plt.axis('off')

    plt.subplot(1, 3, 2)
    plt.imshow(mtt_rgb[frame]['cdata'])
    plt.title('VVC (MTT)')
    plt.axis('off')

    plt.subplot(1, 3, 3)
    plt.imshow(qt_rgb[frame]['cdata'])
    plt.title('VVC (QT)')
    plt.axis('off')

    plt.tight_layout()

    # Plot difference maps
    fig2 = plt.figure(figsize=(12, 5))

    plt.subplot(1, 2, 1)
    im1 = plt.imshow(dmtt, vmin=mmin, vmax=mmax, cmap='jet')
    plt.colorbar(im1)
    plt.title('Ref-VVC (MTT)')
    mtt_psnr = psnr(orig_yuv[frame]['cdata'][:, :, 0], mtt_yuv[frame]['cdata'][:, :, 0], data_range=255)
    plt.xlabel(f"Y-PSNR: {mtt_psnr:.2f}")
    plt.axis('off')

    plt.subplot(1, 2, 2)
    im2 = plt.imshow(dqt, vmin=mmin, vmax=mmax, cmap='jet')
    plt.colorbar(im2)
    plt.title('Ref-VVC (QT)')
    qt_psnr = psnr(orig_yuv[frame]['cdata'][:, :, 0], qt_yuv[frame]['cdata'][:, :, 0], data_range=255)
    plt.xlabel(f"Y-PSNR: {qt_psnr:.2f}")
    plt.axis('off')

    plt.tight_layout()

    # Read trace file
    print("\nReading trace files...")
    trace_mtt = parse_csv_trace_file('./logs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_37_mtt.csv')
    trace_qt = parse_csv_trace_file('./logs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_37_qt.csv')

    # Plot CUs (Coding Units)
    fig3 = plt.figure(figsize=(10, 6))
    ax = plt.gca()
    plt.imshow(orig_rgb[0]['cdata'])

    # Draw MTT rectangles in red
    for idx, row in trace_mtt.iterrows():
        rect = patches.Rectangle(
            (row['x'], row['y']), row['w'], row['h'],
            linewidth=2, edgecolor='r', facecolor='none'
        )
        ax.add_patch(rect)

    # Draw QT rectangles in blue
    for idx, row in trace_qt.iterrows():
        rect = patches.Rectangle(
            (row['x'], row['y']), row['w'], row['h'],
            linewidth=1, edgecolor='b', facecolor='none'
        )
        ax.add_patch(rect)

    plt.title('Coding Units: MTT (red) vs QT (blue)')
    plt.axis('off')
    plt.tight_layout()

    # Show and compute BD-Rate
    mtt_bitrate = [22365.7600, 11907.2000, 6321.2800]
    mtt_ypsnr = [40.4426, 36.6607, 33.9108]
    mtt_comp = [259.611, 164.432, 100.040]

    qt_bitrate = [22941.1200, 12151.3600, 6494.7200]
    qt_ypsnr = [40.3974, 36.5852, 33.8327]
    qt_comp = [153.937, 79.511, 29.041]

    # Plot Rate-Distortion and Rate-Complexity curves
    fig4 = plt.figure(figsize=(10, 10))

    plt.subplot(2, 1, 1)
    plt.plot(mtt_bitrate, mtt_ypsnr, '-o', linewidth=2, label='VVC (MTT)')
    plt.plot(qt_bitrate, qt_ypsnr, '-o', linewidth=2, label='VVC (QT)')
    plt.grid(True)
    plt.legend()
    plt.title('Rate-Distortion Curve')
    plt.ylabel('Y-PSNR')
    plt.xlabel('Bitrate (kbps)')

    plt.subplot(2, 1, 2)
    plt.plot(mtt_bitrate, mtt_comp, '-o', linewidth=2, label='VVC (MTT)')
    plt.plot(qt_bitrate, qt_comp, '-o', linewidth=2, label='VVC (QT)')
    plt.grid(True)
    plt.legend()
    plt.title('Rate-Complexity Curve')
    plt.ylabel('Encoding Time (s)')
    plt.xlabel('Bitrate (kbps)')

    plt.tight_layout()

    # Calculate and print metrics
    bd_rate_loss = bdrate(mtt_bitrate, mtt_ypsnr, qt_bitrate, qt_ypsnr)
    avg_comp_delta_val = avg_comp_delta(mtt_comp, qt_comp)

    print(f'\nBD-Rate loss: {bd_rate_loss:.2f}%')
    print(f'Average Complexity Delta: {avg_comp_delta_val:.2f}%\n')

    # Show all plots
    plt.show()


if __name__ == '__main__':
    main()
