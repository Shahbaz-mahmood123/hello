#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  output:
  file "hello.txt"

  publishDir 'results'
  publishDir 'results_number_2'

  script:
  """
  echo 'Hello, World!' > hello.txt
  """
}


workflow {
  sayHello()
}

