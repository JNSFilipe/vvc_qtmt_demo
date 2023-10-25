%% Add helper functions to path
addpath("matlab/")

%% Read Sequences

[orig_rgb, orig_yuv] = yuv2mov('./sequences/ShakeNDry_640x360_120fps_420_8bit_YUV.yuv', 640, 360, '420');
[mtt_rgb, mtt_yuv] = yuv2mov('./recs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_37_mtt.yuv', 640, 360, '420');
[qt_rgb, qt_yuv] = yuv2mov('./recs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_37_qt.yuv', 640, 360, '420');

%% Play the Oroginal Sequence

figure();
movie(orig_rgb, 2, 120)

%% Show Diff between rec and orig

frame = 1;

dmtt = orig_yuv(frame).cdata(:,:,1)-mtt_yuv(frame).cdata(:,:,1);
dqt  = orig_yuv(frame).cdata(:,:,1)-qt_yuv(frame).cdata(:,:,1);
mmin = min([ min(dmtt(:)), min(dqt(:)) ]);
mmax = max([ max(dmtt(:)), max(dqt(:)) ]);

figure()
subplot(131)
imshow(orig_rgb(frame).cdata);
title('Ref')
subplot(132)
imshow(mtt_rgb(frame).cdata);
title('VVC (MTT)')
subplot(133)
imshow(qt_rgb(frame).cdata);
title('VVC(QT)')

figure()
subplot(121)
imshow(dmtt, [mmin, mmax]);
colormap(gca, jet(70));
colorbar(gca);
title('Ref-VVC (MTT)')
xlabel(sprintf("Y-PSNR: %.2f", psnr(mtt_yuv(frame).cdata(:,:,1), orig_yuv(frame).cdata(:,:,1))));
subplot(122)
imshow(dqt, [mmin, mmax]);
colormap(gca, jet(70));
colorbar(gca);
title('Ref-VVC (QT)')
xlabel(sprintf("Y-PSNR: %.2f", psnr(qt_yuv(frame).cdata(:,:,1), orig_yuv(frame).cdata(:,:,1))));

%% Read trace file

trace_mtt = parseCSVtraceFile('./logs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_37_mtt.csv');
trace_qt = parseCSVtraceFile('./logs/ShakeNDry_640x360_120fps_420_8bit_YUV_qp_37_qt.csv');

%% Plot CUs

figure()
imshow(orig_rgb(1).cdata)
for i = 1: height(trace_mtt) 
    t = table2array(trace_mtt(i,:));
    rectangle('Position',t(1:end-1), 'EdgeColor', 'r', 'LineWidth', 2);
end

for i = 1: height(trace_qt) 
    t = table2array(trace_qt(i,:));
    rectangle('Position',t(1:end-1), 'EdgeColor', 'b', 'LineWidth', 1);
end   

%% Show and compute BD-Rate

mtt_bitrate = [22365.7600, 11907.2000, 6321.2800, 3191.0400];
mtt_ypsnr = [40.4426, 36.6607, 33.9108, 31.5784];
mtt_comp = [259.611, 164.432, 100.040, 68.532];

qt_bitrate = [22941.1200, 12151.3600, 6494.7200, 3247.6800];
qt_ypsnr = [40.3974, 36.5852, 33.8327, 31.4483];
qt_comp = [153.937, 79.511, 29.041, 14.831];

figure()
subplot(211);
plot(mtt_bitrate, mtt_ypsnr, '-o', 'LineWidth', 2);
hold on;
plot(qt_bitrate, qt_ypsnr, '-o', 'LineWidth', 2);
grid on;
legend('VVC (MTT)', 'VVC (QT)')
title('Rate-Distortion Curve');
ylabel('Y-PSNR')
xlabel('Bitrate (kbps)')
subplot(212);
plot(mtt_bitrate, mtt_comp, '-o', 'LineWidth', 2);
hold on;
plot(qt_bitrate, qt_comp, '-o', 'LineWidth', 2);
grid on;
legend('VVC (MTT)', 'VVC (QT)')
title('Rate-Complexity Curve');
ylabel('Encoding Time (s)')
xlabel('Bitrate (kbps)')

fprintf('BD-Rate loss: %.2f%%\n', bdrate(mtt_bitrate, mtt_ypsnr, qt_bitrate, qt_ypsnr));
fprintf('Average Complexity Delta: %.2f%%\n', avgCompDelta(mtt_comp, qt_comp));
