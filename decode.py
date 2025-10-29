import platform
import subprocess

disable_mtt = False
qp = 37

if disable_mtt:
    mtt_ctrl = "-mtt 1 "
    bin_path = f'-b ./bitstreams/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_{qp}_qt.vvc '
    rec_path = f'-o ./recs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_{qp}_qt.yuv '
    log_path = f'--TraceFile="./logs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_{qp}_qt.csv"'
else:
    mtt_ctrl = "-mtt 0 "
    bin_path = f'-b ./bitstreams/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_{qp}_mtt.vvc '
    rec_path = f'-o ./recs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_{qp}_mtt.yuv '
    log_path = f'--TraceFile="./logs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_{qp}_mtt.csv"'

if platform.system() in ['Linux', 'Darwin']:  # Darwin is macOS
    exec_cmd = "./vvc/linux/DecoderAppStatic "
elif platform.system() == 'Windows':
    exec_cmd = ".\\vvc\\windows\\DecoderApp.exe "
else:
    raise OSError(f"Unsupported platform: {platform.system()}")

command = (exec_cmd +
           "-d 8 " +
           bin_path +
           rec_path +
           '--TraceRule="D_QP:poc==0" ' +
           log_path)

print(command)
subprocess.run(command, shell=True)
