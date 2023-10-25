disable_mtt = false;
qp = 37;

if disable_mtt
    mtt_ctrl = "-mtt 1 ";
    bin_path = ['-b ./bitstreams/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_',num2str(qp),'_qt.vvc '];
    rec_path = ['-o ./recs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_',num2str(qp),'_qt.yuv '];
    log_path = ['--TraceFile="./logs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_',num2str(qp),'_qt.csv"'];
else
    mtt_ctrl = "-mtt 0 ";
    bin_path = ['-b ./bitstreams/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_',num2str(qp),'_mtt.vvc '];
    rec_path = ['-o ./recs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_',num2str(qp),'_mtt.yuv '];
    log_path = ['--TraceFile="./logs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_',num2str(qp),'_mtt.csv"'];
end

if isunix
    exec = "./vvc/linux/DecoderAppStatic ";
elseif ispc
    exec = "./vvc/win/DecoderApp.exe ";
end

command = exec + ...
    "-d 8 " + ...
    bin_path + ...
    rec_path + ...
    '--TraceRule="D_QP:poc==0" ' + ...
    log_path;

disp(command)
system(command);