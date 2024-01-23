#!/bin/bash

PATHDIR=${HOME}/.local/bin/dockers
mkdir -p "${PATHDIR}"

PATTERN=${1:-*}

for DOCKERFILE in ${PATTERN}/Dockerfile; do
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
