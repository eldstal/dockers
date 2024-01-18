#!/bin/bash

PATHDIR=${HOME}/.local/bin/dockers
mkdir -p "${PATHDIR}"

for DOCKERFILE in */Dockerfile; do
  TOOLDIR=$(realpath $(dirname "${DOCKERFILE}"))
  TOOLNAME=$(basename $(dirname "${DOCKERFILE}"))

  docker build -t "${TOOLNAME}" "${TOOLDIR}"

  for F in ${TOOLDIR}/*; do
    [ -f "${F}" ] || continue
    [ -x "${F}" ] || continue
    SCRIPTNAME=$(basename "${F}")
    ln -snf "${F}" ${PATHDIR}/${SCRIPTNAME}
  done
done
