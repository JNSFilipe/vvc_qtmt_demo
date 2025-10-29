import platform
import subprocess
import os

disable_mtt = False
qp = 37
height = 360
width = 640
frame_rate = 120

# Determine parameter, according with options defined above
if disable_mtt:
    mtt_ctrl = "-mtt 1 "
    bin_path = f'-b ./bitstreams/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_{qp}_qt.vvc'
else:
    mtt_ctrl = "-mtt 0 "
    bin_path = f'-b ./bitstreams/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_{qp}_mtt.vvc'

# Select either linux or windows binaries
if platform.system() == 'Darwin':  # Darwin is macOS
    exec_cmd = "./vvc/macos/EncoderApp -v 6 "
    out_path = f"-o {os.devnull} "
elif platform.system() == 'Linux':  # Darwin is macOS
    exec_cmd = "./vvc/linux/EncoderAppStatic -v 6 "
    out_path = f"-o {os.devnull} "
elif platform.system() == 'Windows':
    exec_cmd = ".\\vvc\\windows\\EncoderApp.exe -v 6 "
    out_path = "-o null "
else:
    raise OSError(f"Unsupported platform: {platform.system()}")

command = (exec_cmd +
           "-c ./cfg/encoder_randomaccess_vtm.cfg " +
           "-i ./sequences/ShakeNDry_640x360_120fps_420_8bit_YUV.yuv " +
           f'-introduce_flag {width} ' +
           f'-introduce_flag {height} ' +
           f'-introduce_flag {frame_rate} ' +
           "-f 3 " +
           f'-q {qp} ' +
           out_path +
           mtt_ctrl +
           bin_path)

print(command)
subprocess.run(command, shell=True)
