#!/bin/bash
for file in janus.samples/*
do
    if test -f $file
    then
      target=${file##*/}
      target="janus/${target%.jcfg.sample}.cfg"
      bin/janus-cfgconv $file $target
    else
            for subfile in $file
                    do
                            if test -f $subfile
                            then
                                    echo $file
                            fi
                    done
    fi
done