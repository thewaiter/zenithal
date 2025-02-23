#!/bin/sh
edje_cc $@ -id . -fd . default-dm.edc -o ../MokshaIce.edj
chmod 644 ../MokshaIce.edj
