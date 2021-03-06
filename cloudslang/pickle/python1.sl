namespace: test.cloudslang.pickle

operation:
  name: python1

  inputs:
    - hostname

  python_action:
    script: |
      import pickle
      array_p = {"a":["123","1233"], "test":{"asd":123}}
      print array_p
      array = pickle.dumps(array_p)
      returnCode = 0

  outputs:
    - array
  results:
    - SUCCESS: ${ returnCode == 0 }
    - FAILURE
