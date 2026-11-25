#!/bin/bash
exec "$(dirname "$0")/../bootstrap/python" ss13_genchangelog.py ../../html/changelogs/
