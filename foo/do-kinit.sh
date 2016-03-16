#!/usr/bin/env bash
kinit -V -kt ${KEYTAB} `klist -k ${KEYTAB} | sed -n 4p | awk '{print $2}'`