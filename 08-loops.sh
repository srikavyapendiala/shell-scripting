#!/bin/bash

for  laptop in macbook dell hp lenovo ; do
   echo Laptopname  = $laptop
   sleep 1
done

i=5

while [ $i -gt 0 ]; do
  echo value Z = $i
  i=$(($i-1))
done