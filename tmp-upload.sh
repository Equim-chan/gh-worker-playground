#!/bin/bash

echo -n "SHA256SUM: " >&2
URL="$(tee >(sha256sum | cut -d' ' -f1 >&2) | curl -SsL -F 'file=@-;filename=x.bin' 'https://tmp.ninja/api.php?d=upload-tool')"
REAL_PATH="$(curl -SsL "$URL" | grep -Po "/files/[^']+")"
echo "https://a.tmp.ninja$REAL_PATH" >&2
