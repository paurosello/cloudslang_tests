namespace: test.cloudslang.pickle

operation:
  name: python2

  inputs:
    - hostname

  python_action:
    script: |
      import pickle
      array_p = pickle.loads(hostname)
      print array_p
      returnCode = 0

  results:
    - SUCCESS: ${ returnCode == '0' }
    - FAILURE
