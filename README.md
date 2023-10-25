# vvc_qtmt_demo
A demo showing the complexity and RD impact of enabling and disabling MTT

## Important Files and Folders

`encode.m` - encode the raw video file and produce the encoded bitstream
`decode.m` - decode the bitstream and produce a reconstrucetd video sequence
`bitstreams/` - folder where the encoded bitstreams are going to be stored
`recs/` - folder where the reconstructed files are going to be stored
`logs/` - folder where the CU partition informatios is going to be stored
`sequences` - folder where the original sequences are stored
`lab_script.m` - analyse the results of the encoding/decoding

## Steps

1. Run `encode.m` with both `mtt_disble` at `true` and `false`. Verify that the beatstreams are produced. Register the bitrate, time, and Y-PSNR.
2. Run `decode.m` with both `mtt_disble` at `true` and `false`. Verify that the reconstructed files are produced.
3. Open `lab_script.m`. Run Section by section. Complete lines 70 through 76 with the values of bitrate, time, and Y-PSNR that were previously registred.
