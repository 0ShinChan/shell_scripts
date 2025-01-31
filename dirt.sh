#!/bin/bash

len=$(find "$1" -type f | wc -l)
echo "$len"

