#!/bin/bash
acorn build -t ghcr.io/randall-coding/acorn/discourse && \
acorn push ghcr.io/randall-coding/acorn/discourse && \
acorn run -n discourse --memory=1Gi ghcr.io/randall-coding/acorn/discourse