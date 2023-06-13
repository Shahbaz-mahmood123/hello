#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
asd
  script:
  """
  echo 'Hello, World!' 
  """
}


workflow {
  sayHello()
}

