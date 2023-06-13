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

process testingOtherQueue {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
    
}

workflow {
  sayHello()
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola', 'resume pipeline') | testingOtherQueue | view
}

