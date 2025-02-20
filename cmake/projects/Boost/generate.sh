#!/bin/bash -e

# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# Try ./b2 --show-libraries to look for new libraries
BOOST_LIBS="
    atomic
    chrono
    charconv
    cobalt
    container
    context
    contract
    coroutine
    date_time
    exception
    fiber
    filesystem
    graph
    graph_parallel
    iostreams
    json
    locale
    log
    math
    mpi
    nowide
    predef
    process
    program_options
    python
    random
    regex
    serialization
    signals
    stacktrace
    system
    test
    thread
    timer
    type_erasure
    wave
"

for library in ${BOOST_LIBS};
do
  LIBRARY_UPPER=`echo ${library} | tr '[:lower:]' '[:upper:]'`
  echo "${library} -- ${LIBRARY_UPPER}"

  mkdir -p ${library}
  cp hunter.cmake.in ${library}/hunter.cmake
  sed -i.back "s,boost_component,${library}," ${library}/hunter.cmake
  sed -i.back "s,BOOST_COMPONENT,${LIBRARY_UPPER}," ${library}/hunter.cmake
done
