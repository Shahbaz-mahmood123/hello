#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {

  script:
  """
  echo 'Hello, World!' 
  """
}


workflow {
  sayHello()
}

