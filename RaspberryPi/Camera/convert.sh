#!/bin/bash

echo "Converting h264 Files to MP4"

for f in *.h264; do
  echo "Processing $f file..."
  MP4Box -add $f $f.mp4
done
