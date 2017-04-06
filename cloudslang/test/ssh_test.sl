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

namespace: io.test.base.test

imports:
  base: io.cloudslang.base
  ssh: io.cloudslang.base.ssh

flow:
  name: ssh_test

  workflow:
    - first_command:
        do:
          ssh.ssh_command:
            - host: "192.168.99.100"
            - port: "32768"
            - command: "ls -la"
            - username: "root"
            - password: "screencast"
            - close_session: "false"
        publish:
            - return_code
            - return_result
        navigate:
          - SUCCESS: print_one
          - FAILURE: FAILURE
    - print_one:
        do:
          base.print.print_text:
            - text: ${ return_result }
        navigate:
            - SUCCESS: second_command
    - second_command:
        do:
          ssh.ssh_command:
            - host: "192.168.99.100"
            - port: "32768"
            - command: "pwd"
            - username: "root"
            - password: "screencast"
            - close_session: "true"
        publish:
            - return_code
            - return_result
        navigate:
          - SUCCESS: print_two
          - FAILURE: FAILURE
    - print_two:
        do:
          base.print.print_text:
            - text: ${ return_result }
        navigate:
            - SUCCESS: SUCCESS
  results:
    - SUCCESS
    - FAILURE
