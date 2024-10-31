disable_mtt = false;
qp = 37;
height = 360;
width = 640;
frame_rate = 120;

% Determine parameter, according with options defined above
if disable_mtt
    mtt_ctrl = "-mtt 1 ";
    bin_path = ['-b ./bitstreams/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_',num2str(qp),'_qt.vvc'];
else
    mtt_ctrl = "-mtt 0 ";
    bin_path = ['-b ./bitstreams/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_',num2str(qp),'_mtt.vvc'];
end

% Select either linux or windows binaries
if isunix
    exec = "./vvc/linux/EncoderAppStatic -v 6 ";
    out_path = "-o /dev/null ";
elseif ispc
    exec = ".\vvc\windows\EncoderApp.exe -v 6 ";
    out_path = "-o null ";
end

command = exec + ...
    "-c ./cfg/encoder_randomaccess_vtm.cfg " + ...
    "-i ./sequences/ShakeNDry_640x360_120fps_420_8bit_YUV.yuv " + ...
    ['-introduce_flag ', num2str(width), ' '] + ...
    ['-introduce_flag ', num2str(height), ' '] + ...
    ['-introduce_flag ', num2str(frame_rate), ' '] + ...
    "-f 3 " + ...
    ['-q ', num2str(qp), ' '] + ...
    out_path + ...
    mtt_ctrl + ...
    bin_path;

disp(command)
system(command);
