#   (c) Copyright 2014-2017 Hewlett-Packard Enterprise Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
########################################################################################################################
#!!
#! @description: Prints text to the screen.
#!
#! @input text: Text to print.
#!
#! @result SUCCESS: Text printed successfully.
#!!#
########################################################################################################################

namespace: io.test.base.pickle

imports:
  base: io.cloudslang.base

flow:
  name: pickle_test

  workflow:
    - step1:
        do:
          test.cloudslang.pickle.python1:
            - hostname: "hello"
        publish:
            - array
        navigate:
            - SUCCESS: print_one
            - FAILURE: FAILURE
    - print_one:
        do:
          base.print.print_text:
            - text: ${ array }
        navigate:
            - SUCCESS: step2
    - step2:
        do:
          test.cloudslang.pickle.python2:
            - hostname: ${ array }
        navigate:
            - SUCCESS: SUCCESS
            - FAILURE: FAILURE
  results:
    - SUCCESS
    - FAILURE
