#!/bin/bash
acorn build -t ghcr.io/randall-coding/acorn/discourse && \
acorn push ghcr.io/randall-coding/acorn/discourse && \
acorn run -s discource:discource -n discourse ghcr.io/randall-coding/acorn/discourse