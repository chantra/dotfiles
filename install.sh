#!/bin/bash

for i in _*
do
  source="${PWD}/$i"
  target="${HOME}/${i/_/.}"
  if [ ! -L "${target}" ]
  then
    mv -v "${target}" "${target}.bak"
  else
    rm -v ${target}
  fi
  ln -svf "${source}" "${target}"
done

git submodule sync
git submodule init
git submodule update
git submodule foreach git pull origin master
git submodule foreach git submodule init
git submodule foreach git submodule update
