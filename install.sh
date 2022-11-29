#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-${HOME}/.config}

set -x

function link_file {
  source="${1}"
  target="${2}"
  if [ ! -L "${target}" ]
  then
    mv -v "${target}" "${target}.bak"
  else
    rm -v "${target}"
  fi
  ln -svf "${source}" "${target}"
}


for i in xdg_configs/*
do
  source_dir="${PWD}/$i"
  target_dir="${XDG_CONFIG_HOME}/$(basename "${i}")"
  if [[ ! -d "${target_dir}" ]]
  then
    mkdir "${target_dir}"
  fi
  for j in "${source_dir}"/*
  do
    source="${j}"
    target="${XDG_CONFIG_HOME}/$(basename "${i}")/$(basename "${j}")"
    link_file "${source}" "${target}"
  done
done

for i in _*
do
  source="${PWD}/$i"
  target="${HOME}/${i/_/.}"
  link_file "${source}" "${target}"
done

git submodule sync
git submodule init
git submodule update
git submodule foreach git pull origin master
git submodule foreach git submodule init
git submodule foreach git submodule update
